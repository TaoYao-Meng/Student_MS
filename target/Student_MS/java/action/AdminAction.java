package action;

import PO.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.HbUtils;
import freemarker.ext.servlet.HttpSessionHashModel;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import java.util.List;
import java.util.Map;


public class AdminAction extends ActionSupport implements SessionAware {
    private Admin admin;
    private String admin_name;
    private String admin_password;
    private Map<String,Object>session;
    private Session hbnSession;
    private List<Admin> list;

    @Override
    public void setSession(Map<String, Object> session) {
        this.session=session;
    }

    public Session getHbnSession() {
        return hbnSession;
    }

    public void setHbnSession(Session hbnSession) {
        this.hbnSession = hbnSession;
    }
    public String excute() throws Exception{
        String hql="from Admin where admin_name=?0 and admin_password=?1";
        System.out.println(hql);
        //hql查询验证信息
        hbnSession= HbUtils.getSession();
        admin_name=admin.getAdmin_name();
        admin_password=admin.getAdmin_password();
        System.out.println(this.admin_name);
        hbnSession.beginTransaction();
        Admin admin= (Admin) hbnSession.createQuery(hql)
                .setParameter(0,this.getAdmin_name())
                .setParameter(1,this.getAdmin_password())
                .uniqueResult();
        System.out.println(admin);
        hbnSession.getTransaction().commit();
        if(admin==null){
            System.out.println("admin is null");
            return  "login";
        }else {
            session.put("adminUsername",admin.getAdmin_name());
            session.put("adminroleid",admin.getAdmin_roleid());
            System.out.println("adminUsername is "+admin.getAdmin_name());
            return "success";
        }


    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
