<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Hello World - This page is open to all
	<hr>
	<!-- Display username and roles -->
	<p>
		User:
		<security:authentication property="principal.username" />
		<br>
		<br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>
	<hr>
	<br>
	<br>

	<security:authorize access="hasRole('MANAGER')">
		<!-- Links for role specific pages -->
		<a href="${pageContext.request.contextPath }/leaders">Leadership
			Meeting - Only for managers</a>
	</security:authorize>
	<br>
	<security:authorize access="hasRole('ADMIN')">
		<!-- Links for role specific pages -->
		<a href="${pageContext.request.contextPath }/systems">IT systems
			meeting - Open to Admins</a>
	</security:authorize>

	<br>
	<br>
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath }/logout"
		method="POST">

		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>