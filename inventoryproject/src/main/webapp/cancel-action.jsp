<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Cancel Order Action Page</title>
	</head>
	<body>
		<c:set var="orderId" value="${param.orderid }" />
		
		<c:if test="${orderId != null }">
			<jsp:useBean id="dao" class="com.Infinite.inventoryproject.OrderDAO" />
			${dao.cancelOrder(orderId)}
			<c:redirect url="ShowOrder.jsp" />
		</c:if>
	</body>
</html>