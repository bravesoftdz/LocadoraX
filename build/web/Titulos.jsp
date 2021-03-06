<%-- 
    Document   : Titulos.jso
    Created on : 28/06/2015, 17:37:55
    Author     : Ruan
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.domain.Titulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset = "UTF-8"> 
        <meta http-equiv="content-language" content="pt-br">
        <meta name="Autor" content="Ruan">
        <meta name="Reply-To" content="XYZ@hotmail.com">
        <meta name="Generator" content="Sublime 3.0">
        <TITLE>Consulta de Titulos</TITLE>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Carregando o CSS do Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />

        <!-- Arquivo Css Criado -->
        <link href="css/style.css" rel="stylesheet" media="screen">
    </head>
    <body bgcolor="white">
        <!-- Menu Superior -->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header col-sm-12">
                    <div class="navbar-brand col-sm-12" href="#" style=" padding-top: 10px">
                                <div class="row">
                                    <div class="nav col-sm-2">
                                        <img alt="" src="img/logo.png">
                                        Locadora   
                                    </div>   
                                </div>
                    </div>
                    
                </div>
            </div>
        </nav>

        <div class="container-fluid" style="overflow: hidden">
            <div class="row nav">
                

                <div class="col-sm-12 formCadastro" style="padding-left: 40px">
                    <%
                        SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
                        Session s = sessions.openSession();

                        String strQuery = "from Titulo";

                        s.beginTransaction();
                        Query qr = s.createQuery(strQuery);
                        List  titulos = qr.list();
                    %>

                    
                    <div class="col-sm-12" style="padding : 0"> 
                        <div class="row">
                            <div class="col-sm-3" style="padding :0">
                                <h1 class="page-title">Consultar Titulo</h1>
                            </div>
                            <div class="col-sm-9" style="padding :0; ">
                                <div class="row">
                                    <div id="input-div" class="col-sm-3" style="float : right; margin-right: 35px;">

                                        <input id="search" class="center-block form-control" placeholder="Search.." autocomplete= "off" />
                                        <div id="suggestions" class="text-center center-block" style="display:none;">
                                            <div id="suggestion-results"></div>
                                        </div>

                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-sm-12" style="padding :0">

                                <%
                                     // Errors
                                    String error = request.getParameter("erro");
                                    if( error != null) {
                                        if(error.equals("0")) {
                                            out.println("<div class='alert alert-success' style = 'margin-right: 35px'>Ação realizada com sucesso!</div>");
                                        } else {
                                            out.println("<div class='alert alert-danger' style = 'margin-right: 35px'>Erro!</div>");
                                        }
                                    }

                                %>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="row" style="margin-right: 18px">
                        <table class="table table-responsive table-striped table-hover table-users">
                            <thead>
                                <tr>
                                    <th class="hidden-phone">Cod</th>
                                    <th>Nome</th>
                                    <th>Ano</th>
                                    <th>Categoria</th>
                                    <th>Classe</th>
                                    <th>Diretor</th>
                                    
                                </tr>
                            </thead>

                            <tbody>

                                <script type="text/javascript">
                                function consultaTitulo(id)
                                {
                                    location.href= "EditarTitulo.jsp?valor="+id;
                                }
                                </script>

                                <%
                                    Iterator<Titulo> i = titulos.iterator();
                                    while (i.hasNext()){            
                                        Titulo titul = (Titulo)i.next();
                                            out.println("<form action= \"ControllerTitulo\" method=\"POST\">"
                                               +" <input type=\"hidden\" name=\"operacao\" value=\"excluir\">");
                                        
                                                                               
                                            out.println("<tr>");
                                            out.println("<td class= \"hidden-phone\">" + titul.getIdTitulo()+ "</td>"
                                                + "<td>" + titul.getNome() + "</td>"
                                                + "<td>" + titul.getAno() + "</td>"
                                                + "<td>" + titul.getCategoria() + "</td>"
                                                + "<td>" + titul.getClasse().getNome() + "</td>"
                                                + "<td>" + titul.getDiretor().getNome() + "</td>"
                                                );

                                            out.println("</tr>");
                                            out.println("</form>");
                                    }
                                    s.close();
                                %>                               
                            </tbody>
                        </table>
                    </div>

                    <!-- Codigo referente ao campo pesquisa -->
                    <span id="no-rows" class="center-block text-center" style="display:none;">No results.</span>


                    <div class="divider divider-single"></div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jsProject.js"></script>
        
    </body>
</html>

