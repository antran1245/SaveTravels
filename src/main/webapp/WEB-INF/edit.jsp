<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<title>Edit My Task</title>
</head>
<body>
	<div class="container">
		<div>
			<h1>Edit Expense</h1>
			<a href="http://localhost:8080/expense">Go Back</a>
		</div>
		<form:form action="/expense/edit/${expense.getId()}/edited" method="post" modelAttribute="expense">
			<div class="form-group">
				<form:label path="name">Expense Name: </form:label>
				<form:input path="name" value="${expense.getName()}"/>
				<form:errors path="name" class="error"/>
			</div>
			<div class="form-group">
				<form:label path="vendor">Vendor:</form:label>
				<form:input path="vendor" value="${expense.getVendor()}"/>
				<form:errors path="vendor" class="error"/>
			</div>
			<div class="form-group">
				<form:label path="amount">Amount:</form:label>
				<form:input type="number" min="0" path="amount" value="${expense.getAmount()}" step="0.01"/>
				<form:errors path="amount" class="error"/>
			</div>
			<div class="form-group">
				<form:label path="description">Description</form:label>
				<form:textarea path="description" value="${expense.getDescription()}"/>
				<form:errors path="description" class="error"/>
			</div>
			<input type="submit" value="Submit"/>
		</form:form>
	</div>
</body>
</html>