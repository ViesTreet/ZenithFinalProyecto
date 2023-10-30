var modal = document.getElementById("editModal");
var formularioModal = document.querySelector(".formularioModal");

// Función para abrir el modal
function openModal() {
  modal.style.display = "flex";
}

// Función para cerrar el modal
function closeModal() {
  modal.style.display = "none";
}

// Obtén todos los iconos de edición
var editIcons = document.getElementsByClassName("bxs-edit");

// Añade un event listener a cada icono de edición para abrir el modal
for (var i = 0; i < editIcons.length; i++) {
  editIcons[i].addEventListener("click", function(event) {
    // Obtén el elemento li más cercano al botón de edición y extrae la información del proyecto
    var proyectoElement = event.target.closest('li');
    var proyectoId = proyectoElement.dataset.id;
    var proyectoTitulo = proyectoElement.dataset.titulo;
    var proyectoDescripcion = proyectoElement.dataset.descripcion;

    // Coloca la información del proyecto en los campos de entrada
    document.querySelector('input[name="titulo"]').value = proyectoTitulo;
    document.querySelector('input[name="descripcion"]').value = proyectoDescripcion;
    document.querySelector('input[name="proyectoId"]').value = proyectoId;


    openModal();
  });
}

// Añade un event listener al modal para cerrarlo cuando se haga clic fuera del formulario
modal.addEventListener("click", function(event) {
  if (event.target == modal) {
    closeModal();
  }
});

// Evita que el modal se cierre cuando se haga clic dentro del formulario
formularioModal.addEventListener("click", function(event) {
  event.stopPropagation();
});

