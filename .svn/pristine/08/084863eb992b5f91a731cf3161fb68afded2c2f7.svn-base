package rd.ebudget.object.lookup.Gov;

import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class MofStrategic {

    private String mof_strategic_id;
    private String mof_strategic_name;
    private String mof_strategic_status;

    public boolean InsertMofStrategic(MofStrategic ms) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "INSERT INTO e_budget.mof_strategic(mof_strategic_name,mof_strategic_status) "
                    + "VALUES('" + ms.mof_strategic_name + "','" + ms.mof_strategic_status + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean UpdateMofStrategic(MofStrategic ms) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "UPDATE e_budget.mof_strategic "
                    + "SET mof_strategic_name='" + ms.getMof_strategic_name() + "',"
                    + "mof_strategic_status='" + ms.getMof_strategic_status() + "' "
                    + "WHERE mof_strategic_id =" + ms.getMof_strategic_id();
            ret = mm.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeleteMofStrategic(MofStrategic ms) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "DELETE FROM e_budget.mof_strategic WHERE mof_strategic_id = " + ms.getMof_strategic_id();
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public String getMof_strategic_id() {
        return mof_strategic_id;
    }

    public void setMof_strategic_id(String mof_strategic_id) {
        this.mof_strategic_id = mof_strategic_id;
    }

    public String getMof_strategic_name() {
        return mof_strategic_name;
    }

    public void setMof_strategic_name(String mof_strategic_name) {
        this.mof_strategic_name = mof_strategic_name;
    }

    public String getMof_strategic_status() {
        return mof_strategic_status;
    }

    public void setMof_strategic_status(String mof_strategic_status) {
        this.mof_strategic_status = mof_strategic_status;
    }
}
