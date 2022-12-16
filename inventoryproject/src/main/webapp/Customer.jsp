<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <form method="post">
            <input type="text" name="username" placeholder="Username" required><br><br>
            <input type="password" name="password" placeholder="Password" required><br><br>
            <input type="submit" value="SIGN IN">
            
    </form>
    <a href="AddVendor.jsp"><button>SIGN UP</button></a>
    
    <c:if test="${param.username != null && param.password != null}">
        <jsp:useBean id="vendor" class="com.infinite.inventoryyy.Vendor"/>
        <jsp:setProperty property="*" name="vendor"/>
        <jsp:useBean id="dao" class="com.infinite.inventoryyy.InventoryDAO"/>
        <c:out value="${dao.authenticate(param.username,param.password)}"/>



       <c:if test="${dao.authenticate(param.username,param.password) > 0 }">
            <jsp:forward page="ShowStock.jsp"/>
        </c:if>
    </c:if>
    
    
    
    
    </body>
</html>