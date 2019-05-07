package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectGovernmentPolicy {

    private String project_id;
    private String government_policy_id;

    public boolean InsertProjectGovernmentPolicy(ProjectGovernmentPolicy pgp) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_government_policy(project_id,government_policy_id) "
                    + "VALUES('" + pgp.getProject_id() + "','" + pgp.getGovernment_policy_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean UpdateProjectGovernmentPolicy(ProjectGovernmentPolicy pgp) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_government_policy(project_id,government_policy_id) "
                    + "VALUES('" + pgp.getProject_id() + "','" + pgp.getGovernment_policy_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean DeleteProjectGovernmentPolicy(ProjectGovernmentPolicy pgp) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM project_government_policy WHERER project_id='" + pgp.getProject_id() + "' "
                    + "AND government_policy_id='" + pgp.getGovernment_policy_id() + "'";
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

    public String getGovernment_policy_id() {
        return government_policy_id;
    }

    public void setGovernment_policy_id(String government_policy_id) {
        this.government_policy_id = government_policy_id;
    }

}
