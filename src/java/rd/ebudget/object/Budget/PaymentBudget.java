package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;

public class PaymentBudget {

    private int payment_budget_id;
    private int disbursement_category_id;
    private String payment_budget_datetime;
    private String officeid;
    private double payment_budget_total;
    private int disbursement_id;

    public boolean InsertPaymentBudget(PaymentBudget pb) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.payment_budget(disbursement_category_id,payment_budget_datetime,officeid,payment_budget_total,disbursement_id) "
                    + "VALUES(" + pb.getDisbursement_category_id()+ ",'" + pb.getPayment_budget_datetime() + "','" + pb.getOfficeid() + "'," + pb.getPayment_budget_total() + "," + pb.getDisbursement_id() + ")";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean UpdatePaymentBudget(PaymentBudget pb) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.payment_budget "
                    + "SET payment_budget_datetime = '" + pb.getPayment_budget_datetime() + "',payment_budget_total=" + pb.getPayment_budget_total() + ",disbursement_id=" + pb.getDisbursement_id() + " "
                    + "WHERE payment_budget_id=" + pb.getPayment_budget_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeletePaymentBudget(PaymentBudget pb) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.payment_budget "
                    + "WHERE payment_budget_id=" + pb.getPayment_budget_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public int getPayment_budget_id() {
        return payment_budget_id;
    }

    public void setPayment_budget_id(int payment_budget_id) {
        this.payment_budget_id = payment_budget_id;
    }

    public String getPayment_budget_datetime() {
        return payment_budget_datetime;
    }

    public void setPayment_budget_datetime(String payment_budget_datetime) {
        this.payment_budget_datetime = payment_budget_datetime;
    }

    public String getOfficeid() {
        return officeid;
    }

    public void setOfficeid(String officeid) {
        this.officeid = officeid;
    }

    public double getPayment_budget_total() {
        return payment_budget_total;
    }

    public void setPayment_budget_total(double payment_budget_total) {
        this.payment_budget_total = payment_budget_total;
    }

    public int getDisbursement_id() {
        return disbursement_id;
    }

    public void setDisbursement_id(int disbursement_id) {
        this.disbursement_id = disbursement_id;
    }

    public int getDisbursement_category_id() {
        return disbursement_category_id;
    }

    public void setDisbursement_category_id(int disbursement_category_id) {
        this.disbursement_category_id = disbursement_category_id;
    }
}
