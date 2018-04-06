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
        <div>Amortização Constante</div>
        <form>
            <p>Valor emprestimo:</p>
                <input type="number" required="true" name="emp"/><br/>
                <p>Quantidade de meses:</p>
                <input type="number" required="true" name="meses"/><br/>
                <p>Juros (%):</p>
                <input type="number" required="true" name="juros"/><br/>
                <input type="submit" value="Calcular"/>
        </form>
            <br/>
            <% try { %>
            <%  int meses = Integer.parseInt(request.getParameter("meses"));
                float emprestimo = Float.parseFloat(request.getParameter("emp"));
                float txjuros = Float.parseFloat(request.getParameter("juros"));
                float amortizacao = emprestimo / meses;
                float saldod = emprestimo;
                float prestacao;
                float juros;
            %>
        <tr><th>Mês</th><th>Saldo devedor</th><th>Amortização</th><th>Juros</th><th>Prestação</th></tr>
        <tr>
                            <th>0</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                            </td>
                        </tr>
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
            } catch (Exception e) {
                    if (request.getParameter("valor") != null) {
                        out.println(e);
                    }
                }%>
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
