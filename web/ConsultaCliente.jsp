<%-- 
    Document   : ConsultaCliente
    Created on : 02/04/2015, 21:26:46
    Author     : Ruan
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="model.domain.Socio"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.domain.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="model.application.ClienteBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "UTF-8"> 
        <meta http-equiv="content-language" content="pt-br">
        <meta name="Autor" content="Ruan">
        <meta name="Reply-To" content="XYZ@hotmail.com">
        <meta name="Generator" content="Sublime 3.0">
        <TITLE>Consulta de Clientes</TITLE>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Carregando o CSS do Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />

        <!-- Arquivo Css Criado -->
        <link href="css/style.css" rel="stylesheet" media="screen">
    </head>
    <body bgcolor="white">
        <!-- Menu Superior -->
        <%@ include file="navBar.jsp"%>

        <div class="container-fluid" style="overflow: hidden">
            <div class="row">
                <div class="col-md-2">
                    <%@ include file="menu.jsp"%>
                </div>

                <div class="nav col-sm-10 formCadastro" style="padding-left: 20px">
                    <h2>Consultar Cliente</h2>
                    <%
                        SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
                        Session s = sessions.openSession();

                        String strQuery = "from Cliente";

                        s.beginTransaction();
                        Query qr = s.createQuery(strQuery);
                        List socios = qr.list();
                    %>

                    <div class="row" style="margin-right: 18px">
                        <table class="table table-striped table-hover table-users">
                            <thead>
                                <tr>
                                    <th class="hidden-phone">Cod</th>
                                    <th>Nome</th>
                                    <th class="hidden-phone">CPF</th>
                                    <th>Data de Nascimento</th>
                                    <th class="hidden-phone">Telefone</th>
                                    <th>Status</th>
                                    <th>Editar</th>
                                    <th>Deletar</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    Iterator<Socio> i = socios.iterator();
                                    while (i.hasNext()){			
                                        Socio so = (Socio)i.next();
					
                                        out.println("<tr>"			
                                        + "<td class= \"hidden-phone\">" + so.getNumInscricao()+ "</td>"
                    					+ "<td>" + so.getNome() + "</td>"
                    					+ "<td>" + so.getCpf() + "</td>"
                                        + "<td>" 
                                            + so.getDataNascimento() 
                                        + "</td>"
                    					
                                        + "<td>" 
                                        + so.getTelefone() 
                                        + "</td>");

                                        if(((Cliente)so).isAtivo() == true) {
                                            out.println("<td>" 
                                                    + "<span class= \"label label-danger\"> Ativo </span>" 
                                                    + "</td>");  
                                        }else{
                                            out.println("<td>" 
                                            + "<span class= \"label label-warning\"> Não Ative </span>" 
                                            + "</td>");
                                        }

                                       
                                        out.println("<td>"
                                                        + "<a class= \"btn mini blue-stripe\" href= \"{site_url()}admin/editFront/1\">Edit</a>"
                                                    + "</td>"
                                                    + "<td>"
                                					   + "<a href=\"#\" class=\"confirm-delete btn mini red-stripe\" role=\"button\" data-title=\"johnny\" data-id=\"1\">Delete</a>"
                                					+ "</td>"	
                    				    + "</tr>");
								
                                    }
                                    s.close();
				                %>                               
                            </tbody>
                        </table>
                    </div>
                    <div class="divider divider-single"></div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <!--<script type="text/javascript" src="js/jsProject.js"></script>-->
    </body>
</html>