<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<body >
<jsp:include page="CustomerMenu.jsp"/>

<center>
    <hr>  
       <center><b>Available Stock </b> </center>
	<jsp:useBean id="beanStock" class="com.Infinite.inventoryproject.StockDetails"></jsp:useBean>	
	<jsp:setProperty property="*" name="beanStock"/>
	<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.StockDAO"></jsp:useBean>
	
	<script>
		$(document).ready(function () {
		    $("#stock").DataTable();
		});
	</script>
	<div class="container">
	<table id = "stock" border="5" align="center" class="table table-bordered table-hover table-striped">
	<thead>
	<tr>
	<th>Stock Id</th>
	<th>Item Name</th>
	<th>Price</th>
	<th>Quantity Avail</th>
	<th>Order</th>
	
	</tr>
	</thead>
	<c:forEach var="Stock" items="${beanDao.ShowStock()}">	
	<tr>
	<td>${Stock.stockid}</td>
	<td>${Stock.itemName}</td>
	<td>${Stock.price}</td>
	<td>${Stock.quantityAvail}</td>
	 <td bgcolor="green"><a href="AddOrder.jsp?id=${Stock.stockid}"><input type="button" value="Order" ></a></td>
	 
	</tr>
	</c:forEach>
	</table></div>	
	<c:out value="${param.quantity}"></c:out>




</body>
</html>