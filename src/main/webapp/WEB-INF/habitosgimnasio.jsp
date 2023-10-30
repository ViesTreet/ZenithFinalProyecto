<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1>${paginaHabitos.nombre}</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12 bg-light p-3">
                <p>${paginaHabitos.descripcion}</p>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12 text-center">
                <h2>Semana - Hábitos</h2>
            </div>
        </div>      
	<div class="row">
    <div class="col-12">
        <div class="row">
            <c:forEach items="${paginaHabitos.tareasPagina}" var="tarea">
                <div class="col-12 col-md-6 col-lg-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${tarea.contenido}</h5> <!-- Muestra el contenido de la tarea -->
                            <!-- Agrega un emoji aquí -->
                            <input type="checkbox" id="${tarea.id}" name="tareas" value="${tarea.contenido}">
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</div>
</body>
</html>
