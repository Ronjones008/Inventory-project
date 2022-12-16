<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add Order</title>
</head>
<body>
<jsp:include page="CustomerMenu.jsp"/>
	<jsp:useBean id="stockDao" class="com.Infinite.inventoryproject.StockDAO" />
	<c:if test="${param.id!=null}">
	<c:set var="id" value="${param.id}"/>
	</c:if>
	<c:if test="${param.stockId!=null}">
<c:set var="id" value="${param.stockId}"/>
	
	</c:if>
		<h1>ADD ORDER</h1>
	<c:set var="stockprice" value="${stockDao.searchStock(id)}"/>
	<form name="frmCalc">
		User name:
		<input type="text" class="form-control" name="userName" value="${userName }"> 
		
		Stock Id :
		<input type="text" class="form-control" name="stockId" value="${param.id}">
		 Price :
		 <input type="text" class="form-control" name="price" id="price" value="${stockprice.price}">
		 Quantity Avail :
		 <input type="text" class="form-control" name="stk" id="stk" value="${stockprice.quantityAvail}">
		Quantity Order:
 		<input type="number" class="form-control" name="quantityOrder" id="qty" onkeyup="calc()" min="1" max="${stockprice.quantityAvail}"/>
 		
		 
		
		Total Bill:
		<input type="number" class="form-control" name="totalPrice" id="totalprice"/> <br>
		
		 
		<input type="submit" class="btn btn-primary" value="Place Order" />
	</form>
	
      
	<c:if test="${param.totalPrice != null && param.quantityOrder != null}">
		<jsp:useBean id="order" class="com.Infinite.inventoryproject.Order" />
		<jsp:useBean id="dao" class="com.Infinite.inventoryproject.OrderDAO"/>
		
		<jsp:setProperty property="*" name="order"/>
		
		<c:out value="${dao.addOrder(order)}" />
		
		 <c:set var="addedorder" value="Order Added Successfully!" scope="session"></c:set>
		<jsp:forward page="ShowOrder.jsp"></jsp:forward>
	</c:if>

	<script>
		function calc() {
			var qty=document.getElementById("qty").value;
			//console.log(qty);
			var price=document.getElementById("price").value;
			//console.log(price);
			result=qty*price;
			//console.log(result);
			document.getElementById("totalprice").value = result;
			
			
		}
	</script>
</body>
</html>