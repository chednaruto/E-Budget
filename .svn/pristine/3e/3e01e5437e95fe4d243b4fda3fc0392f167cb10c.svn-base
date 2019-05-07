package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class TermOfPaymentPlan {

    private String project_id;
    private int term_of_payment_plan_id;
    private String term_of_payment_plan_deliver_date;
    private double term_of_payment_plan_budget;
    private String term_of_payment_plan_check_date;
    private String term_of_payment_plan_approve_payment_date;
    private String term_of_payment_plan_payment_date;

    public boolean InsertTermOfPaymentPlan(TermOfPaymentPlan tp) {
        boolean ret = false;
        try {
            String query = "SELECT COUNT(*) AS cc FROM  e_budget.term_of_payment_plan WHERE project_id = '"+tp.getProject_id()+"' AND term_of_payment_plan_id="+tp.getTerm_of_payment_plan_id();
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            rs.next();
            if(rs.getInt("cc")>0){
                query = "UPDATE e_budget.term_of_payment_plan "
                    + "SET term_of_payment_plan_deliver_date='" + tp.getTerm_of_payment_plan_deliver_date() + "',"
                    + "term_of_payment_plan_budget=" + tp.getTerm_of_payment_plan_budget() + ","
                    + "term_of_payment_plan_check_date='" + tp.getTerm_of_payment_plan_check_date() + "',"
                    + "term_of_payment_plan_approve_payment_date='" + tp.getTerm_of_payment_plan_approve_payment_date() + "',"
                    + "term_of_payment_plan_payment_date='" + tp.getTerm_of_payment_plan_payment_date() + "' "
                    + "WHERE term_of_payment_plan_id=" + tp.getTerm_of_payment_plan_id() + " AND project_id='" + tp.getProject_id() + "'";
            }else{
                query = "INSERT INTO e_budget.term_of_payment_plan(project_id,term_of_payment_plan_id,term_of_payment_plan_deliver_date,"
                    + "term_of_payment_plan_budget,term_of_payment_plan_check_date,"
                    + "term_of_payment_plan_approve_payment_date,term_of_payment_plan_payment_date) "
                    + "VALUES('" + tp.getProject_id() + "'," + tp.getTerm_of_payment_plan_id() + ",'" + tp.getTerm_of_payment_plan_deliver_date() + "',"
                    + "" + tp.getTerm_of_payment_plan_budget() + ",'" + tp.getTerm_of_payment_plan_check_date() + "',"
                    + "'" + tp.getTerm_of_payment_plan_approve_payment_date() + "','" + tp.getTerm_of_payment_plan_payment_date() + "')";
            }
            ret = dbms.Excute(query);
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeleteTermOfPaymentPlan(TermOfPaymentPlan tp) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.term_of_payment_plan WHERE term_of_payment_plan_id =" + tp.getTerm_of_payment_plan_id() + " AND project_id='" + tp.getProject_id() + "'";
            System.out.println(query);
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

    public int getTerm_of_payment_plan_id() {
        return term_of_payment_plan_id;
    }

    public void setTerm_of_payment_plan_id(int term_of_payment_plan_id) {
        this.term_of_payment_plan_id = term_of_payment_plan_id;
    }

    public String getTerm_of_payment_plan_deliver_date() {
        return term_of_payment_plan_deliver_date;
    }

    public void setTerm_of_payment_plan_deliver_date(String term_of_payment_plan_deliver_date) {
        this.term_of_payment_plan_deliver_date = term_of_payment_plan_deliver_date;
    }

    public double getTerm_of_payment_plan_budget() {
        return term_of_payment_plan_budget;
    }

    public String getTerm_of_payment_plan_check_date() {
        return term_of_payment_plan_check_date;
    }

    public void setTerm_of_payment_plan_check_date(String term_of_payment_plan_check_date) {
        this.term_of_payment_plan_check_date = term_of_payment_plan_check_date;
    }

    public String getTerm_of_payment_plan_approve_payment_date() {
        return term_of_payment_plan_approve_payment_date;
    }

    public void setTerm_of_payment_plan_approve_payment_date(String term_of_payment_plan_approve_payment_date) {
        this.term_of_payment_plan_approve_payment_date = term_of_payment_plan_approve_payment_date;
    }

    public String getTerm_of_payment_plan_payment_date() {
        return term_of_payment_plan_payment_date;
    }

    public void setTerm_of_payment_plan_payment_date(String term_of_payment_plan_payment_date) {
        this.term_of_payment_plan_payment_date = term_of_payment_plan_payment_date;
    }

    public void setTerm_of_payment_plan_budget(double term_of_payment_plan_budget) {
        this.term_of_payment_plan_budget = term_of_payment_plan_budget;
    }

}
