<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<title>Show Expense</title>
</head>
<body>
	<div class="container">
		<div>
			<h1>Expense Details</h1>
			<a href="http://localhost:8080/expense">Go Back</a>
		</div>
		<div class="row">
			<p>Expense Name: ${expense.getName()}</p>
			<p>Expense Description: ${expense.getDescription()}</p>
			<p>Vendor: ${expense.getVendor()}</p>
			<p>Amount: <fmt:formatNumber value="${expense.getAmount()}" minIntegerDigits="2" type="currency"/></p>
		</div>
	</div>
</body>
</html>