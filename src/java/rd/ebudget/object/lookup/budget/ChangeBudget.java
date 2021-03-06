package rd.ebudget.object.lookup.budget;

import rd.ebudget.tools.DB2Manager;

public class ChangeBudget {

    private String officeid;
    private int change_budget_id;
    private int from_disbursement_category_id;
    private int to_disbursement_category_id;
    private double budget_total;
    private String change_budget_datetime;

    public boolean InsertChangeBudget(ChangeBudget cb) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.change_budget(officeid,from_disbursement_category_id,to_disbursement_category_id,budget_total,change_budget_datetime) "
                    + "VALUES('" + cb.getOfficeid() + "'," + cb.getFrom_disbursement_category_id()+ "," + cb.getTo_disbursement_category_id()+ "," + cb.getBudget_total() +",'"+cb.getChange_budget_datetime()+"')";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean UpdateChangeBudget(ChangeBudget cb) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.change_budget SET to_disbursement_category_id=" + cb.getTo_disbursement_category_id()+ ",budget_total=" + cb.getBudget_total() + ",change_budget_datetime='"+cb.getChange_budget_datetime()+"' WHERE change_budget_id=" + cb.getChange_budget_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeleteChageBudget(ChangeBudget cb) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.change_budget WHERE change_budget_id=" + cb.getChange_budget_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public int getChange_budget_id() {
        return change_budget_id;
    }

    public void setChange_budget_id(int change_budget_id) {
        this.change_budget_id = change_budget_id;
    }

    

    public double getBudget_total() {
        return budget_total;
    }

    public void setBudget_total(double budget_total) {
        this.budget_total = budget_total;
    }

    public String getChange_budget_datetime() {
        return change_budget_datetime;
    }

    public void setChange_budget_datetime(String change_budget_datetime) {
        this.change_budget_datetime = change_budget_datetime;
    }

    /**
     * @return the officeid
     */
    public String getOfficeid() {
        return officeid;
    }

    /**
     * @param officeid the officeid to set
     */
    public void setOfficeid(String officeid) {
        this.officeid = officeid;
    }

    public int getFrom_disbursement_category_id() {
        return from_disbursement_category_id;
    }

    public void setFrom_disbursement_category_id(int from_disbursement_category_id) {
        this.from_disbursement_category_id = from_disbursement_category_id;
    }

    public int getTo_disbursement_category_id() {
        return to_disbursement_category_id;
    }

    public void setTo_disbursement_category_id(int to_disbursement_category_id) {
        this.to_disbursement_category_id = to_disbursement_category_id;
    }
}
