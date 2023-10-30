package com.codingdojo.sebastian.modelos;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="usuarios")
public class Usuario {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="pone el nombre ")
	@Size(min=2,message="el nombre tiene que tener al menos 2 caracteres")
	private String Nombre;
	
	@NotEmpty(message="pone el apellido ")
	@Size(min=2,message="el apellido tiene que tener al menos 2 caracteres")
	private String apellido;
	
	@NotEmpty(message="pone el email ")
	@Email(message="el Email tiene que ser valido")
	private String email;
	
	@NotEmpty(message="pone la contraseña ")
	@Size(min=8,message="la contraseña tiene que tener al menos 8 caracteres ")
	private String password;
	
	@Transient
	@NotEmpty(message="escribe bien la confirmacion ")
	@Size(min=8,message="la confirmacion tiene que tener al menos 8 caracteres ")//no guarda la data en el sql
	private String confirmPassword;
	
	@OneToMany(mappedBy="creador", fetch=FetchType.LAZY)
    private List <Proyecto> misProyectos;
	
	@OneToMany(mappedBy="usuarioAsignado", fetch=FetchType.LAZY)
	private List <Tarea> misTareas;
	
    @OneToMany(mappedBy = "usuarioPagina", cascade = CascadeType.ALL)
    private List<Pagina> misPaginas;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	public Usuario() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	public List<Proyecto> getMisProyectos() {
		return misProyectos;
	}

	public void setMisProyectos(List<Proyecto> misProyectos) {
		this.misProyectos = misProyectos;
	}
	
	public List<Tarea> getMisTareas() {
		return misTareas;
	}

	public void setMisTareas(List<Tarea> misTareas) {
		this.misTareas = misTareas;
	}
	
	public List<Pagina> getMisPaginas() {
		return misPaginas;
	}

	public void setMisPaginas(List<Pagina> misPaginas) {
		this.misPaginas = misPaginas;
	}

	@PrePersist
	protected void onCreated() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	
	
	
}
