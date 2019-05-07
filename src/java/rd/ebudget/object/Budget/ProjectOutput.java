package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectOutput {

    private int project_output_id;
    private String project_output_name;
    private String project_id;

    public boolean InsertProjectOutput(ProjectOutput po) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_output(project_output_id,project_output_name,project_id) "
                    + "VALUES(" + po.getProject_output_id() + ",'" + po.getProject_output_name() + "','" + po.getProject_id() + "')";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectOutput(ProjectOutput po) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_output WHERE project_id='" + po.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public int getProject_output_id() {
        return project_output_id;
    }

    public void setProject_output_id(int project_output_id) {
        this.project_output_id = project_output_id;
    }

    public String getProject_output_name() {
        return project_output_name;
    }

    public void setProject_output_name(String project_output_name) {
        this.project_output_name = project_output_name;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }
}
