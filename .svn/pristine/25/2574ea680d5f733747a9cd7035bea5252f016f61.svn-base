package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class ProjectKPI {

    private int project_kpi_id;
    private String project_kpi_name;
    private String project_id;
    private String project_kpi_goal_value;
    private String project_kpi_point_one;
    private String project_kpi_point_two;
    private String project_kpi_point_three;
    private String project_kpi_point_four;
    private String project_kpi_point_five;
    private String project_kpi_result_value;
    private String project_kpi_past_performance;

    public boolean InsertProjectKPI(ProjectKPI pk) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.project_kpi(project_id,project_kpi_name,project_kpi_goal_value,project_kpi_point_one,project_kpi_point_two,project_kpi_point_three,project_kpi_point_four,project_kpi_point_five,project_kpi_result_value,project_kpi_past_performance) "
                    + "VALUES('" + pk.getProject_id() + "','" + pk.getProject_kpi_name() + "','" + pk.getProject_kpi_goal_value() + "','" + pk.getProject_kpi_point_one() + "','" + pk.getProject_kpi_point_two() + "','" + pk.getProject_kpi_point_three() + "','" + pk.getProject_kpi_point_four() + "','" + pk.getProject_kpi_point_five() + "','" + pk.getProject_kpi_result_value() + "','" + pk.getProject_kpi_past_performance() + "')";
            System.out.println(query);
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateProjectKPI(ProjectKPI pk) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.project_kpi "
                    + "SET project_kpi_name='"+pk.getProject_kpi_name()+"',"
                    + "project_kpi_goal_value='"+pk.getProject_kpi_goal_value()+"',"
                    + "project_kpi_point_one='"+pk.getProject_kpi_point_one()+"',"
                    + "project_kpi_point_two='"+pk.getProject_kpi_point_two()+"',"
                    + "project_kpi_point_three='"+pk.getProject_kpi_point_three()+"',"
                    + "project_kpi_point_four='"+pk.getProject_kpi_point_four()+"',"
                    + "project_kpi_point_five='"+pk.getProject_kpi_point_five()+"',"
                    + "project_kpi_past_performance='"+pk.getProject_kpi_past_performance()+"' "
                    + "WHERE project_kpi_id=" + pk.getProject_kpi_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteProjectKPI(ProjectKPI pk) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.project_kpi WHERE project_kpi_id=" + pk.getProject_kpi_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public int getProject_kpi_id() {
        return project_kpi_id;
    }

    public void setProject_kpi_id(int project_kpi_id) {
        this.project_kpi_id = project_kpi_id;
    }

    public String getProject_kpi_name() {
        return project_kpi_name;
    }

    public void setProject_kpi_name(String project_kpi_name) {
        this.project_kpi_name = project_kpi_name;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getProject_kpi_goal_value() {
        return project_kpi_goal_value;
    }

    public void setProject_kpi_goal_value(String project_kpi_goal_value) {
        this.project_kpi_goal_value = project_kpi_goal_value;
    }

    public String getProject_kpi_point_one() {
        return project_kpi_point_one;
    }

    public void setProject_kpi_point_one(String project_kpi_point_one) {
        this.project_kpi_point_one = project_kpi_point_one;
    }

    public String getProject_kpi_point_two() {
        return project_kpi_point_two;
    }

    public void setProject_kpi_point_two(String project_kpi_point_two) {
        this.project_kpi_point_two = project_kpi_point_two;
    }

    public String getProject_kpi_point_three() {
        return project_kpi_point_three;
    }

    public void setProject_kpi_point_three(String project_kpi_point_three) {
        this.project_kpi_point_three = project_kpi_point_three;
    }

    public String getProject_kpi_point_four() {
        return project_kpi_point_four;
    }

    public void setProject_kpi_point_four(String project_kpi_point_four) {
        this.project_kpi_point_four = project_kpi_point_four;
    }

    public String getProject_kpi_point_five() {
        return project_kpi_point_five;
    }

    public void setProject_kpi_point_five(String project_kpi_point_five) {
        this.project_kpi_point_five = project_kpi_point_five;
    }

    public String getProject_kpi_result_value() {
        return project_kpi_result_value;
    }

    public void setProject_kpi_result_value(String project_kpi_result_value) {
        this.project_kpi_result_value = project_kpi_result_value;
    }

    public String getProject_kpi_past_performance() {
        return project_kpi_past_performance;
    }

    public void setProject_kpi_past_performance(String project_kpi_past_performance) {
        this.project_kpi_past_performance = project_kpi_past_performance;
    }
}
