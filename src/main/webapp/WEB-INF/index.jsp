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
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<title>Read Share</title>
</head>
<body>
	<div class="container">
		<h1>Save Travels</h1>
		<table>
			<thead>
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expense" items="${expenses}">
					<tr>
						<td><a href="/expense/${expense.getId()}">${expense.getName()}</a></td>
						<td>${expense.getVendor()}</td>
						<td><fmt:formatNumber value="${expense.getAmount()}" minIntegerDigits="2" type="currency"/></td>
						<td class="actions-row">
							<a href="/expense/edit/${expense.getId()}">edit</a>
							<form action="/expense/delete/${expense.getId()}" method="post">
								<input type="hidden" name="_method" value="delete"/>
								<input type="submit" value="Delete" class="red-button"/>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form:form action="/addExpense" method="post" modelAttribute="expense">
			<div class="form-group">
				<form:label path="name">Expense Name: </form:label>
				<form:input path="name"/>
				<form:errors path="name" class="error"/>
			</div>
			<div class="form-group">
				<form:label path="vendor">Vendor:</form:label>
				<form:input path="vendor" />
				<form:errors path="vendor" class="error"/>
			</div>
			<div class="form-group">
				<form:label path="amount">Amount:</form:label>
				<form:input type="number" min="0" path="amount" step="0.01"/>
				<form:errors path="amount" class="error"/>
			</div>
			<div class="form-group">
				<form:label path="description">Description</form:label>
				<form:textarea path="description" />
				<form:errors path="description" class="error"/>
			</div>
			<input type="submit" value="Submit"/>
		</form:form>
	</div>
	
	
</body>
</html>