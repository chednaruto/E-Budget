package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectRdStrategic {

    private String project_id;
    private String rd_strategic_id;

    //project_rd_strategic'
    public boolean InsertProjectRdStrategic(ProjectRdStrategic prs) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_rd_strategic(project_id,rd_strategic_id) "
                    + "VALUES('" + prs.getProject_id() + "','" + prs.getRd_strategic_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean UpdateProjectRdStrategic(ProjectRdStrategic prs) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_rd_strategic(project_id,rd_strategic_id) "
                    + "VALUES('" + prs.getProject_id() + "','" + prs.getRd_strategic_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean DeleteProjectRdStrategic(ProjectRdStrategic prs) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM project_rd_strategic WHERE project_id='" + prs.getProject_id() + "' "
                    + "AND rd_strategic_id='" + prs.getRd_strategic_id() + "'";
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

    public String getRd_strategic_id() {
        return rd_strategic_id;
    }

    public void setRd_strategic_id(String rd_strategic_id) {
        this.rd_strategic_id = rd_strategic_id;
    }

}
