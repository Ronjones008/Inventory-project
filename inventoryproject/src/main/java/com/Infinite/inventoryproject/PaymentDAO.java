package com.Infinite.inventoryproject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class PaymentDAO {
	SessionFactory sessionFactory;
	
	public String addPayment(Payment payments) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		payments.setUpi(UPI.PHONEPE);
		payments.setNetBanking(NetBanking.HDFCBank);
		payments.setCards(Cards.CREDIT);
		//payments.setWallet(Wallet.PhonepeWallet);
		Transaction transaction = session.beginTransaction();
		session.save(payments);
		transaction.commit();
		session.close();
		
		return "Payment Added Successfully";
	}

}
