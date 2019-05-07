package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectRDGoal {

    private String project_id;
    private int rd_goal_id;

    public boolean InsertProjectRDGoal(ProjectRDGoal prg) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_rd_goal(project_id,rd_goal_id) VALUES('" + prg.getProject_id() + "'," + prg.getRd_goal_id() + ")";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectRDGoal(ProjectRDGoal prg) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_rd_goal WHERE project_id='" + prg.getProject_id() + "'";
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

    public int getRd_goal_id() {
        return rd_goal_id;
    }

    public void setRd_goal_id(int rd_goal_id) {
        this.rd_goal_id = rd_goal_id;
    }

}
