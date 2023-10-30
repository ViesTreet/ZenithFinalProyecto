<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Tareas</title>

<link rel="stylesheet" type="text/css" href="/csstareas/style.css?1">
<link rel="stylesheet" type="text/css" href="/css/style.css?1">

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <div class="container">
    
    <nav class="sidebar close">
         	<header>
            	<div class="image-text">
                	<span class="image">
                   	<a href="/dashboard"><img src="/imagesproyecto/logo.png" alt="logo"></a> 
                	</span>

                	<div class="text header-text">
                    	<span class="name">Zenith</span>
                    	<span class="profession">Bienvenido!</span>
                	</div>
            	</div>
            	<i class='bx bx-chevron-right toggle'></i>
        	</header>

        	<div class="menu-bar">
            	<div class="menu">
					<form action="/barraDeBusqueda" method="post">
						<li class="search-box">                  
								<i class='bx bx-search-alt-2 icon' ></i>
								<input name="busqueda" type="search" placeholder="Buscar pagina">
						</li>
					</form>
                    	<ul class="menu-links">
                    
				    	<li class="nav-link">
				        	<a href="/dashboard">
				            	<i class='bx bx-home-alt icon'></i>
				            	<span class="text nav-text">Dashboard</span>
				        	</a>
				    	</li>
				    	</ul>
				    
				    
				    	<li class="nav-link">
				        	<a href="/proyectos">
				            	<i class='bx bxs-color icon'></i>
				        	    	<span class="text nav-text">Panel Proyectos</span>
				        	</a>
				       
				    	</li>   
						<c:forEach items="${proyectos}" var="proyecto">
    						<li class="nav-link has-submenu" data-id="${proyecto.id}" data-titulo="${proyecto.titulo}" data-descripcion="${proyecto.descripcion}">
        						<a href="#">
            						<i class='bx bxs-folder icon'></i>
            						<div style="display: flex; justify-content: space-between; width: 100%;">
            						<span class="text nav-text">${proyecto.titulo}</span>
            						<i class='bx bxs-edit icon'></i> <!-- Aquí está el botón de edición -->
            						</div>
        						</a>
        						<ul class="menu-vertical">
            						<c:forEach items="${proyecto.proyectoPaginas}" var="paginas">
                						<li class="sub-menu-link">
                    						<a href="/paginas/${paginas.id}">
                        						<i class='bx bxs-memory-card icon'></i>
                        						<span class="text sub-menu-text">${paginas.nombre}</span>
                    						</a>
                						</li>
            						</c:forEach>
        						</ul>
    						</li>
							</c:forEach>

				    
				    
                    	<li class="nav-link">
                        	<a href="/premiun">
                            	<i class='bx bx-wallet icon' ></i>
                            	<span class="text nav-text">Premiun</span>
                        	</a>
                    	</li>
            
            	</div>
            	<div class="bottom-content">
                	<li class="nav-link">
                    	<a href="/logout">
                        	<i class='bx bx-log-out icon' ></i>
                        	<span class="text nav-text">Logout</span>
                    	</a>
                	</li>

               	 <li class="mode">
                	<div class="moon-sun">
                    	<i class='bx bx-moon icon moon' ></i>
                   	 	<i class='bx bx-sun icon sun' ></i>
                	</div>
                	<span class="mode-text text">Dark mode</span>

                	<div class="toggle-switch">
                    	<span class="switch"></span>
                	</div>
                	</li>
            	</div>
        	</div>
    	</nav>
    	
    	<section class="home1">
        		
        		 <table class="table">
            <thead>
                <tr>
                    <th style="width: 25%;">Contenido</th>
                    <th style="width: 25%;">Estado</th>
                    <th style="width: 25%;">Fecha de Creación</th>
                    <th style="width: 25%;">Fecha Límite</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${paginaMostrar.tareasPagina}" var="tarea">
                    <tr>
                        <td style="width: 25%;">${tarea.contenido}</td>
                        <c:if test="${tarea.estado == 'Completado'}">
                        <td class="bg-success" style="width: 25%;">
                        ${tarea.estado}
                        </td>
                        </c:if>
                        <c:if test="${tarea.estado == 'En proceso'}">
                        <td class="bg-warning" style="width: 25%;">
                        ${tarea.estado}
                        </td>
                        </c:if>
                        <c:if test="${tarea.estado == 'Sin Empezar'}">
                        <td class="bg-danger" style="width: 25%;">
                        ${tarea.estado}
                        </td>
                        </c:if>
                        <td style="width: 25%;">${tarea.fechaCreacion}</td>
                        <td style="width: 25%;">${tarea.fechaLimite}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Formulario para crear tareas -->
        <div class="color">
        <h2 style="width: 100%;text-align: center;height: 5px;">Crear Nueva Tarea</h2>
        <form action="/nueva_pagina/crear_tarea" method="post" style="margin-bottom: 200px;width: 30%;">
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
                <label for="fechaCreacion">Fecha de Inicio</label>
                <input type="date" class="form-control" id="fechaCreacion" name="fechaCreacion" required>
            </div>
            <div class="form-group">
                <label for="fechaLimite">Fecha Límite</label>
                <input type="date" class="form-control" id="fechaLimite" name="fechaLimite" required>
            </div>
            <input type="hidden" name="id-pagina" value="${paginaMostrar.id}">
            <button type="submit" class="btn btn-primary">Crear Tarea</button>
        </form>
        		
    	</section>
      </div>
      <div id="editModal" class="modal">
			<div class="formularioModal">
				<form action="/editarProyecto" method="post">
					<input type="hidden" name="_method" value="put">
					<h2>Edita tu proyecto</h2>
					<label>Titulo del proyecto</label>
					<br>
					<input type="text" name="titulo">
					<br>
					<label>Descripcion del proyecto:</label>
					<br>
					<input type="text" name="descripcion">
					<br>
					<input type="hidden" name="proyectoId" id="proyectoId">
					<input class="botonSubmit" type="submit" value="Guadar proyecto">
				</form>
				</div>		
		</div>
      
      
      
        <script src="/jsproyecto/script.js"></script>
    	<script src="/jsmodal/script.js"></script>
</body>
</html>
