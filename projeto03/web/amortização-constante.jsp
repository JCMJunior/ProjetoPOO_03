<%@page import="java.text.DecimalFormat"%>
<%-- 
    Document   : amortização-americana
    Created on : 03/04/2018, 21:55:15
    Author     : ktiagot
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %></br>
        <div>Amortização Constante</div>
        <form>
                <p>Valor do empréstimo:</p>
                <input type="number" required="true" name="emp"/><br/>
                <p>Período em meses:</p>
                <input type="number" required="true" name="meses"/><br/>
                <p>Juros (%):</p>
                <input type="number" required="true" name="juros"/><br/>
                <input type="submit" value="Calcular"/>
        </form>
            <hr/>
            <br/>
            <% try { %>
            <%  int meses = Integer.parseInt(request.getParameter("meses"));
                float emprestimo = Float.parseFloat(request.getParameter("emp"));
                float txjuros = Float.parseFloat(request.getParameter("juros"));
                float amortizacao = emprestimo / meses;
                float saldod = emprestimo;
                float prestacao, juros, ps=0, ams=0, js=0 ;
            %>
            <table border="1"><tr><td>Mês</td><td>Saldo Devedor</td><td>Amortização</td><td>Juros</td><td>Prestação</td></td></tr>
                        <tr>
                            <% DecimalFormat round = new DecimalFormat("###,##0.00"); %>
                            <%
                                for(int i=1; i<=meses; i++) {
                                    juros=(meses-i+1)*(txjuros/100)*amortizacao;
                                    prestacao = amortizacao + juros;
                                    saldod = saldod - amortizacao;
                            %>
                            <th><%= i %></th>
                            <td><%= round.format(prestacao) %></td>
                            <td><%= round.format(juros) %></td>
                            <td><%= round.format(amortizacao) %></td>
                            <td><%= round.format(saldod) %></td>
                        </tr>
                            <%}%>
                            
                    </table>
                                
            <%
            } catch (Exception ex) {
                    if (request.getParameter("valor") != null) {
                        out.println(ex);
                    }
                }%>
        
        </table>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
