<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Cancel Order Action Page</title>
	</head>
	<body>
	<c:set var="phone" value="${param.custp}" />
	<c:if test="${phone != null }">
		<jsp:useBean id="customer" class="com.Infinite.inventoryproject.Customer"/>
		<jsp:useBean id="beanDAO" class="com.Infinite.inventoryproject.CustomerDAO"/>
		<jsp:setProperty property="*" name="customer"/>
		${beanDAO.updateCustomer(customer)}
		<c:redirect url="CustomerPageShow.jsp"></c:redirect>
		
	</c:if>
	
	</body>
</html>