<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form  text-align="center" method="get" action="AddCustomer.jsp">

Customer Name :
<input type="text" name="customerName" ><br/><br/>
<label for="phone">
Enter your phone number:</label>
<input type="number" name="customerPhoneNo"  min="10">
Gender :
<input type="radio" name="gender" value="MALE">MALE<br/><br/>
<input type="radio" name="gender" value="FEMALE">FEMALE<br/><br/>
Address 1:
<input type="text" name="address1" ><br/><br/>
Address 2:
<input type="text" name="address2" ><br/><br/>
ZipCode :
<input type="text" name="zipcode" ><br/><br/>
City :
<input type="text" name="city" ><br/><br/>
UserName :
<input type="text" name="userName" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" ><br/><br/>
PassCode :
<input type="password" name="passCode" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required><br/><br/>
<input type="submit"  value="SUBMIT"><br/><br/>
</form>


			<jsp:useBean id="beanDAO" class="com.Infinite.inventoryproject.CustomerDAO"/>
			<c:set var="c" value="${beanDAO.searchCustomerphone(param.userName,param.customerPhoneNo)}"/>
			
	<c:if test="${c > 0  && param.customerName != null}">
						<c:out value="Customer Exists"/>
									
						
	</c:if>
	<c:if test="${c == 0 && param.customerName != null}">
	<jsp:useBean id="customer" class="com.Infinite.inventoryproject.Customer"/>
						<jsp:setProperty property="*" name="customer"/>	
						<c:out value="${beanDAO.addCustomer(customer)}"/></c:if>

</body>
</html>