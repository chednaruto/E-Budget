package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectMofStrategic {

    private String project_id;
    private String mof_strategic_id;

    public boolean InsertProjectMofStrategic(ProjectMofStrategic pms) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_mof_strategic(project_id,mof_strategic_id) "
                    + "VALUES('" + pms.getProject_id() + "','" + pms.getMof_strategic_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean UpdateProjectMofStrategic(ProjectMofStrategic pms) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_mof_strategic(project_id,mof_strategic_id) "
                    + "VALUES('" + pms.getProject_id() + "','" + pms.getMof_strategic_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean DeleteProjectMofStrategic(ProjectMofStrategic pms) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM project_mof_strategic WHERE project_id='" + pms.getProject_id() + "' "
                    + "AND mof_strategic_id='" + pms.getMof_strategic_id() + "'";
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

    public String getMof_strategic_id() {
        return mof_strategic_id;
    }

    public void setMof_strategic_id(String mof_strategic_id) {
        this.mof_strategic_id = mof_strategic_id;
    }

}
