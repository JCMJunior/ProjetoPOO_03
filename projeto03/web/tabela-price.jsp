<%@page import="java.text.DecimalFormat"%>
<%-- 
    Document   : tabela-price
    Created on : 03/04/2018, 21:55:15
    Author     : pdonnaruma
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div>Tabela Price</div>
        <form>
                <p>Valor do empréstimo:</p>
                <input type="number" required="true" name="valor"/><br/>
                <p>Período em meses:</p>
                <input type="number" required="true" name="meses"/><br/>
                <p>Juros (%):</p>
                <input type="number" required="true" name="juros"/><br/>
                <input type="submit" value="Calcular"/>
        </form>
            <br/>
            <% try { %>
            <%  int meses = Integer.parseInt(request.getParameter("meses"));
                double valor = Double.parseDouble(request.getParameter("valor"));
                double juros = Double.parseDouble(request.getParameter("juros"));

                double njuros = juros/100;
                double cjuros = njuros * valor;

                double mesess = meses;

                double sx = 1 + njuros;
                double sxn = 1 + njuros;
                double nx = Math.pow(sx, mesess) * njuros;
                double nxt = Math.pow(sx, mesess) - 1;
                double snn = nx/nxt;

                double prestfixa = valor * snn;
                double amort = prestfixa - cjuros;

                double sdd = 0;
                double stt = 0;
                double sta = 0;
                double nwjuros = 0;
                double nwamort = 0;


                
            %>
            <table border="1"><tr><td>Mês</td><td>Prestação</td><td>Juros</td><td>Amortização</td><td>Saldo Devedor</td></td></tr>
                        <tr>
                            <% DecimalFormat round = new DecimalFormat("###,##0.00"); %>
                            <%
                                for(int i=0; i<=meses; i++) {
                                    if ( i == 0) { %>
      
                                        <th><%= i %></th>
                                        <td><%= " ----- " %></td>
                                        <td><%= " ----- " %></td>
                                        <td><%= " ----- " %></td>
                                        <td><%= round.format(valor) %></td>        
         
                                    <%}
                                    else if ( i == 1) {

                                        valor = valor - amort; %>

                                        <th><%= i %></th>
                                        <td><%= round.format(prestfixa) %></td>
                                        <td><%= round.format(cjuros) %></td>
                                        <td><%= round.format(amort) %></td>
                                        <td><%= round.format(valor) %></td> 

                                        <%  stt = cjuros;
                                            sta = amort;



                                    }

                                    

                                    else {

                                    nwjuros = valor * njuros;
                                    nwamort = prestfixa - nwjuros;
                                    valor = valor - nwamort;

                                    %>
                                        <th><%= i %></th>
                                        <td><%= round.format(prestfixa) %></td>
                                        <td><%= round.format(nwjuros) %></td>
                                        <td><%= round.format(nwamort) %></td>
                                        <td><%= round.format(valor) %></td>

                                    <%

                                    }

                                    sdd += prestfixa;
                                    stt += nwjuros;
                                    sta += nwamort;

                                    %>


                        </tr>
                            <%}%>

                            <td><%="Total"%></td><td><%= round.format(sdd) %></td><td><%= round.format(stt) %></td><td><%= round.format(sta) %></td><td><%="  ---  "%></td>
                            
                    </table>
                                
            <%
            } catch (Exception ex) {
                    if (request.getParameter("valor") != null) {
                        out.println(ex);
                    }
            }%>
        
        </table>
    </body>
</html>
