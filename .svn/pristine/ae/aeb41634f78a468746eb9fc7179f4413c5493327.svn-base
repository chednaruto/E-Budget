package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectRisk {

    private String project_id;
    private int project_risk_id;
    private String project_risk_name;

    public boolean InsertProjectRisk(ProjectRisk pr) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_risk(project_id,project_risk_name) "
                    + "VALUES('" + pr.getProject_id() + "','" + pr.getProject_risk_name() + "')";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateProjectRisk(ProjectRisk pr) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.project_risk "
                    + "SET project_risk_name = '" + pr.getProject_risk_name() + "' "
                    + "WHERE project_risk_id=" + pr.getProject_risk_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectRisk(ProjectRisk pr) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_risk WHERE project_risk_id=" + pr.getProject_risk_id();
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

    public int getProject_risk_id() {
        return project_risk_id;
    }

    public void setProject_risk_id(int project_risk_id) {
        this.project_risk_id = project_risk_id;
    }

    public String getProject_risk_name() {
        return project_risk_name;
    }

    public void setProject_risk_name(String project_risk_name) {
        this.project_risk_name = project_risk_name;
    }

}
