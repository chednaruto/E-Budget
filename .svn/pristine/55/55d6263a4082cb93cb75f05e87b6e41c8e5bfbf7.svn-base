package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

public class ProjectBenefit {
    private String project_benefit_id;
    private String project_benefit_name;
    private String project_id;

    public boolean InsertProjectBenefit(ProjectBenefit pb){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project_benefit(project_benefit_id,project_benefit_name,project_id) "
                    + "VALUES('" + pb.getProject_benefit_id()+ "',"
                    + "'" + pb.getProject_benefit_name()+ "',"
                    + "'" + pb.getProject_id()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public boolean UpdateProjectBenefit(ProjectBenefit pb){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "REPLACE INTO project_benefit(project_benefit_id,project_benefit_name,project_id) "
                    + "VALUES('" + pb.getProject_benefit_id()+ "',"
                    + "'" + pb.getProject_benefit_name()+ "',"
                    + "'" + pb.getProject_id()+ "'"
                    + ")";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public boolean DeleteProjectBenefit(ProjectBenefit pb){
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM project_benefit WHERE "
                    + "project_benefit_id ='"+pb.getProject_benefit_id()+"'"
                    + "AND project_id ='"+pb.getProject_id()+"'";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }
            
    public String getProject_benefit_id() {
        return project_benefit_id;
    }

    public void setProject_benefit_id(String project_benefit_id) {
        this.project_benefit_id = project_benefit_id;
    }

    public String getProject_benefit_name() {
        return project_benefit_name;
    }

    public void setProject_benefit_name(String project_benefit_name) {
        this.project_benefit_name = project_benefit_name;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

}
