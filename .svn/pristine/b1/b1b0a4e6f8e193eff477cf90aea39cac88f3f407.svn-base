package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectGovernmentPolicy {

    private String project_id;
    private int government_id;

    public boolean InsertProjectGovernmentPolicy(ProjectGovernmentPolicy pgp) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_government_policy(project_id,government_policy_id) VALUES('" + pgp.getProject_id() + "'," + pgp.getGovernment_id() + ")";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectGovernmentPolicy(ProjectGovernmentPolicy pgp) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_government_policy WHERE project_id='" + pgp.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public int getGovernment_id() {
        return government_id;
    }

    public void setGovernment_id(int government_id) {
        this.government_id = government_id;
    }
}
