<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prueba</title>
</head>
<body>
	<div>
		<form:form action="/pruebaCrear" method="Post" modelAttribute="prueba">
			<form:label path="titulo">Titulo</form:label>
			<form:input path="titulo"/>
			<form:errors path="titulo" />
			<br>
			<form:label path="fecha"></form:label>
			<form:input type="date" path="fecha"/>
			<form:errors path="fecha"/>
			<br>
			<form:hidden path="creador" value="1"/>
			<form:hidden path="plantilla" value="estudiante"/>
			<input type="submit" value="probar">
		</form:form>
	</div>
</body>
</html>