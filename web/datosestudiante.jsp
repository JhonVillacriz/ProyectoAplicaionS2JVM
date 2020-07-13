<%-- 
    Document   : datosestudiante
    Created on : 15/06/2020, 09:19:02 AM
    Author     : MONARCA
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Estudiante</title>
        
        <%!
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs ;
        String s_accion ;
        String s_idestudiante;     
        %>
    <body>
        <h1>Datos Estudiante</h1> 
       
        <table border="1" cellspacing="0" celladding="" align="center">
            <thead>
                <tr>
                    <th colspan="8">Datos Estudiante</th>
                </tr>
                <tr>
                    <th>#</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Código</th>
                    <th>Estado</th>
                    <th>Eleminar</th>
                    <th>Editar</th>
                </tr>
            </thead>
            
            
       

        
        <% 
        //ecepcion
        try {
        ConectaBd bd = new ConectaBd() ; 
        cn= bd.getConnection();
        
         s_accion = request.getParameter("f_accion");
                s_idestudiante = request.getParameter("f_idestudiante");
                
                if (s_accion !=null) {
                    if (s_accion.equals("E")) {
                            consulta =    " delete from estudiante "
                                        + " where  "
                                        + " idestudiante = " + s_idestudiante +"; ";
                            out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }                    
                }
        
        consulta= " Select idestudiante , nombre ,apellidos,dni,codigo,estado "
        + " from estudiante " ;
          //consulta= " Select idestudiante, nombre, apellidos, dni, codigo, estado "
            //            + " from estudiante ";

      // out.println(consulta);
        pst = cn.prepareStatement(consulta);
        //rs es una lista (arreglo)
        rs = pst.executeQuery() ;
        String ide ;
        int num = 0 ;
        
        while (rs.next()) {  
            
        ide = rs.getString(1);
        num ++; 
            %>
            <tbody>
                <tr>
                   <td><% out.print(rs.getString(1)); %></td>
                   <td><% out.print(rs.getString(2)); %></td>
                   <td><% out.print(rs.getString(3)); %></td>
                   <td><% out.print(rs.getString(4)); %></td>
                   <td><% out.print(rs.getString(5)); %></td>
                   <td><% out.print(rs.getString(6)); %></td>
                   <td><a href="datosestudiante.jsp?f_accion=E&f_idestudiante=<%out.print(ide);%>">Eliminar</a></td>                 
                   <td>Editar</td>
                   
                </tr>
      
            
            <%
                     
            }
        }catch (Exception e){
            out.print("Error SQL");
            
            
        }
        %>
        </tbody>
             </table>
    </body>
</html>
