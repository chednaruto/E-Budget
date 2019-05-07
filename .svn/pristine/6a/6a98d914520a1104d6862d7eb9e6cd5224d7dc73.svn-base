package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class User {

    private String id;
    private String title;
    private String fname;
    private String lname;
    private String email;
    private String posname;
    private int empstatus;
    private String class_data;
    private String skillid;
    private int emptype;
    private String officeid;
    private String officename;
    private String pin;
    private String position_m;
    private String class_new;
    private String level;
    private String posact;
    private String groupname;
    private String isadmin;
    private String register_date;

    public boolean InsertUser(User u) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.user(id,title,fname,lname,email,"
                    + "posname,empstatus,class_data,skillid,emptype,"
                    + "officeid,officename,pin,position_m,class_new,"
                    + "level,posact,groupname,isadmin,register_date) "
                    + "VALUES('" + u.getId() + "','" + u.getTitle() + "','" + u.getFname() + "','" + u.getLname() + "','" + u.getEmail() + "',"
                    + "'" + u.getPosname() + "'," + u.getEmpstatus() + ",'" + u.getClass_data() + "','" + u.getSkillid() + "'," + u.getEmptype() + ","
                    + "'" + u.getOfficeid() + "','" + u.getOfficename() + "','" + u.getPin() + "','" + u.getPosition_m() + "','" + u.getClass_new() + "',"
                    + "'" + u.getLevel() + "','" + u.getPosact() + "','" + u.getGroupname() + "','" + u.getIsadmin() + "',CURRENT TIMESTAMP)";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateUser(User u) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.user "
                    + "SET title='" + u.getTitle() + "',fname='" + u.getFname() + "',lname='" + u.getLname() + "',email='" + u.getEmail() + "',"
                    + "posname='" + u.getPosname() + "',empstatus=" + u.getEmpstatus() + ",class_data='" + u.getClass_data() + "',skillid='" + u.getSkillid() + "',emptype=" + u.getEmptype() + ","
                    + "officeid='" + u.getOfficeid() + "',officename='" + u.getOfficename() + "',pin='" + u.getPin() + "',position_m='" + u.getPosition_m() + "',class_new='" + u.getClass_new() + "',"
                    + "level='" + u.getLevel() + "',posact='" + u.getPosact() + "',groupname='" + u.getGroupname() + "',isadmin='" + u.getIsadmin() + "' "
                    + "WHERE id='" + u.getId() + "'";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteUser(User u) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.user WHERE id = '" + u.getId() + "'";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean CheckUsage(User u) {
        boolean ret = false;
        try {
            String query = "SELECT count(*) AS cc FROM e_budget.user WHERE id='" + u.getId() + "'";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            rs.next();
            if (rs.getInt("cc") > 0) {
                ret = false;
            } else {
                ret = true;
            }
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     * @param lname the lname to set
     */
    public void setLname(String lname) {
        this.lname = lname;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the posname
     */
    public String getPosname() {
        return posname;
    }

    /**
     * @param posname the posname to set
     */
    public void setPosname(String posname) {
        this.posname = posname;
    }

    /**
     * @return the empstatus
     */
    public int getEmpstatus() {
        return empstatus;
    }

    /**
     * @param empstatus the empstatus to set
     */
    public void setEmpstatus(int empstatus) {
        this.empstatus = empstatus;
    }

    /**
     * @return the class_data
     */
    public String getClass_data() {
        return class_data;
    }

    /**
     * @param class_data the class_data to set
     */
    public void setClass_data(String class_data) {
        this.class_data = class_data;
    }

    /**
     * @return the skillid
     */
    public String getSkillid() {
        return skillid;
    }

    /**
     * @param skillid the skillid to set
     */
    public void setSkillid(String skillid) {
        this.skillid = skillid;
    }

    /**
     * @return the emptype
     */
    public int getEmptype() {
        return emptype;
    }

    /**
     * @param emptype the emptype to set
     */
    public void setEmptype(int emptype) {
        this.emptype = emptype;
    }

    /**
     * @return the officeid
     */
    public String getOfficeid() {
        return officeid;
    }

    /**
     * @param officeid the officeid to set
     */
    public void setOfficeid(String officeid) {
        this.officeid = officeid;
    }

    /**
     * @return the officename
     */
    public String getOfficename() {
        return officename;
    }

    /**
     * @param officename the officename to set
     */
    public void setOfficename(String officename) {
        this.officename = officename;
    }

    /**
     * @return the pin
     */
    public String getPin() {
        return pin;
    }

    /**
     * @param pin the pin to set
     */
    public void setPin(String pin) {
        this.pin = pin;
    }

    /**
     * @return the position_m
     */
    public String getPosition_m() {
        return position_m;
    }

    /**
     * @param position_m the position_m to set
     */
    public void setPosition_m(String position_m) {
        this.position_m = position_m;
    }

    /**
     * @return the class_new
     */
    public String getClass_new() {
        return class_new;
    }

    /**
     * @param class_new the class_new to set
     */
    public void setClass_new(String class_new) {
        this.class_new = class_new;
    }

    /**
     * @return the level
     */
    public String getLevel() {
        return level;
    }

    /**
     * @param level the level to set
     */
    public void setLevel(String level) {
        this.level = level;
    }

    /**
     * @return the posact
     */
    public String getPosact() {
        return posact;
    }

    /**
     * @param posact the posact to set
     */
    public void setPosact(String posact) {
        this.posact = posact;
    }

    /**
     * @return the groupname
     */
    public String getGroupname() {
        return groupname;
    }

    /**
     * @param groupname the groupname to set
     */
    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    /**
     * @return the isadmin
     */
    public String getIsadmin() {
        return isadmin;
    }

    /**
     * @param isadmin the isadmin to set
     */
    public void setIsadmin(String isadmin) {
        this.isadmin = isadmin;
    }

    /**
     * @return the register_date
     */
    public String getRegister_date() {
        return register_date;
    }

    /**
     * @param register_date the register_date to set
     */
    public void setRegister_date(String register_date) {
        this.register_date = register_date;
    }

}
