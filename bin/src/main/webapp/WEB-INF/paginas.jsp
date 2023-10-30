<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tus Paginas</title>
<link rel="stylesheet" type="text/css" href="/cssproyecto/style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <nav class="sidebar close">
         <header>
         
            <div class="image-text">
                <span class="image">
                   <a href="/dashboard"><img src="/imagesproyecto/logo.png" alt="logo"></a> 
                </span>


                <div class="text header-text">
                    <span class="name">Zenith</span>
                    <span class="profession"></span>
                </div>
            </div>
            
            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">


            <div class="menu">
            	<li class="search-box">                  
                	<i class='bx bx-search-alt-2 icon' ></i>
             		<input type="search" placeholder="Search">
                </li>


                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="/dashboard">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Dashboard</span>
                        </a>
                    </li>
                </ul>
                    
                    
                    
				<li class="nav-link">
					<a href="/proyectos">
						<i class='bx bxs-folder icon'></i>
						<span class="text nav-text">Proyectos</span>
					</a>
				</li>
				<ul class="sub-menu">
					<c:forEach items="${proyectoMostrar.proyectoPaginas}" var="paginas">
						<li class="sub-menu-link">
							<a href="/paginas/${paginas.id}">
								<i class='bx bxs-memory-card icon'></i>
								<span class="text sub-menu-text">${paginas.nombre}</span>
							</a>
						</li>
					</c:forEach>
				</ul>
					
                
                 
                <li class="nav-link">
                	<a href="#">
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

    <section class="home">
        <div class="text">Tus Paginas</div>
        <main>
            
            <div class="tabla">
                <table>
	                <thead>
	                    <tr>
	                        <th>Nombre</th>
	                        <th>Descripción</th>
	                        <th>Cantidad de tareas</th>
	                        <th>Acciones</th>
	                    </tr>
	                </thead>
	                <tbody>
		               <c:forEach items="${proyectoMostrar.proyectoPaginas}" var="paginas">
	                    <tr>
	                        <td><a href="/paginas/${paginas.id}">${paginas.nombre}</a></td>
	                        <td>${paginas.descripcion}</td>
	                        <td>
            					<c:set var="count" value="0" />
            					<c:forEach items="${paginas.tareasPagina}" var="tarea">
                					<c:set var="count" value="${count + 1}" />
            					</c:forEach>
            					${count}
        					</td>
	                        <td>Detalles</td>
	                    </tr>
	                   </c:forEach>
	            	</tbody>
                </table>
            </div>
        </main>
    </section>

    <script type="text/javascript" src="/jsproyecto/script.js"></script>
</body>
</html>