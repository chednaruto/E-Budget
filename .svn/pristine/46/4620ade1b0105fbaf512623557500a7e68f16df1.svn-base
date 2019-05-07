package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectActivity {

    private String project_id;
    private int project_activity_id;
    private String project_activity_name;
    private double project_activity_budget;

    public boolean InsertProjectActivity(ProjectActivity pa) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_activity(project_id,project_activity_name,project_activity_budget) "
                    + "VALUES('" + pa.getProject_id() + "','" + pa.getProject_activity_name() + "'," + pa.getProject_activity_budget() + ")";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateProjectActivity(ProjectActivity pa) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.project_activity "
                    + "SET project_id='" + pa.getProject_id() + "',"
                    + "project_activity_name='" + pa.getProject_activity_name() + "',"
                    + "project_activity_budget=" + pa.getProject_activity_budget() + " "
                    + "WHERE project_activity_id=" + pa.getProject_activity_id();
            System.out.println(query);
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectActivity(ProjectActivity pa) {
        boolean ret = false;
        try {
            String query = "DELETE FROM  e_budget.project_activity WHERE project_activity_id=" + pa.getProject_activity_id();
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

    public int getProject_activity_id() {
        return project_activity_id;
    }

    public void setProject_activity_id(int project_activity_id) {
        this.project_activity_id = project_activity_id;
    }

    public String getProject_activity_name() {
        return project_activity_name;
    }

    public void setProject_activity_name(String project_activity_name) {
        this.project_activity_name = project_activity_name;
    }

    public double getProject_activity_budget() {
        return project_activity_budget;
    }

    public void setProject_activity_budget(double project_activity_budget) {
        this.project_activity_budget = project_activity_budget;
    }
}
