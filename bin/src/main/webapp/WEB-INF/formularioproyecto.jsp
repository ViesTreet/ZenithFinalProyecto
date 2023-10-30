<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><!--Css-->
<link rel="stylesheet" type="text/css" href="/cssformulario/style.css">
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
                    <span class="name">Ligoleyen</span>
                    <span class="profession">Luxoi</span>
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
        <div class="text">Crea tu Proyecto</div>
        <div class="form">
           <form:form action="/crearProyecto" method="POST" modelAttribute="nuevoProyecto">
           
					  <div class="botones">
							    <div class="cajitas">
							        <input type="radio" id="estudiante" name="plantilla" value="estudiante">
							        <label for="estudiante">Estudiante</label>
							        <img alt="Libro" src="/images/6475884.png">
							    </div>
							
							    <div class="cajitas">
							        <input type="radio" id="gimnasio" name="plantilla" value="gimnasio">
							        <label for="gimnasio">Gimnasio</label>
							        <img alt="Gimnasio" src="/images/pngtree-gym-dumbbell-vector-icon-png-image_2460436.jpg">
							    </div>
							
							    <div class="cajitas">
							        <input type="radio" id="pyme" name="plantilla" value="pyme">
							        <label for="pyme">PYME</label>
							        <img alt="Pyme" src="/images/6698536.png">
							    </div>
							
							    <div class="cajitas">
							        <input type="radio" id="custom" name="plantilla" value="custom">
							        <label for="custom">Personalizado</label>
							        <img alt="Personalizado" src="/images/487622.png">
							    </div>
					</div>

		
		            <div>
						<form:label path="titulo">Titulo del proyecto</form:label>
						<form:input path="titulo" class="form-control"/>
						<form:errors path="titulo" class="text-danger"></form:errors>
					</div>
					<div>
						<form:label path="descripcion">Descripcion del proyecto</form:label>
						<form:textarea path="descripcion" class="form-control"/>
						<form:errors path="descripcion" class="text-danger"></form:errors>
					</div>
					<div>
						<form:label path="fecha">Fecha de entrega</form:label>
						<form:input type="date" path="fecha" class="form-control"/>
						<form:errors path="fecha" class="text-danger"></form:errors>
					</div>
		               <form:hidden path="creador" value="${usuarioEnSesion.id}"/>
                <button type="submit">Enviar</button>
           
           </form:form>
        </div>
    </section>

    <script type="text/javascript" src="/jsproyecto/script.js"></script>
</body>
</html>