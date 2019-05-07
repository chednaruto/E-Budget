package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectOutput {
    private String project_output_id;
    private String project_id;
    private String project_output_name;

    public boolean InsertProjectOutput(ProjectOutput po){
       boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_output(project_output_id,project_id,project_output_name) "
                    + "VALUES('" + po.getProject_output_id()+ "',"
                    + "'" + po.getProject_id()+ "',"
                    + "'" + po.getProject_output_name()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret; 
    }
    
    public boolean UpdateProjectOutput(ProjectOutput po){
       boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_output(project_output_id,project_id,project_output_name) "
                    + "VALUES('" + po.getProject_output_id()+ "',"
                    + "'" + po.getProject_id()+ "',"
                    + "'" + po.getProject_output_name()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret; 
    }
    
    public boolean DeleteProjectOutput(ProjectOutput po){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM project_output WHERE "
                    + "project_output_id ='"+po.getProject_output_id()+"'"
                    + "AND project_id ='"+po.getProject_id()+"'";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public String getProject_output_id() {
        return project_output_id;
    }

    public void setProject_output_id(String project_output_id) {
        this.project_output_id = project_output_id;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getProject_output_name() {
        return project_output_name;
    }

    public void setProject_output_name(String project_output_name) {
        this.project_output_name = project_output_name;
    }

}
