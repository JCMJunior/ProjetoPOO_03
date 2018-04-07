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
        <meta charset="utf-8">
        <title>Amortização Americana</title>
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
        <br><br><br>
        <br><br><br>
        <center>
        <div width="responsive" height="900px">
    <div class="containner" >
        <div><h2>Amortização Americana</h2></div><br>
        <form>
                <p>Valor do empréstimo:</p>
                <td>
                <label>Digite o valor = <input  type="number"  name="valor"/><br/>
                </td>
                <p>Período em meses:</p>
                <td>
                <label>Qtde de meses = <input type="number"  name="meses"/><br/>
                </td>
                <p>Juros (%):</p>
                <td>
                <label>Taxa de juros = <input type="number"  name="juros"/><br/>
                </td>
                
                <input type="submit" value="Calcular"/>
                
        </form>
        
         <a href="amortização-americana.jsp"><input type="submit" value="Limpar"></a>
       
       
             
        
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

        
                
               
        
        <%}

        catch (Exception ex) {
                    if (request.getParameter("valor") != null) {
                        out.println(ex);
                    }
        }%>
        
        </table>
        
            </div>  
          </div>
       </center>     
        </section><br>
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
