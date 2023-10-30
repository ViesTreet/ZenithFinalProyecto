<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><!--Css-->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!--boxicons-->
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
				    </ul>
				    
				    
				    <li class="nav-link">
				        <a href="/proyectos">
				            <i class='bx bxs-folder icon'></i>
				            <span class="text nav-text">Proyectos</span>
				        </a>
				       
				    </li>   
				     <ul class="nav-link" >
				     
				            <c:forEach items="${proyectos}" var="proyecto">
				                <li class="sub-menu-link">
				                    <a href="/proyectos/${proyecto.id}">
				                        <i class='bx bxs-memory-card icon'></i>
				                        <span class="text sub-menu-text">${proyecto.titulo}</span>
				                    </a>
				                </li>
				            </c:forEach>
				        </ul>
				    
				    
				    
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

    <section class="home">
        <div class="text">
            <h1></h1>
                <div class="principal">
                    <span><h1>Bienvenido a nuestro gestor de proyectos</h1></span>
                    <p>Aprende a organizarte de manera muy facil y didactica con nosotros, podras hacer seguimiento a tus tareas y diferentes proyectos en equipo</p>
                    <img src="/images/wewewe.png" class="org">
                </div>
                <div class="principalderecha">
                	<h3>Si es tu primera vez en la pagina, puedes empezar creando un proyecto nuevo!</h3>
                 <div class="boton">
	             	<a href="/crear/proyectos" > <span>Crear proyecto</span> </a>
				</div>
                </div>	
        
        </div>
        
    </section>

    <script src="/jsproyecto/script.js"></script>
</body>
</html>