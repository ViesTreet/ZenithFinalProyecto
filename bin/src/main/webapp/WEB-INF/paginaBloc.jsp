<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><!--Css-->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/cssbloc/style.css?1">
<!--boxicons-->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
    <nav class="sidebar close">
         <header>
            <div class="image-text">
                <span class="image">
                    <img src="/images/LOL_Logo.webp" alt="logo">
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
                        <li class="search-box">                  
                                <i class='bx bx-search-alt-2 icon' ></i>
                                <input type="search" placeholder="Search">
                        </li>
                    <ul class="menu-links">
				    <li class="nav-link">
				        <a href="/dashboard">
				            <i class='bx bx-home-alt icon'></i>
				            <span class="text nav-text">Dashboard</span>
				        </a>
				    </li>
				    
				    	
						    <li class="nav-link">
							    <a href="/proyectos">
							        <i class='bx bxs-popsicle icon'></i>
							        <span class="text nav-text">Proyectos</span>
							    </a>
							</li>
							<ul class="sub-menu">
							    <c:forEach items="${proyectos}" var="proyecto">
							        <li class="sub-menu-link">
							            <a href="/proyectos/${proyecto.id}">
							                <i class='bx bx-task icon'></i>
							                <span class="text sub-menu-text">${proyecto.titulo}</span>
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
        <div class="bloc">
			<div class="blocEscritura">
				<c:forEach items="${paginaMostrar.tareasPagina}" var="tareas">
					<c:if test="${tareas.tipo == 'titulo'}">
						<h1 class="blocTitulo">${tareas.contenido}</h1>
					</c:if>
					<c:if test="${tareas.tipo == 'texto'}">
						<p>${tareas.contenido}</p>
					</c:if>
					<c:if test="${tareas.tipo == 'checkbox'}">
    					<p class="custom-checkbox">${tareas.contenido}</p>
					</c:if>
					<c:if test="${tareas.tipo == 'lista'}">
    					<p class="custom-list">${tareas.contenido}</p>
					</c:if>
				</c:forEach>
			</div>
			<div class="blocInput">
				<form action="/bloc" method="post">
					<div class="selectorTipoBloc">
						<select name="tipoTexto">
							<option value="texto">+</option>
							<option value="titulo">Titulo</option>
							<option value="checkbox">Checkbox</option>
							<option value="lista">Lista</option>
						</select>
					</div>
					<div class="textoBloc">
						<textarea class="textoB" name="contenido" placeholder="Escribe aqui"></textarea>
					</div>
					<div class="botonBloc">
						<input type="hidden" name="pagina" value="${paginaMostrar.id}">
						<input type="submit" value="Guardar">
					</div>
				</form>
			</div>
        </div>
    </section>

    <script src="/jsproyecto/script.js"></script>
</body>
</html>
