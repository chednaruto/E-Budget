package rd.ebudget.object.lookup.budget;

import rd.ebudget.tools.DB2Manager;

public class Disbursemen {

    private String disbursement_id;
    private String disbursement_name;
    private String disbursement_category_id;
    private String disbursement_status;
    private String gfmis_code;
    private String plan_type_id;

    public boolean InsertDisbursemen(Disbursemen d) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.disbursement(disbursement_name,disbursement_category_id,disbursement_status,gfmis_account_id,plan_type_id) "
                    + "VALUES('" + d.getDisbursement_name() + "'," + d.getDisbursement_category_id() + ",'" + d.getDisbursement_status() + "','" + d.getGfmis_code() + "',"+d.getPlan_type_id()+")";
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateDisbursemen(Disbursemen d) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.disbursement "
                    + "SET disbursement_name='" + d.getDisbursement_name() + "',"
                    + "disbursement_category_id=" + d.getDisbursement_category_id() + ","
                    + "disbursement_status='" + d.getDisbursement_status() + "',"
                    + "gfmis_account_id='" + d.getGfmis_code() + "',"
                    + "plan_type_id=" + d.getPlan_type_id()+ " "
                    + "WHERE disbursement_id = " + d.getDisbursement_id();
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteDisbursemen(Disbursemen d) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.disbursement WHERE disbursement_id=" + d.getDisbursement_id();
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public String getDisbursement_id() {
        return disbursement_id;
    }

    public void setDisbursement_id(String disbursement_id) {
        this.disbursement_id = disbursement_id;
    }

    public String getDisbursement_name() {
        return disbursement_name;
    }

    public void setDisbursement_name(String disbursement_name) {
        this.disbursement_name = disbursement_name;
    }

    public String getDisbursement_category_id() {
        return disbursement_category_id;
    }

    public void setDisbursement_category_id(String disbursement_category_id) {
        this.disbursement_category_id = disbursement_category_id;
    }

    public String getDisbursement_status() {
        return disbursement_status;
    }

    public void setDisbursement_status(String disbursement_status) {
        this.disbursement_status = disbursement_status;
    }

    public String getGfmis_code() {
        return gfmis_code;
    }

    public void setGfmis_code(String gfmis_code) {
        this.gfmis_code = gfmis_code;
    }

    /**
     * @return the plan_type_id
     */
    public String getPlan_type_id() {
        return plan_type_id;
    }

    /**
     * @param plan_type_id the plan_type_id to set
     */
    public void setPlan_type_id(String plan_type_id) {
        this.plan_type_id = plan_type_id;
    }

}
