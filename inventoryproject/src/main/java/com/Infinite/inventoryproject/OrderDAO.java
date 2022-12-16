package com.Infinite.inventoryproject;



import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;



public class OrderDAO {
	SessionFactory sessionFactory;
	
	public String generateOrderId(){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Order.class);
		 List<Order> ordersList = cr.list();
		 if(ordersList.size()==0){
			 return "O001";
		 }
		 String id = ordersList.get(ordersList.size()-1).getOrderId();
		 int id1 = Integer.parseInt(id.substring(1));
		 id1++;
		 String id2 = String.format("O%03d", id1);
		return id2;
	}
	public List<Order> showorder(String userName) {
		return (List<Order>) SessionHelper.getConnection().openSession().createQuery("from Order where userName=:userName").setParameter("userName",userName).list();
		}
	
	public Date convertDate(java.util.Date dt){
        java.sql.Date sqlDate=new java.sql.Date(dt.getTime());
        return sqlDate;
    }
	
	public String addOrder(Order order){
		
     	 
		String orderId=generateOrderId();
		order.setOrderId(orderId);
	
	
		
		java.sql.Date orderDate = new java.sql.Date(new Date().getTime());
		order.setOrderedDate(orderDate);
		
		java.sql.Date shippingDate = new java.sql.Date(new Date().getTime()+2*24*60*60*1000);
		order.setShippingDate(shippingDate);
		
		java.sql.Date expecteddelDate = new java.sql.Date(new Date().getTime()+4*24*60*60*1000);
		order.setExpecteddeliveryDate(expecteddelDate);
		
		StockDetails stockDetails = new StockDAO().searchStock(order.getStockId());
		
		if(order.getQuantityOrder() > stockDetails.getQuantityAvail() ){
	    	order.setOrderStatus(OrderStatus.ORDER_NOT_AVAILABLE);
	    }else if (order.getQuantityOrder() <= stockDetails.getQuantityAvail()) {
	    	order.setOrderStatus(OrderStatus.ACCEPTED);
			
		}
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
	  	Transaction trans=session.beginTransaction();
	    session.save(order);
	    trans.commit();
	    session.close();
	    
	    session = sessionFactory.openSession();
	  
		if(order.getQuantityOrder() < stockDetails.getQuantityAvail() ){
			stockDetails.setQuantityAvail(stockDetails.getQuantityAvail() - order.getQuantityOrder());
	    }
	    trans=session.beginTransaction();
	    session.update(stockDetails); 
	    trans.commit();
	    session.close();
	    
		return "Added Order.";
		
	}
	
	public List<Order> searchOrder(String orderId){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Criteria cr = session.createCriteria(Order.class);
		cr.add(Restrictions.eq("orderId",orderId));
		List<Order> OrderList=cr.list();
		
		return OrderList;
		
	}


	public String updateOrder(Order order){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
        Criteria cr = session.createCriteria(Order.class);
        String orderId=generateOrderId();
        order.setOrderId(orderId);
		java.sql.Date sqlDate = new java.sql.Date(order.getOrderedDate().getTime());
		order.setOrderedDate(sqlDate);
    	java.sql.Date sqlDate1 = new java.sql.Date(order.getDeliveryDate().getTime());
		order.setDeliveryDate(sqlDate1);
		java.sql.Date sqlDate2 = new java.sql.Date(order.getShippingDate().getTime());
		order.setShippingDate(sqlDate2);
    	java.sql.Date sqlDate3 = new java.sql.Date(order.getExpecteddeliveryDate().getTime());
		order.setExpecteddeliveryDate(sqlDate3);
		order.setOrderedDate(sqlDate);
		order.setDeliveryDate(sqlDate1);
		order.setShippingDate(sqlDate2);
		order.setExpecteddeliveryDate(sqlDate3);
		Transaction trans = session.beginTransaction();
			
	    session.save(order);
	    trans.commit();
	    session.close();
        return "Update Order";
    }
	
	public double calcTotal(String username){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Query query=session.createQuery("select sum(totalPrice) from Order where orderStatus= 'ACCEPTED' and username=:username").setParameter("username", username);
		List<Double> count =query.list();
		
		Double b=(Double)count.get(0);
		
		if(b==null){
			return 0;
		}
		session.close();
		return count.get(0);
	}
	
	public String cancelOrder(String orderId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Order order = searchOrder(orderId).get(0);
		order.setOrderStatus(OrderStatus.CANCELLED);
		
		Transaction trans = session.beginTransaction();
		session.update(order);
		trans.commit();
		
		
		StockDetails stockDetails = new StockDAO().searchStock(order.getStockId());
		stockDetails.setQuantityAvail(stockDetails.getQuantityAvail() + order.getQuantityOrder());
		
		session = sessionFactory.openSession();
		trans = session.beginTransaction();
		session.update(stockDetails);
		trans.commit();
		
		
		System.out.println("jdksajda");
		
		return "Order cancelled";
	}
	
	public String hello() {
		return "Hello";
	}
}
