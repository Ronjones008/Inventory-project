package com.Infinite.inventoryproject;


import java.io.IOException;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.component.UIInput;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
@ManagedBean
@SessionScoped
public class CustomerDAO{

	SessionFactory sessionFactory;
	
	 public void validateMobNo(FacesContext context, UIComponent comp, Object value) {

		 System.out.println("inside validate method");
		 String mno = (String) value;
		        boolean flag=false;
		        if (mno.matches("\\d{10}"))  
	        { flag=true;}
	        
	          if(flag==false) {
	              ((UIInput) comp).setValid(false);



	               FacesMessage message = new FacesMessage("invalid Mobile Number");
	                context.addMessage(comp.getClientId(context), message);
	          }
	    }
	
//	public String addCustomer(Customer customer) throws IOException{
//	sessionFactory = SessionHelper.getConnection();
//	Session session = sessionFactory.openSession();
//	int Customerid=generateCustomerid();
//	Transaction transaction = session.beginTransaction();
//	customer.setCustomerid(Customerid);
//	session.save(customer);
//	transaction.commit();
//	session.close();
//	FacesContext context = FacesContext.getCurrentInstance();
//	ExternalContext externalContext = context.getExternalContext();
//	externalContext.redirect("CustomerLoginjsp.jsp");
//	return null;
//	}
	public String addCustomer(Customer customer) throws IOException{
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		int Customerid=generateCustomerid();
		
		Criteria cr=session.createCriteria(Customer.class);
		cr.add(Restrictions.eq("userName",customer.getUserName()));
		List<Customer> custList = cr.list();
		
		
		
		FacesContext context = FacesContext.getCurrentInstance();
        ExternalContext externalContext = context.getExternalContext();
        
        if (custList.size() > 0) {
        	externalContext.redirect("AddCustomer.xhtml?exist=Customer name already exist");
            return null;}
        else if (custList.size() == 0){
	        org.hibernate.Transaction tran =  session.beginTransaction();
			session.save(customer);
			tran.commit();
            externalContext.redirect("CustomerLoginjsp.jsp");
            return null;         
        }return null;
        }

	
	private int generateCustomerid() {
		return 0;
	}

	 public int authenticate(String user,String password){
	        sessionFactory = SessionHelper.getConnection();
	        Session session = sessionFactory.openSession();
	        Criteria criteria = session.createCriteria(Customer.class);
	        criteria.add(Restrictions.eq("userName", user));
	        criteria.add(Restrictions.eq("passCode", password));
	        List<Customer>cuList = criteria.list();
	        return cuList.size();
	        
	            }
	
//	public String updateCustomer(Customer customer){
//		sessionFactory = SessionHelper.getConnection();
//		Session session = sessionFactory.openSession();
//		
//		Transaction transaction = session.beginTransaction();
//		session.update(customer);
//		transaction.commit();
//		
//		return "Customer Record Updated";
//	}
	public String updateCustomer(Customer customer){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
//		Customer customer2 = searchCustomer(customer.getCustomerid());
		
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(customer);
		transaction.commit();
		
		return "Customer Details Added";
	}
	
	public Customer searchCustomer(int customerid) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession(); 
		Criteria cr = session.createCriteria(Customer.class);
		cr.add(Restrictions.eq("customerid", customerid));
		List<Customer> customerList = cr.list();
		return customerList.get(0);
	}
	
	
	public int searchCustomerphone(String userName,String phoneno) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession(); 
		Criteria cr = session.createCriteria(Customer.class);
		cr.add(Restrictions.eq("userName", userName));
		cr.add(Restrictions.eq("customerPhoneNo", phoneno));
		List<Customer> customerList = cr.list();
		return customerList.size();
	}
	public Customer searchCustomeruser(String userName) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession(); 
		Criteria cr = session.createCriteria(Customer.class);
		cr.add(Restrictions.eq("userName", userName));
		List<Customer> customerList = cr.list();
		return customerList.get(0);
		
	}
	public List<Customer> showCustomer( ) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Customer.class);
		List<Customer> customerList = cr.list();		
		return customerList;
	}

}