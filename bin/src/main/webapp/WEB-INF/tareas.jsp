<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Tareas</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="page-header">
    <h1>${paginaActual}</h1>
</div>

        <table class="table">
            <thead>
                <tr>
                    <th>Contenido</th>
                    <th>Estado</th>
                    <th>Fecha de Creación</th>
                    <th>Fecha Límite</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${paginaMostrar.tareasPagina}" var="tarea">
                    <tr>
                        <td>${tarea.contenido}</td>
                        <c:if test="${tarea.estado == 'Completado'}">
                        <td class="bg-success">
                        ${tarea.estado}
                        </td>
                        </c:if>
                        <c:if test="${tarea.estado == 'En proceso'}">
                        <td class="bg-warning">
                        ${tarea.estado}
                        </td>
                        </c:if>
						<c:if test="${tarea.estado == 'Sin Empezar'}">
                        <td class="bg-danger">
                        ${tarea.estado}
                        </td>
                        </c:if>
                        <td>${tarea.fechaCreacion}</td>
                        <td>${tarea.fechaLimite}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Formulario para crear tareas -->
        <h2>Crear Nueva Tarea</h2>
        <form action="/nueva_pagina/crear_tarea" method="post">
            <div class="form-group">
                <label for="contenido">Contenido</label>
                <input type="text" class="form-control" id="contenido" name="contenido" required>
            </div>
            <div class="form-group">
                <label for="estado">Estado</label>
                <select name="estado" class="form-select">
                	<option value="Completado">Completado</option>
                	<option value="En proceso">En proceso</option>
                	<option value="Sin Empezar">Sin Empezar</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fechaCreacion">Fecha de Creación</label>
                <input type="date" class="form-control" id="fechaCreacion" name="fechaCreacion" required>
            </div>
            <div class="form-group">
                <label for="fechaLimite">Fecha Límite</label>
                <input type="date" class="form-control" id="fechaLimite" name="fechaLimite" required>
            </div>
            <input type="hidden" name="id-pagina" value="4">
            <button type="submit" class="btn btn-primary">Crear Tarea</button>
        </form>
    </div>

    <!-- Agregar enlaces a Bootstrap JS y jQuery para funcionalidades adicionales (opcional) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
