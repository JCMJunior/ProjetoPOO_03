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
        <meta charset="utf-8">
        <title>Amortização Constante</title>
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
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <br><br></br>
        <br><br><br>
        <center>
            <div width="responsive" height="900px">
                 <div class="containner" >
                     <div><h2>Amortização Constante</h2></div><br>
        <form>
                <p>Valor do empréstimo:</p>
                <label>Digite o valor =<input type="number"  name="emp"/><br/>
                <p>Período em meses:</p>
                <label>Qtde de meses =<input type="number"  name="meses"/><br/>
                <p>Juros (%):</p>
                 <label>Taxa de juros =<input type="number"  name="juros"/><br/>
                <input type="submit" value="Calcular"/>
        </form>
                     <a href="amortização-constante.jsp"><input type="submit" value="Limpar"></a>
           
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
        </div>
        </section><br>
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
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
</html>
