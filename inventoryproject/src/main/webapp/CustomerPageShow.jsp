<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title></title>
           <center> <h1>INVENTORY MANAGEMENT</h1></center> 
           
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">      
</head>
<body >
<jsp:include page="CustomerMenu.jsp"/>

<center>
    <hr>  
       <center><b>Customer Details</b> </center>
	<jsp:useBean id="beanStock" class="com.Infinite.inventoryproject.Customer"></jsp:useBean>	
	<jsp:setProperty property="*" name="beanStock"/>
	<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.CustomerDAO"></jsp:useBean>

	<c:set var="custs" value="${beanDao.searchCustomer(cid)}"/>
	<table border="5" class="table table-bordered table-hover table-striped" style="width:500px">
  <tr>
    <th>Name</th>
    <td>${custs.customerName}</td>
  </tr>
  <tr>
    <th>Phone Number</th>
    <td>${custs.customerPhoneNo}</td>
  </tr>
  <tr>
    <th>User Name</th>
    <td>${custs.userName}</td>
  </tr>
  <tr>
    <th>Address 1</th>
    <td>${custs.address1}</td>
  </tr>
  <tr>
    <th>Address 2</th>
    <td>${custs.address2}</td>
  </tr>
  
  <tr>
    <th>Zipcode</th>
    <td>${custs.zipcode}</td>
  </tr>
  
  <tr>
    <th>City</th>
    <td>${custs.city}</td>
  </tr>
  
   

	</table> 

	

</body>
</html>