package com.Infinite.inventoryproject;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

@ManagedBean
@SessionScoped
public class WalletDAO {

	SessionFactory sessionFactory;
	
	public List<Wallet> searchWallet(int cId){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr=session.createCriteria(Wallet.class);
		cr.add(Restrictions.eq("customerid", cId));
		List<Wallet> walletList=cr.list();
		return walletList;
	}
	public String GenerateWalletid() {	
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Wallet.class);
		List<Wallet> walletlist = cr.list();
		session.close();
		if( walletlist.size()==0) {
			return "W001";
	
		}
		else {
			String id = walletlist.get(walletlist.size()-1).getWalletId();
			int id1 = Integer.parseInt(id.substring(1));
			id1++;
			String id2 = String.format("W%03d", id1);
     		return id2;		
		}	
		
	}
	public List<Order> searchCustomer(String userName) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession(); 
		Criteria cr = session.createCriteria(Order.class);
		Criterion criterion=Restrictions.eq("userName", userName);
		Criterion criterion2=Restrictions.eq("orderStatus", OrderStatus.ACCEPTED);
		cr.add(Restrictions.and(criterion, criterion2));
		List<Order> customerList = cr.list();
		return customerList;
	}
	public String addWallet(Wallet wallet) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		String walletId=GenerateWalletid();
		wallet.setWalletId(walletId);
		org.hibernate.Transaction tran =  session.beginTransaction();
		session.save(wallet);
		tran.commit();
		//Order order= new Order();
		List<Order> order=searchCustomer(wallet.getUserName());
		for (Order order2 : order) {
			order2.setOrderStatus(OrderStatus.ORDERED);
			tran=session.beginTransaction();
			session.update(order2);
			tran.commit();
		}
		
		return "Payment details Added";
		
		
	}
	public List<Wallet> ShowWallet() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Wallet.class);
		List<Wallet> walletList = cr.list();
		return walletList;
	}
}