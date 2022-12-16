package com.Infinite.inventoryproject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Payment")
public class Payment {
	
	@Id
	@Column(name="Customerid")
	private int customerid;
	
	@Column(name="Upi")
	@Enumerated(EnumType.STRING)
	private UPI upi;
	
	@Column(name="NetBanking")
	@Enumerated(EnumType.STRING)
	private NetBanking netBanking; 
	
	@Column(name="Cards")
	@Enumerated(EnumType.STRING)
	private Cards cards;
	
	@Column(name="Wallet")
	@Enumerated(EnumType.STRING)
	private Wallet Wallet;
	
	@Column(name="GiftVoucher")
	private String giftVoucher;

	@Override
	public String toString() {
		return "Payment [customerid=" + customerid + ", upi=" + upi + ", netBanking=" + netBanking + ", cards=" + cards
				+ ", Wallet=" + Wallet + ", giftVoucher=" + giftVoucher + "]";
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public UPI getUpi() {
		return upi;
	}

	public void setUpi(UPI upi) {
		this.upi = upi;
	}

	public NetBanking getNetBanking() {
		return netBanking;
	}

	public void setNetBanking(NetBanking netBanking) {
		this.netBanking = netBanking;
	}

	public Cards getCards() {
		return cards;
	}

	public void setCards(Cards cards) {
		this.cards = cards;
	}

	public Wallet getWallet() {
		return Wallet;
	}

	public void setWallet(Wallet wallet) {
		Wallet = wallet;
	}

	public String getGiftVoucher() {
		return giftVoucher;
	}

	public void setGiftVoucher(String giftVoucher) {
		this.giftVoucher = giftVoucher;
	}

	

		
	
}