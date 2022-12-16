package com.Infinite.inventoryproject;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class Order {
	
	@Id
	@Column(name="OrderId")
	private String orderId;
	
	@Column(name="username")
	private String userName;

	@Column(name="StockID")
	private String stockId;
	
	@Enumerated(EnumType.STRING)
	@Column(name="Orderstatus")
	private OrderStatus orderStatus;
	
	@Column(name="QtyOrd")
	private  int quantityOrder;
	
	@Column(name="OrderedDate")
	private Date orderedDate;
	
	@Column(name="shipping")
	private Date shippingDate;
	
	@Column(name="delivery")
	private Date deliveryDate;
	
	@Column(name="expected_delivery")
	private Date expecteddeliveryDate;
	
	@Column(name="totalPrice")
	private Double totalPrice;
	
	
	public String getOrderId() {
		return orderId;
	}
	
	

	public Double getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}



	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getStockId() {
		return stockId;
	}
	
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
	
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}
	
	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public int getQuantityOrder() {
		return quantityOrder;
	}
	
	public void setQuantityOrder(int quantityOrder) {
		this.quantityOrder = quantityOrder;
	}
	
	public Date getOrderedDate() {
		return orderedDate;
	}
	
	public void setOrderedDate(Date orderedDate) {
		this.orderedDate = orderedDate;
	}
	
	public Date getShippingDate() {
		return shippingDate;
	}
	
	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}
	
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	
	public Date getExpecteddeliveryDate() {
		return expecteddeliveryDate;
	}
	
	public void setExpecteddeliveryDate(Date expecteddeliveryDate) {
		this.expecteddeliveryDate = expecteddeliveryDate;
	}
}