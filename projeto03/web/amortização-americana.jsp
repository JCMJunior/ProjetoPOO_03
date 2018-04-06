<%-- 
    Document   : amortização-americana
    Created on : 03/04/2018, 21:55:15
    Author     : pdonnarumma
    
    PS: É óbvio que vou dar uma arrumada....
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div>Amortização Americana</div>
        <form>
            Digite Valor,Nº de Meses,Juros:<br/>
            <input type = "text" name = "n"/><br/>
            <input type = "text" name = "t"/><br/>
            <input type = "text" name = "q"/><br/>
            <input type = "submit" value= "Calcular"/>
        </form>
        <hr/>
        
        <%try{%>
        <%double n= Double.parseDouble(request.getParameter("n"));%>
        <%double t= Double.parseDouble(request.getParameter("t"));%>
        <%double q= Double.parseDouble(request.getParameter("q"));%>
        
        <%double k= q/100;%>
        <%double s= k * n;%>
        <table border ="1">
            <tr><th>Mês</th><th>Valor</th><th>Juros</th><th>Prestação</th></tr>
            <%for(int i=1; i <=t; i++) {%>
            <tr>
                <th><%= i %></th>
                <td><%= n %></td>
                <td><%= s %></td>
                <td><%= s %></td>
            </tr>
            <%}%>
        </table>
        
        <%}catch(Exception ex) {%>
        Entre com um número válido
        <%}%>
    </body>
</html>
