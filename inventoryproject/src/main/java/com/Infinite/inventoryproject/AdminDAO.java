package com.Infinite.inventoryproject;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


@ManagedBean
@SessionScoped

public class AdminDAO {

	SessionFactory sessionFactory;

	public int authenticate(String user, String password) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Admin.class);
		criteria.add(Restrictions.eq("userName", user));
		criteria.add(Restrictions.eq("passWord", password));
		List<Admin> aList = criteria.list();
		return aList.size();
	}
    public String validate(Admin admin) {
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Criteria cr = session.createCriteria(Admin.class);
        cr.add(Restrictions.eq("userName", admin.getUserName()));
        cr.add(Restrictions.eq("passWord", admin.getPassWord()));
    
        List<Admin> Alist = cr.list();
        if(Alist.size()==1) {
            return "AdminMenu.xhtml?faces-redirect=true";
        }else {
            return "AdminLogin.xhtml?exist=Invalid Credentials";
        }
    }


		
		
	

	public String addAdmin(Admin admin) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		String Adminid = GenerateAdminId();
		admin.setAdminId(Adminid);
		Transaction transaction = session.beginTransaction();
		session.save(admin);
		transaction.commit();
		session.close();
		return " Added Successsfully...";
	}

	public String GenerateAdminId() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Admin.class);
		List<Admin> stockList = cr.list();
		session.close();
		if (stockList.size() == 0) {
			return "A001";

		} else {
			String id = stockList.get(stockList.size() - 1).getAdminId();
			int id1 = Integer.parseInt(id.substring(1));
			id1++;
			String id2 = String.format("A%03d", id1);
			return id2;
		}

	}

}
