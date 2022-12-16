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
<h1>Payment Page</h1><br>

<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.PaymentDAO"/>
<jsp:useBean id="orderDao" class="com.Infinite.inventoryproject.OrderDAO"/>
	<jsp:useBean id="stockDao" class="com.Infinite.inventoryproject.StockDAO"/>
	<c:set var="user" value="${userName}"/>
	<div class="align-items-center" style="width: 400px;display:flex;align-items:center;justify-content:center">
<form method="get"  action="AddPayment.jsp">
<center>	
   Customer User Name:
  <input type="text" class="form-control" name="userName" value="${user}" readonly  />
   Customer ID:
  <input type="text" class="form-control" name="customerid" value="${cid }" readonly /> 
   Price:
   <input type="text" class="form-control" name="amt" value="${param.total}"/>
	 Select UPI:		 
		  <select name="walletType" class="form-control" id="language">
			  <option value="GPAY">GPAY</option>
			  <option value="PAYTM">PAYTM</option>
			  <option value="PHONEPE">PHONEPE</option>
		</select><br>
		
  
  
    <input type= "submit" class="btn btn-primary" value ="ADD">
     <a  href="AddOrder.jsp"   class="btn btn-primary">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    
    </center>
 </form>
 
 
 </div>
 	<c:if test="${param.amt != null}">
		<jsp:useBean id="wallet" class="com.Infinite.inventoryproject.Wallet" />
		<jsp:useBean id="dao" class="com.Infinite.inventoryproject.WalletDAO"/>
		
		<jsp:setProperty property="*" name="wallet"/>
		
		${dao.addWallet(wallet)}
		
		<jsp:forward page="Paymentpage.jsp"></jsp:forward>
		
	</c:if>
 
	
 

</body>
</html>