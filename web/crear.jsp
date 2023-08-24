<%-- 
    Document   : crear
    Created on : 24/08/2023, 07:07:09 PM
    Author     : katay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>nuevos  cliente</title>
    </head>
    <body>
      <div class="container mt_5">
            <div class="row">
                <div class="col-sm">
                    <h1>ingresar clientes</h1>
                    <form  action="crear.jsp" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label>Nombre</label>
                                <input name="nombre_cliente" type="text" class="form-control"  placeholder="nombre" required="">
                            </div>
                            <div class="form-group col-md-5">
                                <label>Apellido</label>
                                <input name="apellido_cliente" type="text" class="form-control"  placeholder="apellido" required="">
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label>Direccion</label>
                            <input name="direccion_cliente" type="text" class="form-control"  placeholder="direccion" required="">
                        </div>
                        <div class="form-group col-md-5">
                            <label>Telefono </label>
                            <input name="telefono_cliente" type="text" class="form-control" aria-describedby="emailHelp" placeholder=" telefoni" required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">Registrar <i class="fa fa-arrow-right"></i></button>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                String strNombre = request.getParameter("nombre_cliente");
                String strApellido = request.getParameter("apellido_cliente");
                String strDireccion = request.getParameter("direccion_cliente");
                String strTelefono = request.getParameter("telefono_cliente");
                try {
                    Connection con = null;
                    Statement st = null;
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_cliente?user=root");
                    st = con.createStatement();
                    st.execute("INSERT INTO tbl_cliente(nombre_cliente,apellido_cliente,direccion_cliente,telefono_cliente) VALUES('" + strNombre + "', '" + strApellido + "','" + strDireccion + "' ,'" + strTelefono + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
