<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Título de tu página</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Estilos para el navbar */
        .navbar {
            background-color: #4e94d4; /* Color de fondo celeste azul elegante */
            color: white;
            padding: 10px;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000; /* Asegura que esté por encima del contenido */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra suave */
        }

        .navbar-brand {
            font-size: 1.5rem;
            margin-left: 20px;
            display: flex;
            align-items: center; /* Alinea el icono verticalmente */
        }

        .navbar-brand i {
            margin-right: 10px; /* Espacio entre el icono y el texto */
        }

        .navbar-links {
            margin-right: 20px;
        }

        .navbar-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 1.1rem;
        }

        .navbar-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-store-alt"></i> <!-- Icono de bodega -->
            Sistema de Ventas
        </div>
        <div class="navbar-links">
            <a href="#">Inicio</a>
            <a href="#">Productos</a>
            <a href="#">Clientes</a>
            <a href="#">Ventas</a>
            <a href="#">Reportes</a>
        </div>
    </div>
    <!-- Aquí continúa el contenido de tu página -->
</body>
</html>
