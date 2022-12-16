<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.CustomerDAO"/>
	<form method="get" action="SearchCustomer.jsp">
		<center>
			Customer Id : 
			<input type="number" name="customerid" /> <br/><br/> 
			<input type="submit" value="Search" />
		</center>
	</form>
	<c:if test="${param.customerid!=null}">
	<c:set var="customerid" value="${param.customerid}"/>
		<c:set var="customer" value="${beanDao.searchCustomer(customerid)}"/>
		<c:if test="${customer!=null}">
		Customer Id :  <b>
			<c:out value="${customer.customerid}"/></b> <br/>
		Customer Name : <b>
			<c:out value="${customer.customerName}"/></b> <br/>
	    Customer PhoneNo : <b>
			<c:out value="${customer.customerPhoneNo}"/></b> <br/>
       Gender : <b>
       		<c:out value="${customer.gender}"/></b> <br/>
       Address 1:<b>
       	     <c:out value="${customer.address1}"/></b> <br/>		
		Address 2 : <b>
			<c:out value="${customer.address2}"/></b> <br/>
		ZipCode : <b>
			<c:out value="${customer.zipcode}"/></b> <br/>
		City : <b>
			<c:out value="${customer.city}"/></b> <br/>
	   
		
		</c:if>
	</c:if>
</body>
</html>