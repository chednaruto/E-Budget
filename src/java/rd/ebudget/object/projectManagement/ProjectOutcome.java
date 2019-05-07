package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectOutcome {
    private String project_outcome_id;
    private String project_outcome_name;
    private String project_id;

    public boolean InsertProjectOutcome(ProjectOutcome po){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_outcome(project_outcome_id,project_outcome_name,project_id) "
                    + "VALUES('" + po.getProject_outcome_id()+ "',"
                    + "'" + po.getProject_outcome_name()+ "',"
                    + "'" + po.getProject_id()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public boolean UpdateProjectOutcome(ProjectOutcome po){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_outcome(project_outcome_id,project_outcome_name,project_id) "
                    + "VALUES('" + po.getProject_outcome_id()+ "',"
                    + "'" + po.getProject_outcome_name()+ "',"
                    + "'" + po.getProject_id()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public boolean DeleteProjectOutcome(ProjectOutcome po){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM project_outcome WHERE "
                    + "project_outcome_id ='"+po.getProject_outcome_id()+"'"
                    + "AND project_id ='"+po.getProject_id()+"'";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public String getProject_outcome_id() {
        return project_outcome_id;
    }

    public void setProject_outcome_id(String project_outcome_id) {
        this.project_outcome_id = project_outcome_id;
    }

    public String getProject_outcome_name() {
        return project_outcome_name;
    }

    public void setProject_outcome_name(String project_outcome_name) {
        this.project_outcome_name = project_outcome_name;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

}
