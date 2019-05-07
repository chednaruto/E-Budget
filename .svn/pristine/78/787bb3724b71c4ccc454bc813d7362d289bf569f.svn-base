package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectRdGoal {
    private String project_id;
    private String rd_goal_id;

    public boolean InsertProjectRdGoal(ProjectRdGoal prg){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_rd_goal(project_id,rd_goal_id) "
                    + "VALUES('" + prg.getProject_id() + "','" + prg.getRd_goal_id() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public boolean UpdateProjectRdGoal(ProjectRdGoal prg){
        boolean ret = false;
        try{
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_rd_goal(project_id,rd_goal_id) "+
            "VALUES('"+prg.getProject_id()+"','"+prg.getRd_goal_id()+"')";
            ret = mm.Excute(query);
        }catch(Exception ex){
        }
        return ret;
    }
    
    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getRd_goal_id() {
        return rd_goal_id;
    }

    public void setRd_goal_id(String rd_goal_id) {
        this.rd_goal_id = rd_goal_id;
    }

}
