<%
	// se n�o existir um login na sessao, 
	// vai enviar para a p�gina de login novamente
	} else {
%>
    <jsp:forward page="index.jsp?erro=-2"></jsp:forward>
<%
}
%>