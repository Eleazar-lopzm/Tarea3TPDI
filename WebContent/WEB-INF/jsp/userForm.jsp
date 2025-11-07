<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Registro de Usuario y Cr�dito</title>
   <style>
     /* Estilo solo para que los errores sean visibles */
     .error {
        color: red; /* Color rojo simple */
        font-style: italic;
      }
      /* Estilo simple para el encabezado */
      h1 {
          color: #11BBB0;
      }
      /* Estilo b�sico para la tabla */
      table {
          width: 80%;
          margin: 10px auto; /* Centrar la tabla */
          border: 1px solid black;
      }
      td {
          padding: 5px;
      }
   </style>
</head>
<body>

<form:form method="POST" commandName="user">
	<table border="0" bgcolor="#f9f9f9">	
		<tr>		 
			<td colspan="4">
			  <center>
			    <h1>Financiera Huanca</h1>
			  </center>
			</td>		 
		</tr>
        <tr>
			<td colspan="4">
			  <h2>Datos Personales</h2>
			</td>		 
		</tr>
		
		<tr>
			<td>Nombre:</td>
			<td><form:input path="nombre" /></td>
			<td colspan="2"><form:errors path="nombre" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Apellidos:</td>
			<td><form:input path="apellidos" /></td>
			<td colspan="2"><form:errors path="apellidos" cssClass="error" /></td>
		</tr>		
		<tr>
			<td>Edad:</td>
			<td><form:input path="edad" /></td>
			<td colspan="2"><form:errors path="edad" cssClass="error" /></td>
		</tr>
        <tr>
            <td>Direcci�n:</td>
            <td><form:input path="direccion" /></td>
            <td colspan="2"><form:errors path="direccion" cssClass="error" /></td>
        </tr>
		<tr>
			<td>G�nero:</td>
			<td>
				<form:radiobutton path="genero" value="M" label="Masculino" /> 
				<form:radiobutton path="genero" value="F" label="Femenino" />
			</td>
			<td colspan="2"><form:errors path="genero" cssClass="error" /></td>	
		</tr>
        
        <tr>
			<td colspan="4"><br></td>
		</tr>
        <tr>
			<td colspan="4">
			  <h2>Datos del Cr�dito</h2>
			</td>		 
		</tr>
        
        <tr>
            <td>Fecha Solicitud:</td>
            <td><form:input path="fecha" type="date" /></td> 
            <td colspan="2"><form:errors path="fecha" cssClass="error" /></td>
            <td></td>
        </tr>
        <tr>
            <td>Moneda:</td>
            <td colspan="3">
                <form:radiobutton path="moneda" value="Pesos" label="Pesos(MX$)" /> 
                <form:radiobutton path="moneda" value="Dolares" label="D�lares (US$)" />
            </td>
            <td><form:errors path="moneda" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Monto:</td>
            <td><form:input path="monto" type="number" step="0.01" />
            <form:errors path="monto" cssClass="error"/>
            </td>
            
            <td>Per�odo (meses):</td>
            <td>
            <form:input path="periodo" type="number" />
            <form:errors path="periodo" cssClass="error" />
            </td>
            
        </tr>
        <tr>
            <td>Cuota:</td>
            <td><form:input path="cuota" type="number" step="0.01" /></td>
            <td><form:errors path="cuota" cssClass="error" /></td>
            <td></td>
        </tr>
        <tr>
            <td>TEA (%):</td>
            <td>
            <form:input path="TEA" type="number" />
             <form:errors path="TEA" cssClass="error" />
             </td>
            <td>Fecha Vencimiento:</td>
            <td>
            <form:input path="fechaVencimiento" type="date" />
           
            <form:errors path="fechaVencimiento" cssClass="error" />
            </td>
        </tr>

        <tr>
		  <td colspan="4">
		    <br>
		  </td>
		</tr>
		<tr>		 
			<td colspan="4">
			  <center>
			    <input type="submit" value="ACEPTAR">
			  </center>
			</td>		 
		</tr>
	</table>
            
        <tr>
            <td colspan="4"><br><h2>Gastos con tarjeta de cr�dito</h2></td>
        </tr>
        <tr>
            <td colspan="4">
                <table border="1" style="width:100%; background-color: #e0e0e0;">
                    <tr>
                        <th>FECHA</th>
                        <th>MES</th>
                        <th>TARJETA</th>
                        <th>TRANSACCION</th>
                        <th>GASTOS</th>
                        <th>PAGOS (Editable)</th>
                    </tr>
                    
                    <c:forEach items="${user.gastos}" var="gasto" varStatus="status">
                    <c:set var="gastoIndex" value="${status.index}" scope="page"/>
                        <tr>
                            <td><c:out value="${gasto.fecha}"/></td>
                            <td><c:out value="${gasto.mes}"/></td>
                            <td><c:out value="${gasto.tarjeta}"/></td>
                            <td><c:out value="${gasto.transaccion}"/></td>
                            <td><c:out value="${gasto.gastos}"/></td>                            
                            <td>
                <form:input path="gastos[${gastoIndex}].pagos" />
                <form:hidden path="gastos[${gastoIndex}].id" />
                <!-- Enviar también los campos descriptivos para que aparezcan en userSuccess sin recargar desde BD -->
                <form:hidden path="gastos[${gastoIndex}].fecha" />
                <form:hidden path="gastos[${gastoIndex}].transaccion" />
                <form:hidden path="gastos[${gastoIndex}].gastos" />
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
        <tr>
          <td colspan="4">
            <br>
          </td>
        </tr>
        <tr>         
            <td colspan="4">
              <center>
                <input type="submit" value="ACEPTAR">
              </center>
            </td>         
        </tr>
    </table>
</form:form>
    

</body>
</html>