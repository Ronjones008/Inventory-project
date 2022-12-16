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
import javax.transaction.Transaction;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

@ManagedBean
@SessionScoped
public class StockDAO {
	
	SessionFactory sessionFactory;
	//generate Stock id
	
	public String generateStockid() {	
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(StockDetails.class);
		List<StockDetails> stockList = cr.list();
		session.close();
		if( stockList.size()==0) {
			return "S001";
	
		}
		else {
			String id = stockList.get(stockList.size()-1).getStockid();
			int id1 = Integer.parseInt(id.substring(1));
			id1++;
			String id2 = String.format("S%03d", id1);
     		return id2;		
		}	
		
	}
    //Validations
    public void validateName(FacesContext context, UIComponent comp, Object value) {
    	System.out.println("inside validate method");
    	String mno = (String) value;
        String pattern = "(?=.*[a-z])(?=.*[A-Z])(?=.*[\\s]).{8,}";
        boolean result = mno.matches(pattern);
        
        if(result==false) {
        	((UIInput) comp).setValid(false);
            FacesMessage message = new FacesMessage("invalid Name");
            context.addMessage(comp.getClientId(context), message);
        }
    }
	
	//Add StockDetails
	
	
	public String addstockDetails(StockDetails stockDetails) throws IOException {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		String stockid=generateStockid();
		stockDetails.setStockid(stockid);
		Criteria cr = session.createCriteria(StockDetails.class);
		cr.add(Restrictions.eq("itemName", stockDetails.getItemName()));
		
		List<StockDetails> stockList = cr.list();
		FacesContext context = FacesContext.getCurrentInstance();
        ExternalContext externalContext = context.getExternalContext();
        
        if(stockList.size() > 0) {
        	externalContext.redirect("Addstock.xhtml?exist=Stock already exist");
 	        return null;
        } 	
	        org.hibernate.Transaction tran =  session.beginTransaction();
			session.save(stockDetails);
			tran.commit();
			externalContext.redirect("ShowStockAdmin.jsp");
	        return null;
        
        
    }
		
		
	
	
		public List<StockDetails> ShowStock() {
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(StockDetails.class);
			List<StockDetails> stockList = cr.list();
			return stockList;
			
		}
		
		public StockDetails searchStock(String stockid) {
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession(); 
			Criteria cr = session.createCriteria(StockDetails.class);
			cr.add(Restrictions.eq("stockid",stockid));
			List<StockDetails> itemList=cr.list();
			
			return itemList.get(0);
		}
		
		public int searchitem(String stockname){
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			
			Criteria cr = session.createCriteria(StockDetails.class);
			cr.add(Restrictions.eq("itemName",stockname));
			List<Customer> itemList=cr.list();
			
			return itemList.size();
			
		}
		public String updateStock(StockDetails stockDetails){
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			org.hibernate.Transaction transaction = session.beginTransaction();
			session.saveOrUpdate(stockDetails);
			transaction.commit();
			return "Stock updated Successsfully...";
		}
}