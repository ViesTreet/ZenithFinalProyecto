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
		        <img src="imglogin/gp.png" alt="icono_Googleplus"> Iniciar sesión con Google
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