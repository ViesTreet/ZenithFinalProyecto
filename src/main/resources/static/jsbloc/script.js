// Cuando se envía el formulario, guarda la opción seleccionada en el almacenamiento local
document.querySelector('form').addEventListener('submit', function() {
    var selectedOption = document.querySelector('select[name="tipoTexto"]').value;
    localStorage.setItem('selectedOption', selectedOption);
});

// Cuando se carga la página, recupera la opción seleccionada del almacenamiento local
window.onload = function() {
    var selectedOption = localStorage.getItem('selectedOption');
    if (selectedOption) {
        document.querySelector('select[name="tipoTexto"]').value = selectedOption;
    }
};

document.querySelector('textarea').addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.querySelector('form').submit();
    }
});

window.marcarTarea = function(checkbox, tareaId) {
    const marcada = checkbox.checked ? "checkboxComplete" : "incompleto";
    // Encuentra el label asociado con este checkbox
    const label = document.querySelector(`label[for="${tareaId}"]`);
    // Agrega o quita la clase 'tachado' dependiendo del estado del checkbox
    if (marcada === "checkboxComplete") {
        label.classList.add("tachado");
    } else {
        label.classList.remove("tachado");
    }
    // Realiza una solicitud Ajax para guardar el estado de la tarea
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/guardar-tarea", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // La tarea se ha guardado exitosamente en el servidor
        }
    };
    xhr.send(`tareaId=${tareaId}&marcada=${marcada}`);
}

document.addEventListener("click", function (event) {
    if (event.target.classList.contains("custom-checkbox")) {
        event.target.classList.toggle("checked");
    } else if (event.target.classList.contains("custom-list")) {
        event.target.classList.toggle("checked");
    }
});

