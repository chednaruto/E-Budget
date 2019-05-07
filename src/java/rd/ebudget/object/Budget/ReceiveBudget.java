package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class ReceiveBudget {

    private String receive_budget_id;
    private String budget_category_id;
    private String budget_type_id;
    private double budget_total;
    private String budget_receive_year;
    private String budget_receive_date;
    private String officeid;
    private String disbursement_category_id;
    public boolean InsertReceiveBudget(ReceiveBudget rb) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "INSERT INTO e_budget.receive_budget(budget_category_id,budget_type_id,budget_total,budget_receive_year,budget_receive_date,officeid,disbursement_category_id) "
                    + "VALUES(" + rb.getBudget_category_id() + "," + rb.getBudget_type_id() + "," + rb.getBudget_total() + ",'"+rb.getBudget_receive_year()+"','" + rb.getBudget_receive_date()+ "','"+rb.getOfficeid()+"',"+rb.getDisbursement_category_id()+")";
            System.out.println(query);
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateReceiveBudget(ReceiveBudget rb) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "UPDATE  e_budget.receive_budget " 
                    + "SET budget_category_id="+rb.getBudget_category_id()+",budget_type_id="+rb.getBudget_type_id()+",budget_total="+rb.getBudget_total()+",budget_receive_year='"+rb.getBudget_receive_year()+"',budget_receive_date='" +rb.getBudget_receive_date()+ "',disbursement_category_id="+rb.getDisbursement_category_id()+" "
                    + "WHERE receive_budget_id =" + rb.getReceive_budget_id();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }
    
    public boolean DeleteReceiveBudget(ReceiveBudget rb) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "DELETE FROM e_budget.receive_budget WHERE receive_budget_id="+rb.getReceive_budget_id();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }
    
    public String getReceive_budget_id() {
        return receive_budget_id;
    }

    public void setReceive_budget_id(String receive_budget_id) {
        this.receive_budget_id = receive_budget_id;
    }

    public String getBudget_category_id() {
        return budget_category_id;
    }

    public void setBudget_category_id(String budget_category_id) {
        this.budget_category_id = budget_category_id;
    }

    public String getBudget_type_id() {
        return budget_type_id;
    }

    public void setBudget_type_id(String budget_type_id) {
        this.budget_type_id = budget_type_id;
    }

    public double getBudget_total() {
        return budget_total;
    }

    public void setBudget_total(double budget_total) {
        this.budget_total = budget_total;
    }

    /**
     * @return the budget_receive_year
     */
    public String getBudget_receive_year() {
        return budget_receive_year;
    }

    /**
     * @param budget_receive_year the budget_receive_year to set
     */
    public void setBudget_receive_year(String budget_receive_year) {
        this.budget_receive_year = budget_receive_year;
    }

    /**
     * @return the budget_receive_date
     */
    public String getBudget_receive_date() {
        return budget_receive_date;
    }

    /**
     * @param budget_receive_date the budget_receive_date to set
     */
    public void setBudget_receive_date(String budget_receive_date) {
        this.budget_receive_date = budget_receive_date;
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

    public String getDisbursement_category_id() {
        return disbursement_category_id;
    }

    public void setDisbursement_category_id(String disbursement_category_id) {
        this.disbursement_category_id = disbursement_category_id;
    }

}
