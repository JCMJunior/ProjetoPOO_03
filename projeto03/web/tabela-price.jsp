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
        <meta charset="utf-8">
        <title>Tabela Price</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Clean responsive bootstrap website template">
        <meta name="author" content="">
  <!-- styles -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/docs.css" rel="stylesheet">
        <link href="assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
        <link href="assets/css/flexslider.css" rel="stylesheet">
        <link href="assets/css/refineslide.css" rel="stylesheet">
        <link href="assets/css/font-awesome.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">

        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/color/default.css" rel="stylesheet">        
    </head>
    <body>
        <section main="content">
        <%@include file="WEB-INF/jspf/menu.jspf" %></br>
        <br><br>
        <br><br><br>
        <center>
       <div><h2>Tabela Price</h2></div>
        <form>
            <br>  
            <p>Valor do empréstimo:</p>
                <label>Digite o valor = <input type="number"  name="valor"/><br/>
                <p>Período em meses:</p>
                <label>Qtde de meses = <input type="number" name="meses"/><br/>
                <p>Juros (%):</p>
                <label>Taxa de juros =<input type="number" name="juros"/><br/>
                <input type="submit" value="Calcular"/>
        </form>
     
       <a href="tabela-price.jsp"><input type="submit" value="Limpar"></a>  <br>
       
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
        
    </table><br></center>
            </section>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    
  <script src="assets/js/jquery.js"></script>
  <script src="assets/js/modernizr.js"></script>
  <script src="assets/js/jquery.easing.1.3.js"></script>
  <script src="assets/js/google-code-prettify/prettify.js"></script>
  <script src="assets/js/bootstrap.js"></script>
  <script src="assets/js/jquery.prettyPhoto.js"></script>
  <script src="assets/js/portfolio/jquery.quicksand.js"></script>
  <script src="assets/js/portfolio/setting.js"></script>
  <script src="assets/js/hover/jquery-hover-effect.js"></script>
  <script src="assets/js/jquery.flexslider.js"></script>
  <script src="assets/js/classie.js"></script>
  <script src="assets/js/cbpAnimatedHeader.min.js"></script>
  <script src="assets/js/jquery.refineslide.js"></script>
  <script src="assets/js/jquery.ui.totop.js"></script>
  <!-- Template Custom Javascript File -->
  <script src="assets/js/custom.js"></script>
    </body>
</html>
