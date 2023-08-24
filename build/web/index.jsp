<%-- 
    Document   : index
    Created on : 24/08/2023, 07:04:17 PM
    Author     : katay
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>listado de cliente</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt_5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col" colspan="5" class="text-center">!Lista de Cliente</th>
                                <th scope="col" >
                                    <a href="crear.jsp"><i class="fa-solid fa-user-plus" style="color: #e6e6e6;"></i></a>
                                </th>
                            </tr>

                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>
                                <th scope="col" style="color: #21EBEB;">editar</th>
                                <th scope="col" style="color: #F5102F;">eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_cliente?user=root");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM tbl_cliente ORDER BY 1 DESC");
                                while (rs.next()) {
                            %> 
                            <tr>
                                <th scope="row"><%= rs.getInt(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td><a href="editar.jsp?id_cliente=<%= rs.getInt(1)%>&nombre_cliente=<%= rs.getString(2)%>&apellido_cliente=<%= rs.getString(3)%>&direccion_cliente=<%= rs.getString(4)%>&telefono_cliente=<%= rs.getString(5)%>"<i class="fa fa-pencil-alt" style="color: #52BE80;"></i></a></td>
                                <td><a href="borrar.jsp?id_cliente=<%= rs.getInt(1)%>"><i class="fa fa-trash-alt" style="color: #EB180E;"></i></a></td>
                            </tr>
                            <% }

                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
