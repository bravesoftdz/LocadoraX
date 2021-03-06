<%-- 
    Document   : CadastraTitulo
    Created on : 09/04/2015, 08:31:58
    Author     : Ruan
--%>
<%@ include file="sessao1.jsp"%>
<%@page import="model.domain.Ator"%>
<%@page import="model.domain.Diretor"%>
<%@page import="model.domain.Classe"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.domain.Distribuidor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "UTF-8"> 
        <meta http-equiv="content-language" content="pt-br">
        <meta name="Autor" content="Ruan">
        <meta name="Reply-To" content="XYZ@hotmail.com">
        <meta name="Generator" content="Sublime 3.0">
        <TITLE>Cadastro de Título</TITLE>

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
                    <h2>Cadastro de Título</h2>
                    <%
                        // Errors
                        String error = request.getParameter("erro");
                        if (error != null) {
                            if (error.equals("0")) {
                                out.println("<div class='alert alert-success' style = 'margin-right: 35px'>Ação realizada com sucesso!</div>");
                            } else {
                                out.println("<div class='alert alert-danger' style = 'margin-right: 35px'>Erro!</div>");
                            }
                        }
                    %>
                    <div class="row">
                        <form action= "ControllerTitulo" method="POST">
                            <input type="hidden" name="operacao" value="cadastrar">                    
                            <div class="nav col-sm-12 "> 
                                <div class="nav row">
                                    <label for="Nome" class="col-sm-12">Nome</label>
                                    <div class="input-group input-group-sm col-sm-5">
                                        <input type="text" class="form-control" placeholder="Nome" name="nome">
                                    </div>
                                </div>
                            </div>

                            <div class="nav col-sm-12"> 
                                <div class="nav row">
                                    <div class="input-group input-group-sm col-sm-5">
                                        <div class="row" style="margin :0">
                                            <div class="col-sm-6">
                                                <div class="row">
                                                    <label for="" class="col-sm-12">Ano</label>
                                                    <div class="col-sm-11" style="padding :0">
                                                        <input type="text" class="form-control" placeholder="Ano" name="ano">
                                                    </div> 
                                                </div>

                                            </div>
                                            <div class="col-sm-6">
                                                <div class="row">
                                                    <label for="" class="col-sm-12">Categoria </label>
                                                    <div class="col-sm-12" style="padding :0">
                                                        <input type="text" class="form-control" placeholder="Categoria" name="categoria">
                                                    </div> 
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="nav col-sm-12"> 
                                <div class="nav row">
                                    <div class="input-group input-group-sm col-sm-5">
                                        <div class="row" style="margin :0">
                                            <div class="col-sm-6">
                                                <div class="row">
                                                    <%
                                                        SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
                                                        Session s = sessions.openSession();

                                                        //Listagem de socios
                                                        String strQuery = "from Distribuidor";

                                                        s.beginTransaction();
                                                        Query qr = s.createQuery(strQuery);
                                                        List dist = qr.list();
                                                        s.close();
                                                    %>
                                                    <label for="" class="col-sm-12">Distribuidor</label>
                                                    <div class="col-sm-11" style="padding :0">
                                                        <select name="distribuidor" class="form-control">
                                                            <%                                                   
                                                                Iterator i = dist.iterator();
                                                                while (i.hasNext()) {

                                                                    Distribuidor d = (Distribuidor) i.next();
                                                            %>  
                                                            <option value="<%out.println(d.getCnpj());%>"><%out.println(d.getRazaoSocial());%></option>
                                                            <%}%>
                                                        </select>
                                                    </div> 
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="row">
                                                    <%
                                                        sessions = new AnnotationConfiguration().configure().buildSessionFactory();
                                                        s = sessions.openSession();

                                                        //Listagem de socios
                                                        strQuery = "from Classe";

                                                        s.beginTransaction();
                                                        qr = s.createQuery(strQuery);

                                                        List classes = qr.list();
                                                        s.close();

                                                    %>
                                                    <label for="" class="col-sm-12">Classe </label>
                                                    <div class="col-sm-12" style="padding :0">
                                                        <select name="classe" class="form-control">
                                                            <%                                                   
                                                                i = classes.iterator();
                                                                while (i.hasNext()) {

                                                                    Classe cla = (Classe) i.next();
                                                            %>  
                                                            <option value="<%out.println(cla.getIdClasse());%>"><%out.println(cla.getNome());%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>  
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="nav col-sm-12 "> 
                                <div class="nav row">
                                    <%
                                        sessions = new AnnotationConfiguration().configure().buildSessionFactory();
                                        s = sessions.openSession();

                                        //Listagem de socios
                                        strQuery = "from Diretor";

                                        s.beginTransaction();
                                        qr = s.createQuery(strQuery);

                                        List diretores = qr.list();
                                        s.close();

                                    %>
                                    <label for="Nome" class="col-sm-12">Diretor</label>
                                    <div class="input-group input-group-sm col-sm-5">
                                        <select name="diretor" class="form-control">
                                            <%                                                
                                                i = diretores.iterator();
                                                while (i.hasNext()) {

                                                    Diretor dir = (Diretor) i.next();
                                            %>  
                                            <option value="<%out.println(dir.getIdDiretor());%>"><%out.println(dir.getNome());%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="nav col-sm-12 "> 
                                <div class="nav row">
                                    <label for="sinopse" class="col-sm-12">Sinopse</label>
                                    <div class="input-group input-group-sm col-sm-5">
                                        <textarea rows="4" cols="50" class="form-control" placeholder="Sinopse" name="sinopse">
                                        </textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="nav col-sm-12 "> 
                                <div class="nav row">
                                    <div class="col-sm-5" style="padding :0">
                                        <h4>Atores Participantes</h4> 
                                        <%
                                            sessions = new AnnotationConfiguration().configure().buildSessionFactory();
                                            s = sessions.openSession();

                                            //Listagem de socios
                                            strQuery = "from Ator";

                                            s.beginTransaction();
                                            qr = s.createQuery(strQuery);

                                            List atores = qr.list();
                                            s.close();

                                        %>
                                    </div>
                                </div>
                            </div>

                            <div class="nav col-sm-12 "> 
                                <div class="nav row">
                                    <div class="col-sm-5">
                                                <input id="search" class="center-block form-control" placeholder="Search.." autocomplete= "off" />
                                                <div id="suggestions" class="text-center center-block" style="display:none;">
                                                    <div id="suggestion-results"></div>
                                                </div>
                                        </div>
                                </div>
                            </div>

                            <div class="nav col-sm-12 "> 
                                <div class="nav row">
                                    
                                    <div class="col-sm-5 testeVermelho" style="padding :0">
                                        <div class="input-group">   
                                        </div> 
                                        <table class="table table-striped table-hover table-users">
                                            <thead>
                                                <tr>
                                                    <th>Cod</th>
                                                    <th>Nome</th>
                                                    <th>Selecionar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%                                                    
                                                    i = atores.iterator();
                                                    while (i.hasNext()) {

                                                        Ator at = (Ator) i.next();
                                                        out.println(
                                                        "<tr>"
                                                                + "<td>" + at.getIdAtor() + "</td>"
                                                                + "<td>" + at.getNome() + "</td>"
                                                                + "<td>" 
                                                                + "<INPUT TYPE=\"checkbox\" NAME=\"selecionado"+ at.getIdAtor()+ "\" VALUE=\"" + at.getIdAtor() +"\">" 
                                                                + "</td>"
                                                      + "</tr>");
                                                    }
                                                %>
                                            </tbody>
                                        </table>  
                                    </div>
                                </div>
                            </div>
                            <!-- Codigo referente ao campo pesquisa -->
                            <span id="no-rows" class="center-block text-center" style="display:none;">No results.</span>

                            <div class="col-sm-12" align="rigth">
                                <div class="col-sm-6 formBTN2 " align="right"> 
                                    <button class="btn"> Cancelar </button>
                                    <button type ="submit" class="btn"> Salvar </button>
                                </div> 
                            </div>
                        </form>
                    </div>
                    <div class="divider divider-single"></div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jsProject.js"></script>  
    </body>
</html>
<%@ include file="sessao2.jsp"%>