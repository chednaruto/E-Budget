package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectObjective {
    private String project_objective_id;
    private String project_objective_name;
    private String project_id;

    public boolean InsertProjectObjective(ProjectObjective po){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_objective(project_objective_id,project_objective_name,project_id) "
                    + "VALUES('" + po.getProject_objective_id()+ "',"
                    + "'" + po.getProject_objective_name() + "',"
                    + "'" + po.getProject_id()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public boolean UpdateProjectObjective(ProjectObjective po){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_objective(project_objective_id,project_objective_name,project_id) "
                    + "VALUES('" + po.getProject_objective_id()+ "',"
                    + "'" + po.getProject_objective_name() + "',"
                    + "'" + po.getProject_id()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public boolean DeleteProjectObjective(ProjectObjective po){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM project_objective WHERE "
                    + "project_objective_id ='"+po.getProject_objective_id()+"'"
                    + "AND project_id ='"+po.getProject_id()+"'";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public String getProject_objective_id() {
        return project_objective_id;
    }

    public void setProject_objective_id(String project_objective_id) {
        this.project_objective_id = project_objective_id;
    }

    public String getProject_objective_name() {
        return project_objective_name;
    }

    public void setProject_objective_name(String project_objective_name) {
        this.project_objective_name = project_objective_name;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

}
