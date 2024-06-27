<%@page import="Model.PersonaModel"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Personas</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .table-header h1 {
            margin: 0;
            font-size: 24px;
        }

        .boton button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .boton button:hover {
            background-color: #45a049;
        }

        .outer-wrapper {
            max-height: 500px;
            overflow: auto;
        }

        .table-wrapper {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .table th {
            background-color: #f2f2f2;
            text-align: left;
        }

        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table tr:hover {
            background-color: #f1f1f1;
        }

        .actions {
            display: flex;
            align-items: center;
        }

        .actions button {
            padding: 8px 12px;
            margin: 4px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            position: relative;
        }

        .actions button::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 4px;
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .actions button:hover::before {
            opacity: 1;
        }

        .actions button.edit {
            background-color: #008CBA;
            color: white;
        }

        .actions button.edit:hover {
            background-color: #005f6b;
        }

        .actions button.delete {
            background-color: #f44336;
            color: white;
        }

        .actions button.delete:hover {
            background-color: #d32f2f;
        }

        /* Estilo para el buscador */
        .search-container {
            margin-left: auto;
            margin-right: 20px;
            position: relative;
        }

        .search-container input[type=text] {
            padding: 8px 30px 8px 10px; /* Ajuste el padding para acomodar el icono */
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
            transition: width 0.4s ease-in-out;
            box-sizing: border-box;
        }

        .search-container input[type=text]:focus {
            width: 300px; /* Amplía el campo al hacer clic para enfocar */
        }

        .search-container .search-icon {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            color: #aaa;
            cursor: pointer;
        }

        .search-container .search-icon:hover {
            color: #333;
        }
    </style>
</head>
<body>
    <!-- Encabezado de la tabla -->
    <div class="table-header">
        <h1>Lista de Personas</h1>
        <div class="search-container">
            <input type="text" id="searchInput" onkeyup="buscarPersona()" placeholder="Buscar...">
            <i class="fa fa-search search-icon"></i>
        </div>
        <div class="boton">
            <button onclick="mostrarModal()"><i class="fas fa-plus-circle"></i> Crear</button>
        </div>
    </div>

    <!-- Tabla de personas -->
    <div class="outer-wrapper">
        <div class="table-wrapper">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo</th>
                        <th>Nombre</th>
                        <th>Tipo Documento</th>
                        <th>Num Documento</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<PersonaModel> personas = (List<PersonaModel>) request.getAttribute("personaslista");
                       for (PersonaModel persona : personas) { %>
                    <tr>
                        <td><%= persona.getIdPersona()%></td>
                        <td><%= persona.getTipoPersona()%></td>
                        <td><%= persona.getNomPersona()%></td>
                        <td><%= persona.getTipoDocumento()%></td>
                        <td><%= persona.getNumDocumento()%></td>
                        <td><%= persona.getDireccion()%></td>
                        <td><%= persona.getTelefono()%></td>
                        <td><%= persona.getEmail()%></td>
                        <td class="actions">
                            <button class="edit" onclick="editarPersona(
                                            '<%= persona.getIdPersona()%>',
                                            '<%= persona.getTipoPersona()%>',
                                            '<%= persona.getNomPersona()%>',
                                            '<%= persona.getTipoDocumento()%>',
                                            '<%= persona.getNumDocumento()%>',
                                            '<%= persona.getDireccion()%>',
                                            '<%= persona.getTelefono()%>',
                                            '<%= persona.getEmail()%>')">
                                <i class="fas fa-edit"></i> Editar
                            </button>
                            <button class="delete" onclick="mostrarDeleteModal(<%= persona.getIdPersona()%>)">
                                <i class="fas fa-trash-alt"></i> Eliminar
                            </button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modales para crear, editar y eliminar personas -->
    <!-- Modal para crear nueva persona -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="cerrarModal()">&times;</span>
            <h2>Crear Nueva Persona</h2>
            <form action="PersonaServlet" method="POST">
                <h4>Tipo: </h4><input type="text" name="tipoPersona"><br>
                <h4>Nombre: </h4><input type="text" name="nomPersona"><br>
                <h4>Tipo Documento: </h4><input type="text" name="tipoDocumento"><br>
                <h4>Numero Doc: </h4><input type="text" name="numDocumento"><br>
                <h4>Direccion: </h4><input type="text" name="direccion"><br>
                <h4>Telefono: </h4><input type="text" name="telefono"><br>
                <h4>Email: </h4><input type="text" name="email"><br><br>
                <input type="submit" value="Guardar">
            </form>
        </div>
    </div>

    <!-- Modal para editar persona -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="cerrarEditModal()">&times;</span>
            <h2>Editar Persona</h2>
            <form id="editForm" action="PersonaServlet?action=editar" method="POST">
                <input type="hidden" name="idPersona" id="editIdPersona">
                <h4>Tipo Persona: </h4><input type="text" name="tipoPersona" id="editTipoPersona"><br>
                <h4>Nombre: </h4><input type="text" name="nomPersona" id="editNomPersona"><br>
                <h4>Tipo Documento: </h4><input type="text" name="tipoDocumento" id="editTipoDocumento"><br>
                <h4>Numero Documento: </h4><input type="text" name="numDocumento" id="editNumDocumento"><br>
                <h4>Direccion: </h4><input type="text" name="direccion" id="editDireccion"><br>
                <h4>Telefono: </h4><input type="text" name="telefono" id="editTelefono"><br>
                <h4>Email: </h4><input type="text" name="email" id="editEmail"><br><br>
                <input type="submit" value="Guardar">
            </form>
        </div>
    </div>

    <!-- Modal para confirmar eliminación de persona -->
    <div id="deleteModal" class="modal">
        <div class="modal-content" style="margin: 15% auto;">
            <span class="close" onclick="cerrarDeleteModal()">&times;</span>
            <h2 style="text-align: center">Confirmación de Eliminación</h2>
            <p style="margin: 20px 0">¿Deseas eliminar la persona?</p>
            <div class="botones">
                <button onclick="confirmarEliminar()">SI</button>
                <button onclick="cerrarDeleteModal()">NO</button>
            </div>
        </div>
    </div>

    <!-- Formulario oculto para eliminar persona -->
    <form id="deleteForm" style="display: none" action="PersonaServlet?action=eliminar" method="POST">
        <input type="hidden" name="idPersona" id="deleteIdPersona">
    </form>

    <!-- Incluir FontAwesome para los iconos -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

    <!-- Script para modales y acciones -->
    <script>
        var personaAEliminar = null;

        // Función para mostrar el modal de crear persona
        function mostrarModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = "block";
        }

        // Función para cerrar el modal de crear persona
        function cerrarModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = "none";
        }

        // Función para mostrar el modal de editar persona y llenar los campos
        function editarPersona(id, tipoPersona, nomPersona, tipoDocumento, numDocumento, direccion, telefono, email) {
            document.getElementById('editIdPersona').value = id;
            document.getElementById('editTipoPersona').value = tipoPersona;
            document.getElementById('editNomPersona').value = nomPersona;
            document.getElementById('editTipoDocumento').value = tipoDocumento;
            document.getElementById('editNumDocumento').value = numDocumento;
            document.getElementById('editDireccion').value = direccion;
            document.getElementById('editTelefono').value = telefono;
            document.getElementById('editEmail').value = email;
            mostrarEditModal();
        }

        // Función para mostrar el modal de editar persona
        function mostrarEditModal() {
            var editModal = document.getElementById('editModal');
            editModal.style.display = "block";
        }

        // Función para cerrar el modal de editar persona
        function cerrarEditModal() {
            var editModal = document.getElementById('editModal');
            editModal.style.display = "none";
        }

        // Función para mostrar el modal de eliminar persona
        function mostrarDeleteModal(idPersona) {
            var deleteModal = document.getElementById('deleteModal');
            personaAEliminar = idPersona;
            deleteModal.style.display = "block";
        }

        // Función para cerrar el modal de eliminar persona
        function cerrarDeleteModal() {
            var deleteModal = document.getElementById('deleteModal');
            deleteModal.style.display = "none";
            personaAEliminar = null;
        }

        // Función para confirmar la eliminación de persona
        function confirmarEliminar() {
            if (personaAEliminar !== null) {
                document.getElementById('deleteIdPersona').value = personaAEliminar;
                document.getElementById('deleteForm').submit();
            }
            cerrarDeleteModal();
        }

        // Cerrar modales al hacer clic fuera de ellos
        window.onclick = function(event) {
            var modals = document.getElementsByClassName('modal');
            for (var i = 0; i < modals.length; i++) {
                if (event.target === modals[i]) {
                    modals[i].style.display = "none";
                }
            }
        };

        // Función para filtrar personas en la tabla
        function buscarPersona() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.querySelector(".table");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                let found = false;
                for (let j = 0; j < td.length; j++) {
                    let cell = td[j];
                    if (cell) {
                        txtValue = cell.textContent || cell.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                        }
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>
</body>
</html>
