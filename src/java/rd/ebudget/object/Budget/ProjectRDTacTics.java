package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectRDTacTics {

    private String project_id;
    private int rd_tactics_id;

    public boolean InsertProjectRDTacTics(ProjectRDTacTics prt) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_rd_tactics(project_id,rd_tactics_id) VAlUES('" + prt.getProject_id() + "'," + prt.getRd_tactics_id() + ")";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectRDTacTics(ProjectRDTacTics prt) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_rd_tactics WHERE project_id = '" + prt.getProject_id() + "'";
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

    public int getRd_tactics_id() {
        return rd_tactics_id;
    }

    public void setRd_tactics_id(int rd_tactics_id) {
        this.rd_tactics_id = rd_tactics_id;
    }
}
