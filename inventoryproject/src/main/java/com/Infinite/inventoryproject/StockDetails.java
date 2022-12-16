package com.Infinite.inventoryproject;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Stock")
@ManagedBean
@SessionScoped
public class StockDetails implements Serializable {

	
	
	@Id
	@Column(name="stockid")
	 private String stockid;
	
	@Column(name="Itemname")
	 private String itemName;
	
	@Column(name="price")
	 private int price;
	
	@Column(name="QuantityAvail")
	 private int quantityAvail;

	@Override
	public String toString() {
		return "StockDetails [stockid=" + stockid + ", itemName=" + itemName + ", price=" + price + ", quantityAvail="
				+ quantityAvail + "]";
	}

	public String getStockid() {
		return stockid;
	}

	public void setStockid(String stockid) {
		this.stockid = stockid;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantityAvail() {
		return quantityAvail;
	}

	public void setQuantityAvail(int quantityAvail) {
		this.quantityAvail = quantityAvail;
	}

	public StockDetails(String stockid, String itemName, int price, int quantityAvail) {
		super();
		this.stockid = stockid;
		this.itemName = itemName;
		this.price = price;
		this.quantityAvail = quantityAvail;
	}

	public StockDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
	 
	