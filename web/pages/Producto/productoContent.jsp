<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.ArticuloModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Productos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            overflow: auto;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 8px;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: #000000;
            text-decoration: none;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            position: relative;
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

        /* Estilo específico para los botones en los encabezados */
        .table th.actions {
            position: sticky;
            right: 0;
            background-color: #f0f0f0;
            z-index: 1;
        }

        /* Estilo para el buscador */
        .search-container {
            position: relative;
            margin-right: 20px;
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
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModal()">&times;</span>
        <h2>Crear Nuevo Artículo</h2>
        <form action="ProductoServlet" method="POST">
            <h4>ID Categoría: </h4><input type="text" name="idCategoria"><br>
            <h4>Código: </h4><input type="text" name="codigo"><br>
            <h4>Nombre del Artículo: </h4><input type="text" name="nomArticulo"><br>
            <h4>Precio de Venta: </h4><input type="text" name="precioVenta"><br>
            <h4>Stock: </h4><input type="text" name="stock"><br>
            <h4>Descripción: </h4><input type="text" name="descripcion"><br>
            <h4>Estado: </h4><input type="text" name="estado"><br><br>
            <input type="submit" value="Guardar">
        </form>
    </div>
</div>

<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarEditModal()">&times;</span>
        <h2>Editar Artículo</h2>
        <form id="editForm" action="ProductoServlet?action=editar" method="POST">
            <input type="hidden" name="idArticulo" id="editIdArticulo">
            <h4>ID Categoría: </h4><input type="text" name="idCategoria" id="editIdCategoria"><br>
            <h4>Código: </h4><input type="text" name="codigo" id="editCodigo"><br>
            <h4>Nombre del Artículo: </h4><input type="text" name="nomArticulo" id="editNomArticulo"><br>
            <h4>Precio de Venta: </h4><input type="text" name="precioVenta" id="editPrecioVenta"><br>
            <h4>Stock: </h4><input type="text" name="stock" id="editStock"><br>
            <h4>Descripción: </h4><input type="text" name="descripcion" id="editDescripcion"><br>
            <h4>Estado: </h4><input type="text" name="estado" id="editEstado"><br><br>
            <input type="submit" value="Guardar">
        </form>
    </div>
</div>

<div id="deleteModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarDeleteModal()">&times;</span>
        <h2 style="text-align: center">Confirmación de Eliminación</h2>
        <p style="margin: 20px 0">¿Deseas eliminar el producto?</p>
        <div class="botones">
            <button onclick="confirmarEliminar()">SI</button>
            <button onclick="cerrarDeleteModal()">NO</button>
        </div>
    </div>
</div>

<div class="table-header">
    <h1>Lista de Productos</h1>
    <div class="search-container">
        <input type="text" id="searchInput" onkeyup="buscarProducto()" placeholder="Buscar...">
        <i class="fa fa-search search-icon"></i>
    </div>
    <div class="boton">
        <button onclick="mostrarModal()">Nuevo Producto</button>
    </div>
</div>

<div class="table-wrapper outer-wrapper">
    <div class="table-wrapper">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>ID Categoría</th>
                <th>Código</th>
                <th>Nombre del Artículo</th>
                <th>Precio de Venta</th>
                <th>Stock</th>
                <th>Descripción</th>
                <th>Estado</th>
                <th class="actions">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <% List<ArticuloModel> articulos = (List<ArticuloModel>) request.getAttribute("articuloslista");
                for (ArticuloModel articulo : articulos) { %>
                <tr>
                    <td><%= articulo.getIdArticulo() %></td>
                    <td><%= articulo.getIdCategoria() %></td>
                    <td><%= articulo.getCodigo() %></td>
                    <td><%= articulo.getNomArticulo() %></td>
                    <td><%= articulo.getPrecioVenta() %></td>
                    <td><%= articulo.getStock() %></td>
                    <td><%= articulo.getDescripcion() %></td>
                    <td><%= articulo.getEstado() %></td>
                    <td class="actions">
                        <button class="edit" onclick="editarArticulo(
                                        '<%= articulo.getIdArticulo() %>',
                                        '<%= articulo.getIdCategoria() %>',
                                        '<%= articulo.getCodigo() %>',
                                        '<%= articulo.getNomArticulo() %>',
                                        '<%= articulo.getPrecioVenta() %>',
                                        '<%= articulo.getStock() %>',
                                        '<%= articulo.getDescripcion() %>',
                                        '<%= articulo.getEstado() %>')">
                            <i class="fas fa-edit"></i> Editar
                        </button>
                        <button class="delete" onclick="mostrarDeleteModal(<%= articulo.getIdArticulo() %>)">
                            <i class="fas fa-trash-alt"></i> Eliminar
                        </button>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<form id="deleteForm" style="display: none" action="ProductoServlet?action=eliminar" method="POST">
    <input type="hidden" name="idArticulo" id="deleteIdArticulo">
</form>

<script>
    var modal = document.getElementById('myModal');
    var editModal = document.getElementById('editModal');
    var deleteModal = document.getElementById('deleteModal');
    var spanCerrar = modal.getElementsByClassName("close")[0];
    var spanEditCerrar = editModal.getElementsByClassName("close")[0];
    var spanDeleteCerrar = deleteModal.getElementsByClassName("close")[0];
    var articuloAEliminar = null;

    function mostrarModal() {
        modal.style.display = "block";
    }

    function cerrarModal() {
        modal.style.display = "none";
    }

    function mostrarEditModal() {
        editModal.style.display = "block";
    }

    function cerrarEditModal() {
        editModal.style.display = "none";
    }

    function mostrarDeleteModal(idArticulo) {
        articuloAEliminar = idArticulo;
        deleteModal.style.display = "block";
    }

    function cerrarDeleteModal() {
        deleteModal.style.display = "none";
        articuloAEliminar = null;
    }

    window.onclick = function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
        if (event.target === editModal) {
            editModal.style.display = "none";
        }
        if (event.target === deleteModal) {
            deleteModal.style.display = "none";
        }
    };

    function editarArticulo(id, idCategoria, codigo, nomArticulo, precioVenta, stock, descripcion, estado) {
        document.getElementById('editIdArticulo').value = id;
        document.getElementById('editIdCategoria').value = idCategoria;
        document.getElementById('editCodigo').value = codigo;
        document.getElementById('editNomArticulo').value = nomArticulo;
        document.getElementById('editPrecioVenta').value = precioVenta;
        document.getElementById('editStock').value = stock;
        document.getElementById('editDescripcion').value = descripcion;
        document.getElementById('editEstado').value = estado;
        mostrarEditModal();
    }

    function confirmarEliminar() {
        if (articuloAEliminar !== null) {
            document.getElementById('deleteIdArticulo').value = articuloAEliminar;
            document.getElementById('deleteForm').submit();
        }
        cerrarDeleteModal();
    }

    function buscarProducto() {
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
