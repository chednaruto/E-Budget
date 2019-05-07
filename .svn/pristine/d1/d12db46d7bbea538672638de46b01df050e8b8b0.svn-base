package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectOwner {

    private String project_id;
    private String uid;
    private String fullname;
    private String position_m;
    private String email;

    public boolean InsertProjectOwner(ProjectOwner po) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_owner(project_id,uid,fullname,position_m,email) "
                    + "VALUES('" + po.getProject_id() + "',"
                    + "'" + po.getUid() + "',"
                    + "'" + po.getFullname() + "',"
                    + "'" + po.getPosition_m() + "',"
                    + "'" + po.getEmail() + "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPosition_m() {
        return position_m;
    }

    public void setPosition_m(String position_m) {
        this.position_m = position_m;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
