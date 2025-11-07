<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Detalle del Registro Exitoso</title>
    <style>
    /* Estilo b�sico de tabla: bordes simples y ancho de 50% */
    table {
      border-collapse: collapse;
      width: 50%;
      margin-top: 10px;
      margin-bottom: 10px;
      border: 1px solid black;
    }
    th, td {
      border: 1px solid black; 
      padding: 5px;
      text-align: left;
    }
    th {
      background-color: #cccccc; 
    }
  </style>
</head>
<body>
  <h1>Detalle del Usuario y Cr�dito</h1>
  <hr>

  <h2>Datos Personales</h2>
  <table>
    <tr>
      <th>Campo</th>
      <th>Valor</th>
    </tr>
    <tr>
      <td>Nombre</td>
      <td>${user.nombre}</td>
    </tr>
    <tr>
      <td>Apellidos</td>
      <td>${user.apellidos}</td>
    </tr>
    <tr>
      <td>Edad</td>
      <td>${user.edad}</td>
    </tr>  
    <tr>
      <td>G�nero</td>
      <td>${user.genero}</td>
    </tr>
    <tr>
      <td>Direcci�n</td>
      <td>${user.direccion}</td>
    </tr>
  </table>

  <h2>Datos del Cr�dito</h2>
  <table>
    <tr>
      <th>Campo</th>
      <th>Valor</th>
    </tr>
    <tr>
      <td>Fecha de Solicitud</td>
      <td>${user.fecha}</td>
    </tr>
    <tr>
      <td>Moneda</td>
      <td>${user.moneda}</td>
    </tr>
    <tr>
      <td>Monto Solicitado</td>
      <td>${user.monto}</td>
    </tr>
    <tr>
      <td>Periodo (meses)</td>
      <td>${user.periodo}</td>
    </tr>
    <tr>
      <td>Cuota</td>
      <td>${user.cuota}</td>
    </tr>
    <tr>
      <td>TEA (%)</td>
      <td>${user.TEA}</td>
    </tr>
    <tr>
      <td>Fecha de Vencimiento</td>
      <td>${user.fechaVencimiento}</td>
    </tr>
  </table>
    
    <h2>Gastos y Pagos Registrados</h2>
  <table>
      <tr>
          <th>FECHA</th>
          <th>TRANSACCION</th>
          <th>GASTOS</th>
          <th>PAGOS REGISTRADOS</th>
      </tr>
      <%-- Iteramos sobre la lista para mostrar los datos guardados --%>
      <c:forEach items="${user.gastos}" var="gasto">
          <tr>
              <td>${gasto.fecha}</td>
              <td>${gasto.transaccion}</td>
              <td>${gasto.gastos}</td>
              <td>${gasto.pagos}</td> <%-- Mostramos el pago que se guard� --%>
          </tr>
      </c:forEach>
  </table>

</body>
</html>