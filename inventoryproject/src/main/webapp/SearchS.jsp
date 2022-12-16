<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.StockDAO"/>
	<form method="get" action="SearchS.jsp">
		<center>
		Stock Id: 
			<input type="text" name="stockid" /> <br/><br/> 
			<input type="submit" value="Search" />
		</center>
	</form>
	<c:if test="${param.stockid!=null}">
	<c:set var="stockid" value="${param.stockid}"/>
		<c:set var="Stock" value="${beanDao.searchStock(stockid)}"/>
		<c:if test="${stockid!=null}">
		Stock Id :  <b>
			<c:out value="${Stock.stockid}"/></b> <br/>
		ItemName : <b>
			<c:out value="${Stock.itemName}"/></b> <br/>
	    Price: <b>
			<c:out value="${Stock.price}"/></b> <br/>
		Quantity Available: <b>
			<c:out value="${Stock.quantityAvail}"/></b> <br/>
	   
		
		</c:if>
	</c:if>
</body>
</html>