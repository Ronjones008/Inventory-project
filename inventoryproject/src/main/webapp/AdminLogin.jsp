<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<hr>
<center><h1>INVENTORY MANAGEMENT</h1></center>
<hr>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">

</head>
<body>
<h1>ADMIN LOGIN PAGE</h1>
<div class="align-items-center" style="width: 400px;display:flex;align-items:center;justify-content:center">
    <form method="post" style="width: 100%;">   
    <div class="formI">
    		<label style="width:27%" for="username" class="form-label">UserName:</label>
            <input style="width:70%" type="text" id="username" name="userName" maxlength="10" class="form-control">
    </div>   
    <div class="formI">
    <label style="width:27%" for="password" class="form-label">Password:</label>
            <input style="width:70%" type="password" id="password" name="passWord" maxlength="10" required class="form-control">
    </div>     
    		<br>
            <div class="formI" style="display: flex;justify-content:center">
            <input style="text-align:center" type="submit" class="btn btn-primary" value="SIGN IN"> 
            </div>
            
    </form>
    </div>
    
    <c:if test="${param.userName != null && param.passWord != null}">
        <jsp:useBean id="dao" class="com.Infinite.inventoryproject.AdminDAO"/>
       	
       	<c:set var="user" value="${param.userName }"/>
       	<c:set var="password" value="${param.passWord }"/>
       	
        <c:out value="${dao.authenticate(user, password)}"/>
      
       <c:if test="${dao.authenticate(user, password) > 0 }">
            <jsp:forward page="AdminMenu.jsp"/>
        </c:if>
    </c:if>
    
    
    
    
    </body>
</html>