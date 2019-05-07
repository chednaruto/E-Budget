package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectObjective {

    private String project_id;
    private int project_objective_id;
    private String project_objective_name;

    public boolean InsertProjectObjective(ProjectObjective po) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_objective(project_objective_id,project_objective_name,project_id) VALUES(" + po.getProject_objective_id() + ",'" + po.getProject_objective_name() + "','" + po.getProject_id() + "')";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectObjective(ProjectObjective po) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_objective WHERE project_id='" + po.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateProjectObjective(ProjectObjective po) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.project_objective "
                    + "SET project_objective_name = '" + po.getProject_objective_name() + "' "
                    + "WHERE project_objective_id = " + po.getProject_objective_id() + " AND project_id='" + po.getProject_id() + "'";
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

    public int getProject_objective_id() {
        return project_objective_id;
    }

    public void setProject_objective_id(int project_objective_id) {
        this.project_objective_id = project_objective_id;
    }

    public String getProject_objective_name() {
        return project_objective_name;
    }

    public void setProject_objective_name(String project_objective_name) {
        this.project_objective_name = project_objective_name;
    }
}
