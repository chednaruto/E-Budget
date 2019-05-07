package rd.ebudget.object.lookup.budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class DisbursementCategory {

    private String disbursement_category_id;
    private String disbursement_category_name;
    private String disbursement_category_status;
    private String budget_category_id;

    public boolean InsertDisbursementCategory(DisbursementCategory dc) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.disbursement_category(disbursement_category_name,disbursement_category_status,budget_category_id) "
                    + "VALUES('" + dc.getDisbursement_category_name() + "','" + dc.getDisbursement_category_status() + "'," + dc.getBudget_category_id()+ ")";
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateDisbursementCategory(DisbursementCategory dc) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.disbursement_category "
                    + "SET disbursement_category_name = '" + dc.disbursement_category_name + "',"
                    + "disbursement_category_status='" + dc.getDisbursement_category_status() + "'," 
                    + "budget_category_id= " + dc.getBudget_category_id()+ " "
                    + "WHERE disbursement_category_id = " + dc.disbursement_category_id;
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteDisbursementCategory(DisbursementCategory dc) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.disbursement_category WHERE disbursement_category_id=" + dc.getDisbursement_category_id();
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean CheckingUsage(DisbursementCategory dc) {
        boolean ret = true;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "SELECT COUNT(*) cc FROM  e_budget.disbursement WHERE disbursement_category_id=" + dc.getDisbursement_category_id();
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

    public String getDisbursement_category_id() {
        return disbursement_category_id;
    }

    public void setDisbursement_category_id(String disbursement_category_id) {
        this.disbursement_category_id = disbursement_category_id;
    }

    public String getDisbursement_category_name() {
        return disbursement_category_name;
    }

    public void setDisbursement_category_name(String disbursement_category_name) {
        this.disbursement_category_name = disbursement_category_name;
    }

    public String getDisbursement_category_status() {
        return disbursement_category_status;
    }

    public void setDisbursement_category_status(String disbursement_category_status) {
        this.disbursement_category_status = disbursement_category_status;
    }

    public String getBudget_category_id() {
        return budget_category_id;
    }

    public void setBudget_category_id(String budget_category_id) {
        this.budget_category_id = budget_category_id;
    }

    

}
