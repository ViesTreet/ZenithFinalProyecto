<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="csslogin/estilos.css">
    
</head>
<body>

    <div class="container">
        <div class="form-box">
            <div class="button-box">
                <div id="elegir"></div>
                <button type="button" class="toggle-btn" onclick="login()">Iniciar Sesion </button>
                <button type="button" class="toggle-btn" onclick="registrar()">Registrar </button>
            </div>
         <div class="redes-sociales"> 
		    <a href="/login/oauth2/authorization/google">
		        <img src="imglogin/gp.png" alt="icono_Googleplus"> 
		    </a>
		</div>
           <form action="/login" method="post" class="input-group" id="login">
           
                     <div>
						
						<input type="email" class="input-field" name="email" placeholder="Correo">
						
					</div>
					<div>
					
						<input type="password" class="input-field" name="password" placeholder="Contraseña">
					</div>
                <button type="submit" class="submit-btn" >Acceder</button>
            </form>
            <form:form method="Post" modelAttribute="nuevoUsuario" action="/registro" class="input-group" id="registrar">
            
           		<div>
				<form:input path="nombre" class="input-field" placeholder="Nombre de Usuario"/>
				<p><form:errors path="nombre" class="text-danger"/></p>
				</div>
				
				<div>
				<form:input path="apellido" class="input-field" placeholder="Apellido"/>
				<p><form:errors path="apellido" class="text-danger"/></p>
				</div>
				
                
             	<div>
				<form:input path="email" class="input-field" placeholder="Correo"/>
				<p><form:errors path="email" class="text-danger"/></p>
                </div>
                
          		<div>
				<form:password path="password" class="input-field" placeholder="Contraseña" />
				<p><form:errors path="password" class="text-danger"/></p>
                </div>
				
                
              	<div>
				<form:password path="confirmPassword" class="input-field" placeholder="Confirmar Contraseña"/>
				<p><form:errors path="confirmPassword" class="text-danger"/></p>
                </div>
                
                <button type="submit" class="submit-btn" >Registrar</button>
            </form:form>
        </div>
    </div>
    <div class="footer">
    	<div class="subFooter">
    		<h4 class="tituloFooter">SOBRE NOSOTROS</h4>
    		<img class="imageFooter" src="/imagesproyecto/logo.png" alt="logo">
    		<p class="textoFooter">En Zenith Organización, estamos comprometidos a proporcionarte una plataforma de gestión de tareas simple y versátil que simplifica la forma en que te organizas, colaboras y logras tus metas. Diseñada para satisfacer las necesidades de todo tipo de público, nuestra plataforma combina la potencia de las herramientas de organización con una interfaz amigable y accesible.</p>
    	</div>
    	<div class="subFooter">
    		<h4 class="tituloFooter">NUESTRA MISIÓN</h4>
    		<p class="textoFooter">Queremos ayudarte a ser más productivo, a mantenerte enfocado en tus objetivos y a colaborar de manera eficaz con tu equipo. En Zenith, creemos que la gestión de tareas no debería ser complicada y que la organización debería estar al alcance de todos.</p>
    		<h4 class="tituloFooter">ÚNETE A ZENITH</h4>
    		<p class="textoFooter">Únete a la creciente comunidad de usuarios de Zenith Organización y descubre una nueva forma de organizarte y alcanzar tus metas. Tanto si eres un profesional ocupado, un estudiante con muchas tareas o simplemente alguien que busca simplificar su vida, Zenith tiene algo que ofrecer.</p>
    	</div>
    	<div class="subFooter">
    		<h4 class="tituloFooter">CONTÁCTANOS</h4>
    		<div class="Footerimages">
    			<img class="contactoFooterImages" alt="Twitter" src="/imagesproyecto/twitter.webp">
    			<img class="contactoFooterImages" alt="Instagram" src="/imagesproyecto/instagram.webp">
    			<img class="contactoFooterImages" alt="Github" src="/imagesproyecto/github.png">
    			<img class="contactoFooterImages" alt="Facebook" src="/imagesproyecto/facebook.png">
    		</div>
    		<div class="footerContacto">
    			<img class="contactoFooterImages" alt="locacion" src="/imagesproyecto/location.png">
    			<p class="textoFooter">:  Maipú 714, Concepción, Chile</p>
    		</div>
    		<div class="footerContacto">
    			<img class="contactoFooterImages" alt="celular" src="/imagesproyecto/cell.png">
    			<p class="textoFooter">:  +56973550175</p>
    		</div>
    		<div class="footerContacto">
    			<img class="contactoFooterImages" alt="email" src="/imagesproyecto/email.png">
    			<p class="textoFooter">:  zenithorganization@gmail.com</p>
    		</div>
    	</div>
    
    </div>
    <script>
        var x = document.getElementById("login");
        var y = document.getElementById("registrar");
        var z = document.getElementById("elegir");

        function login(){
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0px";
        }

        function registrar(){
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "120px"; 
        }


    </script>
</body>
</html>