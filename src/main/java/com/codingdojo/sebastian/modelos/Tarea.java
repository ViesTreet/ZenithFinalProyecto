package com.codingdojo.sebastian.modelos;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Future;

@Entity
@Table(name="tareas")
public class Tarea {
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String contenido;
	
	private String dia;
	
	private String tipo;
	
	private String estado;
	
	private String tag;
	
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private LocalDate fechaCreacion;
	
	@Future
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private LocalDate fechaLimite;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="usuario_id")
	private Usuario usuarioAsignado;
	
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="proyecto_id")
    private Proyecto tareasProyecto;
	
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="pagina_id")
    private Pagina paginaDeTarea;
    
	public Tarea() {
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	
	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public LocalDate getFechaLimite() {
		return fechaLimite;
	}

	public void setFechaLimite(LocalDate fechaLimite) {
		this.fechaLimite = fechaLimite;
	}

	public Usuario getUsuarioAsignado() {
		return usuarioAsignado;
	}

	public void setUsuarioAsignado(Usuario usuarioAsignado) {
		this.usuarioAsignado = usuarioAsignado;
	}
	
	public Proyecto getTareasProyecto() {
		return tareasProyecto;
	}

	public void setTareasProyecto(Proyecto tareasProyecto) {
		this.tareasProyecto = tareasProyecto;
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

	public Pagina getPaginaDeTarea() {
		return paginaDeTarea;
	}

	public void setPaginaDeTarea(Pagina paginaDeTarea) {
		this.paginaDeTarea = paginaDeTarea;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(LocalDate fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	@PrePersist
	protected void onCreated() {
		this.createdAt = new Date();
	}

	public String getFechaLimiteFormatted() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return fechaLimite.format(formatter);
    }
}
