package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HbUtils {
    private static SessionFactory sessionFactory;
    public static Session getSession(){
//        SessionFactory sf = getSessionFactory();
//        Session session=sf.getCurrentSession();//是单例模式
        return getSessionFactory().getCurrentSession();
        //return  session;
    }

    public static SessionFactory getSessionFactory() {
        if(sessionFactory==null||sessionFactory.isClosed()){
            sessionFactory=new Configuration().configure().buildSessionFactory();
        }

        return sessionFactory;
    }

}