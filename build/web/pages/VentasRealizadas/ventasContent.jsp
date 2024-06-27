<%@page import="Model.VentaModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.ArticuloModel" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de Ventas</title>
        <!-- Enlace a FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <div class="table-header">
            <h1>Lista de Ventas</h1>
        </div>
        <div class="outer-wrapper">
            <div class="table-wrapper" style="max-height: 500px; overflow: scroll;">
                <table class="table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-id-card"></i> ID</th>
                            <th><i class="fas fa-user"></i> ID CLIENTE</th>
                            <th><i class="fas fa-user-tie"></i> ID USUARIO</th>
                            <th><i class="fas fa-receipt"></i> COMPROBANTE</th>
                            <th><i class="fas fa-list-ol"></i> SERIE</th>
                            <th><i class="fas fa-list-ol"></i> NUMERO</th>
                            <th><i class="fas fa-calendar-alt"></i> FECHA</th>
                            <th><i class="fas fa-percentage"></i> IMPUESTO</th>
                            <th><i class="fas fa-dollar-sign"></i> TOTAL</th>
                            <th><i class="fas fa-check-circle"></i> ESTADO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<VentaModel> ventas = (List<VentaModel>) request.getAttribute("ventaslista");

                           for (VentaModel venta : ventas) {
                        %>
                        <tr>
                            <td><%= venta.getIdVenta()%></td>
                            <td><%= venta.getIdCliente()%></td>
                            <td><%= venta.getIdUsuario()%></td>
                            <td><%= venta.getTipoComprobante()%></td>
                            <td><%= venta.getSerieComprobante()%></td>
                            <td><%= venta.getNumComprobante()%></td>
                            <td><%= venta.getFechaHora()%></td>
                            <td><%= venta.getImpuesto()%></td>
                            <td><%= venta.getTotal()%></td>
                            <td><%= venta.getEstado()%></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            var modal = document.getElementById('myModal');
            var btnAbrir = document.querySelector('button');
            var spanCerrar = document.getElementsByClassName("close")[0];

            function mostrarModal() {
                modal.style.display = "block";
            }

            function cerrarModal() {
                modal.style.display = "none";
            }

            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        </script>
    </body>
</html>
