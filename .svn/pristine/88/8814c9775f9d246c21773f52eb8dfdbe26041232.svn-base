package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class TermOfPaymentResult {

    private String project_id;
    private int term_of_payment_id;
    private String term_of_payment_result_deliver_date;
    private double term_of_payment_result_budget;
    private String term_of_payment_result_check_date;
    private String term_of_payment_result_approve_date;
    private String term_of_payment_result_payment_date;
    private int disbursement_id;

    public boolean InsertTermOfPaymentResult(TermOfPaymentResult tr) {
        boolean ret = false;
        try {
            String query = "SELECT * FROM e_budget.term_of_payment_result WHERE term_of_payment_id =" + tr.getTerm_of_payment_id() + " AND project_id='" + tr.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            if (rs.next()) {
                query = "UPDATE e_budget.term_of_payment_result "
                        + "SET term_of_payment_result_deliver_date='" + tr.getTerm_of_payment_result_deliver_date() + "',"
                        + "term_of_payment_result_budget=" + tr.getTerm_of_payment_result_budget() + ","
                        + "term_of_payment_result_check_date='" + tr.getTerm_of_payment_result_check_date() + "',"
                        + "term_of_payment_result_approve_date='" + tr.getTerm_of_payment_result_approve_date() + "',"
                        + "term_of_payment_result_payment_date='" + tr.getTerm_of_payment_result_payment_date() + "',"
                        + "disbursement_id=" + tr.getDisbursement_id() + " "
                        + "WHERE project_id='" + tr.getProject_id() + "' AND term_of_payment_id=" + tr.getTerm_of_payment_id();
            } else {
                query = "INSERT INTO e_budget.term_of_payment_result(project_id,term_of_payment_id,term_of_payment_result_deliver_date,"
                        + "term_of_payment_result_budget,term_of_payment_result_check_date,term_of_payment_result_approve_date,"
                        + "term_of_payment_result_payment_date,disbursement_id) "
                        + "VALUES('" + tr.getProject_id() + "'," + tr.getTerm_of_payment_id() + ",'" + tr.getTerm_of_payment_result_deliver_date() + "',"
                        + "" + tr.getTerm_of_payment_result_budget() + ",'" + tr.getTerm_of_payment_result_check_date() + "','" + tr.getTerm_of_payment_result_approve_date() + "',"
                        + "'" + tr.getTerm_of_payment_result_payment_date() + "'," + tr.getDisbursement_id() + ")";
            }
            ret = dbms.Excute(query);
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeleteTermOfPaymentResult(TermOfPaymentResult tr) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.term_of_payment_result WHERE project_id='" + tr.getProject_id() + "' AND term_of_payment_id=" + tr.getTerm_of_payment_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public int getTerm_of_payment_id() {
        return term_of_payment_id;
    }

    public void setTerm_of_payment_id(int term_of_payment_id) {
        this.term_of_payment_id = term_of_payment_id;
    }

    public String getTerm_of_payment_result_deliver_date() {
        return term_of_payment_result_deliver_date;
    }

    public void setTerm_of_payment_result_deliver_date(String term_of_payment_result_deliver_date) {
        this.term_of_payment_result_deliver_date = term_of_payment_result_deliver_date;
    }

    public double getTerm_of_payment_result_budget() {
        return term_of_payment_result_budget;
    }

    public void setTerm_of_payment_result_budget(double term_of_payment_result_budget) {
        this.term_of_payment_result_budget = term_of_payment_result_budget;
    }

    public String getTerm_of_payment_result_check_date() {
        return term_of_payment_result_check_date;
    }

    public void setTerm_of_payment_result_check_date(String term_of_payment_result_check_date) {
        this.term_of_payment_result_check_date = term_of_payment_result_check_date;
    }

    public String getTerm_of_payment_result_approve_date() {
        return term_of_payment_result_approve_date;
    }

    public void setTerm_of_payment_result_approve_date(String term_of_payment_result_approve_date) {
        this.term_of_payment_result_approve_date = term_of_payment_result_approve_date;
    }

    public String getTerm_of_payment_result_payment_date() {
        return term_of_payment_result_payment_date;
    }

    public void setTerm_of_payment_result_payment_date(String term_of_payment_result_payment_date) {
        this.term_of_payment_result_payment_date = term_of_payment_result_payment_date;
    }

    public int getDisbursement_id() {
        return disbursement_id;
    }

    public void setDisbursement_id(int disbursement_id) {
        this.disbursement_id = disbursement_id;
    }
}
