<%-- 
    Document   : editar
    Created on : 24/08/2023, 07:10:30 PM
    Author     : katay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>Actualizar cliente</title>
    </head>
    <body>
        <%
            String strID = request.getParameter("id_cliente");
            String strNombre = request.getParameter("nombre_cliente");
            String strApellido = request.getParameter("apellido_cliente");
            String strDireccion = request.getParameter("direccion_cliente");
            String strTelefono = request.getParameter("telefono_cliente");
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <h1>editar cliente</h1>
                    <form  action="editar.jsp" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label>Nombre</label>
                                <input name="nombre_cliente" value="<%=strNombre%>" type="text" class="form-control"  placeholder="nombre" required="">
                            </div>
                            <div class="form-group col-md-5">
                                <label>Apellido</label>
                                <input name="apellido_cliente" value="<%=strApellido%>" type="text" class="form-control"  placeholder="apellido" required="">
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label>Direccion</label>
                            <input name="direccion_cliente" value="<%=strDireccion%>" type="text" class="form-control"  placeholder="direccion" required="">
                        </div>
                        <div class="form-group col-md-5">
                            <label>Telefono</label>
                            <input name="telefono_cliente" value="<%=strTelefono%>" type="text" class="form-control" aria-describedby="emailHelp" placeholder="telefono" required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">Registrar <i class="fa fa-arrow-right"></i></button>
                        <a href="index.jsp" class="bnt btn-success">Cancelar <i class="fa fa-user-alt-slash"></i></a>
                        <input type="hidden" name="id_cliente" value="<%=strID%>">
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_cliente?user=root");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE tbl_cliente SET nombre_cliente = '" + strNombre + "', apellido_cliente='" + strApellido + "', direccion_cliente='" + strDireccion + "', telefono_cliente='" + strTelefono + "' WHERE id_cliente='" + strID + "'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
