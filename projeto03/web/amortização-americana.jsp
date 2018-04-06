<%@page import="java.text.DecimalFormat"%>
<%-- 
    Document   : amortização-americana
    Created on : 03/04/2018, 21:55:15
    Author     : pdonnarumma
    
    PS: Arrumadu...
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
        </br>
        <div>Amortização Americana</div>
        <form>
                <p>Valor do empréstimo:</p>
                <input type="number" required="true" name="valor"/><br/>
                <p>Período em meses:</p>
                <input type="number" required="true" name="meses"/><br/>
                <p>Juros (%):</p>
                <input type="number" required="true" name="juros"/><br/>
                <input type="submit" value="Calcular"/>
        </form>
        <hr/>
        <br/>
        
        <%try{%>
        <%double n= Double.parseDouble(request.getParameter("valor"));%>
        <%double t= Double.parseDouble(request.getParameter("meses"));%>
        <%double q= Double.parseDouble(request.getParameter("juros"));%>
        
        <%double k= q/100;%>
        <%double s= k * n;%>
        
        <%double tot = 0;%>
        <%double ss = 0;%>
        <%double total = 0;%>


        <table border ="1">
            <tr><th>Mês</th><th>Saldo Devedor</th><th>Amortização</th><th>Juros</th><th>Prestação</th></tr>
            <% DecimalFormat round = new DecimalFormat("###,##0.00"); %>
            <%for(int i=0; i <=t; i++) {%>
            <% if (i == 0) {%>

                <tr>
                <th><%= i %></th>
                <td><%= round.format(n) %></td>
                <td><%= " ---- " %></td>
                <td><%= " ---- " %></td>
                <td><%= " ---- " %></td>
                </tr>

                <%  tot = n + s; 



             }

             else if (i == t) {%>

                <tr>
                <th><%= i %></th>
                <td><%= " ---- " %></td>
                <td><%= round.format(n) %></td>
                <td><%= round.format(s) %></td>
                <td><%= round.format(tot) %></td>
                </tr>



            <%}

              else { %>
                
                <tr>
                <th><%= i %></th>
                <td><%= round.format(n) %></td>
                <td><%= " ---- " %></td>
                <td><%= round.format(s) %></td>
                <td><%= round.format(s) %></td>
                </tr>


            
            <%}%>


            


            <%}%>

            <%  
                 ss = s * t;
                 total = n + ss; 

            %>

                <tr>
                <th><%= "Total" %></th>
                <td><%= " ---- " %></td>
                <td><%= round.format(n) %></td>
                <td><%= round.format(ss) %></td>
                <td><%= round.format(total) %></td>
                </tr>

        </table>
        
        <%}

        catch (Exception ex) {
                    if (request.getParameter("valor") != null) {
                        out.println(ex);
                    }
        }%>
    </body>
</html>
