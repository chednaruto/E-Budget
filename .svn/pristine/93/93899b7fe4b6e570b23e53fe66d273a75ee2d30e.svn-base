package rd.ebudget.object.lookup.Gov;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class RdGoal {

    private String rd_goal_id;
    private String rd_goal_name;
    private String rd_goal_status;
    private String rd_strategic_id;

    public boolean InsertRdGoal(RdGoal rg) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "INSERT INTO e_budget.rd_goal(rd_goal_name,rd_goal_status,rd_strategic_id) "
                    + "VALUES('" + rg.getRd_goal_name() + "','" + rg.getRd_goal_status() + "'," + rg.getRd_strategic_id() + ")";
            System.out.println(query);
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean UpdateRdGoal(RdGoal rg) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "UPDATE e_budget.rd_goal "
                    + "SET rd_goal_name='" + rg.getRd_goal_name() + "',"
                    + "rd_goal_status='" + rg.getRd_goal_status() + "',"
                    + "rd_strategic_id="+rg.getRd_strategic_id() + " "
                    + "WHERE rd_goal_id=" + rg.getRd_goal_id();
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeleteRdGoal(RdGoal rg) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "DELETE FROM e_budget.rd_goal WHERE rd_goal_id=" + rg.getRd_goal_id();
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean CheckingUsage(RdGoal rg) {
        boolean ret = true;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "SELECT COUNT(*) AS cc FROM e_budget.rd_tactics WHERE rd_goal_id=" + rg.rd_goal_id;
            ResultSet rs = mm.GetDataAsResultSet(query);
            while (rs.next()) {
                if (rs.getInt("cc") > 0) {
                    ret = false;
                } else {
                    ret = true;
                }
            }
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public String getRd_goal_id() {
        return rd_goal_id;
    }

    public void setRd_goal_id(String rd_goal_id) {
        this.rd_goal_id = rd_goal_id;
    }

    public String getRd_goal_name() {
        return rd_goal_name;
    }

    public void setRd_goal_name(String rd_goal_name) {
        this.rd_goal_name = rd_goal_name;
    }

    public String getRd_goal_status() {
        return rd_goal_status;
    }

    public void setRd_goal_status(String rd_goal_status) {
        this.rd_goal_status = rd_goal_status;
    }

    public String getRd_strategic_id() {
        return rd_strategic_id;
    }

    public void setRd_strategic_id(String rd_strategic_id) {
        this.rd_strategic_id = rd_strategic_id;
    }

}
