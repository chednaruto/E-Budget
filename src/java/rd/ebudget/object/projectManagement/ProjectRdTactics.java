package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectRdTactics {

    private String project_id;
    private String rd_tactics_id;

    public boolean InsertProjectRdTactics(ProjectRdTactics prt) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_rd_goal(project_id,rd_tactics_id) "
                    + "VALUES('" + prt.getProject_id() + "','" + prt.getRd_tactics_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean UpdateProjectRdTactics(ProjectRdTactics prt) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_rd_goal(project_id,rd_tactics_id) "
                    + "VALUES('" + prt.getProject_id() + "','" + prt.getRd_tactics_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean DeleteProjectRdTactics(ProjectRdTactics prt) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELTE FROM project_rd_goal WHERER project_id = '" + prt.getProject_id() + "' "
                    + "AND rd_tactics_id = '" + prt.getRd_tactics_id() + "'";
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

    public String getRd_tactics_id() {
        return rd_tactics_id;
    }

    public void setRd_tactics_id(String rd_tactics_id) {
        this.rd_tactics_id = rd_tactics_id;
    }

}
