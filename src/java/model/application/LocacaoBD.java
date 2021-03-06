/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.application;

import java.io.PrintWriter;
import java.util.List;
import model.domain.Cliente;
import model.domain.Item;
import model.domain.Locacao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author Ruan
 */
public class LocacaoBD {

    public static int cadastrarLocacao(String dtLocacao, String dtDevolucaoPrevista, String valor, Cliente cliente, Item item, boolean statusPagamento) {
        if (cliente.getNome().equals("")) {
            return -1;
        }
        Locacao l = new Locacao(dtLocacao, dtDevolucaoPrevista, Float.parseFloat(valor), cliente, item, statusPagamento);

        try {
            SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
            Session session = sessions.openSession();
            session.beginTransaction();
            session.save(l);
            session.getTransaction().commit();
            session.close();
        } catch (Exception x) {
            return -1;
        }
        return 0;
    }
    
    public static Locacao consultaId(String id){

            SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
            Session session = sessions.openSession();

            String strQuery = "from Locacao where idLocacao = " + id;
            session.beginTransaction();
            Query qr = session.createQuery(strQuery);
            List classes = qr.list();
            session.close();

            return (Locacao) classes.get(0);
    }

    public static int Editar(Locacao l){
        try{
            SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
            Session s = sessions.openSession();
            Transaction tx = s.beginTransaction();
            s.update(l);
            tx.commit();
            s.close();
        } catch (Exception x) {
            return -1;
        }
        return 0;
    }
    
    public static int Excluir(Locacao l){
        try{
            SessionFactory sessions = new AnnotationConfiguration().configure().buildSessionFactory();
            Session s = sessions.openSession();
            Transaction tx = s.beginTransaction();
            s.delete(l);
            tx.commit();
            s.close();
        } catch (Exception x) {
            return -1;
        }
        return 0;
    }
}
