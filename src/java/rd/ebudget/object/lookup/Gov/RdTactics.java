package rd.ebudget.object.lookup.Gov;

import rd.ebudget.tools.DB2Manager;

public class RdTactics {

    private String rd_tactics_id;
    private String rd_tactics_name;
    private String rd_tactics_status;
    private String rd_goal_id;

    public boolean InsertRdTactics(RdTactics rd) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.rd_tactics(rd_tactics_name,rd_tactics_status,rd_goal_id) "
                    + "VALUES('" + rd.getRd_tactics_name() + "','" + rd.getRd_tactics_status() + "'," + rd.getRd_goal_id() + ")";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }
    
    public boolean UpdateRdTactics(RdTactics rd){
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.rd_tactics "
                    + "SET rd_tactics_name='"+ rd.getRd_tactics_name() +"',rd_tactics_status='" + rd.getRd_tactics_status() + "',rd_goal_id=" + rd.getRd_goal_id() + " "
                    + "WHERE rd_tactics_id=" + rd.getRd_tactics_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }
    
    public boolean DeleteRdTactics(RdTactics rd){
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.rd_tactics "
                    + "WHERE rd_tactics_id=" + rd.getRd_tactics_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }
    
    public String getRd_tactics_id() {
        return rd_tactics_id;
    }

    public void setRd_tactics_id(String rd_tactics_id) {
        this.rd_tactics_id = rd_tactics_id;
    }

    public String getRd_tactics_name() {
        return rd_tactics_name;
    }

    public void setRd_tactics_name(String rd_tactics_name) {
        this.rd_tactics_name = rd_tactics_name;
    }

    public String getRd_tactics_status() {
        return rd_tactics_status;
    }

    public void setRd_tactics_status(String rd_tactics_status) {
        this.rd_tactics_status = rd_tactics_status;
    }

    public String getRd_goal_id() {
        return rd_goal_id;
    }

    public void setRd_goal_id(String rd_goal_id) {
        this.rd_goal_id = rd_goal_id;
    }

}
