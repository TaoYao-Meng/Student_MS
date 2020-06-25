package action;

import PO.Student;
import com.opensymphony.xwork2.ActionSupport;
import dao.HbUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import java.util.List;
import java.util.Map;

public class StudentAction extends ActionSupport implements SessionAware {
    private List<Student> stuList;
    private Student stu;
    private Student stu2;
    private Map<String,Object>session;

    private Student student;
    private Session hbnSession;
    private String name;
    private String password;

    public Session getHbnSession() {
        return hbnSession;
    }

    public void setHbnSession(Session hbnSession) {
        this.hbnSession = hbnSession;
    }


    public String findAll(){
        String hql="from Student";
        System.out.println(hql);
        Session hbnSession= HbUtils.getSession();
        hbnSession.beginTransaction();
        stuList=hbnSession.createQuery(hql).list();
        session.put("stuList",this.stuList);
        System.out.println(session);
        System.out.println(stuList);
        hbnSession.getTransaction().commit();
        if(stuList!=null){
            return "success";
        }else {
            return "error";
        }
    }

    //学生登陆
    public String studentLogin() throws Exception{
        String hql="from Student where name=?0 and password=?1";
        System.out.println(hql);
        //hql查询验证信息
        hbnSession= HbUtils.getSession();
        name=student.getName();
        password=student.getPassword();
        System.out.println(this.name);
        hbnSession.beginTransaction();
        Student student= (Student) hbnSession.createQuery(hql)
                .setParameter(0,this.getName())
                .setParameter(1,this.getPassword())
                .uniqueResult();
        System.out.println(student);
        hbnSession.getTransaction().commit();
        if(student==null){
            System.out.println("student is null");
            return  "login";
        }else {
            session.put("studentname",student.getName());
            session.put("student",student);
            System.out.println("studentname is "+student.getName());
            return "success";
        }

    }

    //修改学生信息
    public String update(){
        try{
            Session hbnsession=HbUtils.getSession();
            hbnsession.beginTransaction();
            System.out.println(stu);
            hbnsession.update(stu);
            hbnsession.getTransaction().commit();
            hbnsession.close();
            return "success";
        }catch (Exception e){
            e.printStackTrace();
            return "error";
        }
    }
    //删除
    public String delete(){
        Session hbnsession=HbUtils.getSession();
        //getSession需要在内部处理
        try {
            hbnsession.beginTransaction();
            Student student=new Student();
            student.setStudentID(stu.getStudentID());
            hbnsession.delete(student);
            hbnsession.getTransaction().commit();
            hbnsession.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    public String insert(){
        Session session= HbUtils.getSession();
        try {
            session.beginTransaction();
            session.save(stu);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            //回滚
            session.getTransaction().rollback();
        }
        return "success";
    }
    //模糊查询
    public String findByName(){
        String hql="from Student where name like "+"'%"+stu2.getName()+"%'";
        System.out.println(hql);
        Session hbnSession= HbUtils.getSession();
        hbnSession.beginTransaction();
        stuList=hbnSession.createQuery(hql).list();
        session.put("stuList",this.stuList);
        System.out.println(session);
        System.out.println(stuList);
        hbnSession.getTransaction().commit();
        if(stuList!=null){
            return "success";
        }else {
            return "error";
        }
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session=session;
    }

    public List<Student> getStuList() {
        return stuList;
    }


    public void setStuList(List<Student> stuList) {
        this.stuList = stuList;
    }

    public Student getStu() {
        return stu;
    }

    public void setStu(Student stu) {
        this.stu = stu;
    }

    public Student getStu2() {
        return stu2;
    }

    public void setStu2(Student stu2) {
        this.stu2 = stu2;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
