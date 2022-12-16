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
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<jsp:include page="CustomerMenu.jsp"/>
<h1>
ORDER DETAILS
</h1>
<P class="text-danger">
<c:out value="${addedorder}"></c:out>
     <c:set var="addedorder" value="" scope="session"></c:set>
</P>

   <jsp:useBean id="orderDao" class="com.Infinite.inventoryproject.OrderDAO"/>
    <jsp:useBean id="stockDao" class="com.Infinite.inventoryproject.StockDAO"/>
    <c:set var="user" value="${userName}"/>
    <table class="table table-bordered table-hover table-striped">
  <thead>
        <tr>
            <th>ID</th>
            <th>Stock Id</th>
            <th>Quantity</th>
            <th>Itemname</th>
            <th>Price</th>
            <th>Status</th>
            <th>Operation</th></tr></thead>
        <tbody>
        
        <c:forEach var="Order" items="${orderDao.showorder(user)}">    
            <c:set var="stock" value="${stockDao.searchStock(Order.stockId) }"/>
            <tr>
                <td>${Order.orderId}</td>
                <td>${Order.stockId}</td>
                <td>${Order.quantityOrder}</td>
                <td>${stock.itemName }</td>
                <td>${Order.totalPrice}</td>
                <td>${Order.orderStatus}
                <c:if test="${Order.orderStatus == 'ACCEPTED'}">
                        <td>
	                    	<a href="cancel-action.jsp?orderid=${Order.orderId}"><button class="btn btn-primary">CANCEL</button></a>
	                    </td>                
                </c:if>
                <c:if test="${Order.orderStatus != 'ACCEPTED'}">
                    <td>
                        <form>
                            <button class="btn btn-primary" type="submit" disabled>CANCEL</button>
                        </form>
                    </td>                
                </c:if>
            </tr>
        </c:forEach></tbody>
    </table>   
 
    
    <c:set var="totalamt" value="${orderDao.calcTotal(user)}"/>
    <c:if test="${totalamt > 0}">
	    Total Price:
	    <c:out value="${totalamt}"/>
	    <a href="AddPayment.jsp?total=${totalamt}"><button>Proceed To Buy</button></a>
    </c:if>
</body>
</html>