<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.CustomerDAO"/>
	
	<table class="table table-bordered table-hover table-striped">
  <thead class="table-dark">
    <tr>
		<th>Customer Id</th>
		<th>Customer Name</th>
		<th>Customer PhoneNo</th>
		<th>Gender</th>
		<th>Address 1</th>
		<th>Address 2</th>
		<th>ZipCode </th>
		<th>City </th>
		<th>Update</th>
		
	</tr>
  </thead>
  <tbody>
    <c:forEach var="customer" items="${beanDao.showCustomer()}">
		<tr>
			<td>${customer.customerid}</td>
			<td>${customer.customerName}</td>
			<td>${customer.customerPhoneNo}</td>
			<td>${customer.gender}</td>
			<td>${customer.address1}</td>
			<td>${customer.address2}</td>
			<td>${customer.zipcode}</td>
			<td>${customer.city}</td>
			<td><a href="UpdateCustomer.jsp?customerid=${customer.getCustomerid() }"><button class="btn btn-outline-secondary">UPDATE</button></a></td>	
		</tr>
	</c:forEach>
  </tbody>
</table>
</body>
</html>