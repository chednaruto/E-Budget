package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectMOFStrategic {

    private String project_id;
    private int mof_strategic_id;

    public boolean InsertProjectMOFStrategic(ProjectMOFStrategic pms) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_mof_strategic(project_id,mof_strategic_id) VALUES('" + pms.getProject_id() + "'," + pms.getMof_strategic_id() + ")";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectMOFStrategic(ProjectMOFStrategic pms) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_mof_strategic where project_id='" + pms.getProject_id() + "'";
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

    public int getMof_strategic_id() {
        return mof_strategic_id;
    }

    public void setMof_strategic_id(int mof_strategic_id) {
        this.mof_strategic_id = mof_strategic_id;
    }

}
