<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>API Demo</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/journal/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ciphE0NCAlD2/N6NUApXAN2dAs/vcSAOTzyE202jJx3oS8n4tAQezRgnlHqcJ59C"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		 <h1>${list }</h1>

		<br>

		<table class="table">
			<tr>
				<th>Planet Name</th>
				<th>Planet Colors</th>
				<th>Learn More</th>
			</tr>
			<c:forEach var="p" items="${quoteTest }" varStatus="j">
				<tr>
					<td>${p.name }</td>
					<td><c:forEach var="color" items="${p.colors}" varStatus="i">
					${i.count }. ${color } <br>
					</c:forEach></td>
					<td><a class="btn btn-primary" href="details?index=${j.index }">Details</a></td>
				</tr>
			</c:forEach>
		</table>

<form action="mailto:antonellasolomon@email.com" method="post">
<input type="file" name="uploadField" />
<input type="submit" value="Submit">
</form>
	</div>
</body>
</html>