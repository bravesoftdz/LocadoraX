/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.application;

import java.io.PrintWriter;
import java.util.List;
import model.domain.Cliente;
import model.domain.Dependente;
import model.domain.Socio;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author Ruan
 */
public class ClienteBD {

    public static int cadastrarSocio(String end, String tel, String cpf, String nome, String dtNasc, char sexo) {

        if (nome.equals("") || cpf.equals("")) {
            return -1;
        }
        Socio s = new Socio(end, tel, cpf, nome, dtNasc, true, sexo);
        try {
            SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
            Session session = sessions.openSession();
            session.beginTransaction();
            session.save(s);
            session.getTransaction().commit();
            session.close();
        } catch (Exception x) {
            PrintWriter out = null;
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Erro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Erro " + x.getMessage() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }

        return 1;
    }

    public static List consultaClientes() {
        SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
        Session s = sessions.openSession();
        String strQuery = "from Cliente";
        s.beginTransaction();
        Query qr = s.createQuery(strQuery);
        List clientes = qr.list();
        s.close();
        return clientes;
    }

    public static int inscreverDependente(Socio socio, String nome, char sexo, String dtNasc) {

        if (nome.equals("")) {
            return -1;
        }

        Dependente d = new Dependente();
        d.setDataNascimento(dtNasc);
        d.setNome(nome);
        d.setSexo(sexo);
        d.setAtivo(true);

        try {
            SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
            Session session = sessions.openSession();

            session.beginTransaction();

            socio.inserirDependente(d);
            session.update(socio);
            session.getTransaction().commit();
            session.close();
        } catch (Exception x) {
            PrintWriter out = null;
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Erro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Erro " + x.getMessage() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }

        return 1;

    }

    public static Cliente consultaId(String id) {
        SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessions.openSession();

        String strQuery = "from Cliente where numInscricao = " + id;
        session.beginTransaction();
        Query qr = session.createQuery(strQuery);
        List clientes = qr.list();
        session.close();

        return (Cliente) clientes.get(0);
    }

}
