package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectOutCome {

    private String project_id;
    private int project_outcome_id;
    private String project_outcome_name;

    public boolean InsertProjectOutCome(ProjectOutCome poc) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_outcome(project_outcome_id,project_outcome_name,project_id) "
                    + "VALUES(" + poc.getProject_outcome_id() + ",'" + poc.getProject_outcome_name() + "','" + poc.getProject_id() + "')";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectOutCome(ProjectOutCome poc) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_outcome WHERE project_id = '" + poc.getProject_id() + "'";
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

    public int getProject_outcome_id() {
        return project_outcome_id;
    }

    public void setProject_outcome_id(int project_outcome_id) {
        this.project_outcome_id = project_outcome_id;
    }

    public String getProject_outcome_name() {
        return project_outcome_name;
    }

    public void setProject_outcome_name(String project_outcome_name) {
        this.project_outcome_name = project_outcome_name;
    }
}
