package rd.ebudget.object.lookup.Gov;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class RdStrategic {

    private String rd_strategic_id;
    private String rd_strategic_name;
    private String rd_strategic_status;

    public boolean InsertRdStrategic(RdStrategic rs) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "INSERT INTO e_budget.rd_strategic(rd_strategic_name,rd_strategic_status) "
                    + "VALUES('" + rs.getRd_strategic_name() + "','" + rs.getRd_strategic_status() + "')";
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean UpdateRdStrategic(RdStrategic rs) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "UPDATE e_budget.rd_strategic "
                    + "SET rd_strategic_name='" + rs.getRd_strategic_name() + "',"
                    + "rd_strategic_status='" + rs.getRd_strategic_status() + "' "
                    + "WHERE rd_strategic_id = " + rs.getRd_strategic_id();
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean DeleteRdStrategic(RdStrategic rs) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "DELETE FROM e_budget.rd_strategic WHERE rd_strategic_id=" + rs.getRd_strategic_id();
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean CheckingUsage(RdStrategic rs) {
        boolean ret = true;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "SELECT COUNT(*) cc FROM  e_budget.rd_goal WHERE rd_strategic_id=" + rs.getRd_strategic_id();
            ResultSet rsl = mm.GetDataAsResultSet(query);
            while (rsl.next()) {
                if (rsl.getInt("cc") > 0) {
                    ret = false;
                } else {
                    ret = true;
                }
            }
            rsl.close();
            mm.closeConnection();
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public String getRd_strategic_id() {
        return rd_strategic_id;
    }

    public void setRd_strategic_id(String rd_strategic_id) {
        this.rd_strategic_id = rd_strategic_id;
    }

    public String getRd_strategic_name() {
        return rd_strategic_name;
    }

    public void setRd_strategic_name(String rd_strategic_name) {
        this.rd_strategic_name = rd_strategic_name;
    }

    public String getRd_strategic_status() {
        return rd_strategic_status;
    }

    public void setRd_strategic_status(String rd_strategic_status) {
        this.rd_strategic_status = rd_strategic_status;
    }

}
