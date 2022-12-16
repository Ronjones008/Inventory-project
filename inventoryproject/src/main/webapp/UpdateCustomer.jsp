<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<center> <h1>INVENTORY MANAGEMENT</h1></center> 
<hr>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Customer</title>
</head>
<body>
<jsp:include page="CustomerMenu.jsp"></jsp:include>
<jsp:useBean id="dao" class="com.Infinite.inventoryproject.CustomerDAO"></jsp:useBean>
	
	<c:set var="customers" value="${dao.searchCustomer(cid)}"/>
		<form action="UpdateCustomer.jsp">
			
			Customer Id:
			<input name="customerid" class="form-control" type="text" value="${cid}" readonly>
			Customer Name:
			<input name="customerName" class="form-control" type="text" pattern="[A-Za-z]{1,15}" value="${customers.customerName }">
			Customer Phone Number:
			<input name="customerPhoneNo" class="form-control" type="number" value="${customers.customerPhoneNo }" >
			 address1:
			<input name="address1" class="form-control" type="text" value="${customers.address1}" >
			 address2:
			<input name="address2" class="form-control" type="text" value="${customers.address2}" >
			 zip code:
			<input name="zipcode" class="form-control" type="text" value="${customers.zipcode }" >
			 User Name:
			<input name="userName" class="form-control" type="text" value="${customers.userName}" readonly>
			 Password:
			<input name="passCode" class="form-control" type="password" pattern="/^[a-zA-Z0-9!@#\$%\^\&*_=+-]{8,12}$/g" value="${customers.passCode }" >
			 city:
			<input name="city" class="form-control" type="text"  pattern="[A-Za-z]{1,15}"  value="${customers.city}">
		
			<input type="submit" class="btn btn-primary"  value="Update">
			</form>	
	
	<c:if test="${param.customerName != null }">
		<jsp:useBean id="c" class="com.Infinite.inventoryproject.Customer"/>
		<jsp:useBean id="beanDAO" class="com.Infinite.inventoryproject.CustomerDAO"/>				
		<jsp:setProperty property="*" name="c"/>
		<c:out value="${beanDAO.updateCustomer(c)}"/>
		<c:redirect url="CustomerPageShow.jsp"></c:redirect>
		

		
	</c:if>
	
</body>
</html>