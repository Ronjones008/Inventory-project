<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Data Tables</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="style.css">
    <script
  src="http://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>

</head>
<body>
<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.CustomerDAO"/>
	<script>
	$(document).ready(function () {
	    $("#myTable").DataTable();
	});
	</script>
	<div class="container">
	<table id="myTable" class="table table-bordered table-hover table-striped">
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
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>
</body>
</html>