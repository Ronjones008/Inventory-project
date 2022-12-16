<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<center>
    <hr>  
       <center><b>Payment Details </b> </center>
	<jsp:useBean id="beanWallet" class="com.Infinite.inventoryproject.Wallet"></jsp:useBean>	
	<jsp:setProperty property="*" name="beanWallet"/>
	<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.WalletDAO"></jsp:useBean>
	<form>
	<table border="5" align="center">
	<tr>
	<th>CustomerId</th>
	<th>Wallet Id</th>
	<th>Wallet Type</th>
	<th>Amount</th>
	
	</tr>
	<c:forEach var="Wallet" items="${beanDao.ShowWallet()}">	
	<tr>
	<td>${Wallet.customerid}</td>
	<td>${Wallet.walletId}</td>
	<td>${Wallet.walletType}</td>
	<td>${Wallet.amt}</td>
	 
	</tr>
	</c:forEach>
	</table>	
	
	</form>
	


</body>
</html>