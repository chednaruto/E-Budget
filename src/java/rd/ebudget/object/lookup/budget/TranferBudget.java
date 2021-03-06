
package rd.ebudget.object.lookup.budget;

import rd.ebudget.tools.DB2Manager;

public class TranferBudget {
    private int tranfer_budget_id;
    private String from_officeid;
    private String to_officeid;
    private double budget_total;
    private String tranfer_budget_datetime;
    private String receive_budget_status;
    private int disbursement_category_id;

    public boolean InsertTranferBudget(TranferBudget tb){
        boolean ret = false;
        try{
            String query = "INSERT INTO e_budget.tranfer_budget(from_officeid,to_officeid,disbursement_category_id,"
                    + "budget_total,tranfer_budget_datetime,recieve_budget_status) "
                    + "VALUES('"+tb.getFrom_officeid()+"','"+tb.getTo_officeid()+"',"+tb.getDisbursement_category_id()+","
                    + ""+tb.getBudget_total()+",'"+tb.getTranfer_budget_datetime()+"','N')";
            System.out.println(query);
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        }catch(Exception ex){
            ret = false;
        }
        return ret;
    }
    
    public boolean UpdateTranferBudget(TranferBudget tb){
        boolean ret = false;
        try{
            String query = "UPDATE e_budget.tranfer_budget SET "
                    + "to_officeid='"+tb.getTo_officeid()+"',"
                    + "budget_total="+tb.getBudget_total()+","
                    + "tranfer_budget_datetime='"+tb.getTranfer_budget_datetime()+"' "
                    + "WHERE tranfer_budget_id = "+tb.getTranfer_budget_id();
            System.out.println(query);
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        }catch(Exception ex){
            ret = false;
        }
        return ret;
    }
    
    public boolean DeleteTranferBudget(TranferBudget tb){
        boolean ret = false;
        try{
            String query = "DELETE FROM e_budget.tranfer_budget "
                    + "WHERE tranfer_budget_id = "+tb.getTranfer_budget_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        }catch(Exception ex){
            ret = false;
        }
        return ret;
    }
    
    public int getTranfer_budget_id() {
        return tranfer_budget_id;
    }

    public void setTranfer_budget_id(int tranfer_budget_id) {
        this.tranfer_budget_id = tranfer_budget_id;
    }

    public String getFrom_officeid() {
        return from_officeid;
    }

    /**
     * @param from_officeid the from_officeid to set
     */
    public void setFrom_officeid(String from_officeid) {
        this.from_officeid = from_officeid;
    }

    /**
     * @return the to_officeid
     */
    public String getTo_officeid() {
        return to_officeid;
    }

    /**
     * @param to_officeid the to_officeid to set
     */
    public void setTo_officeid(String to_officeid) {
        this.to_officeid = to_officeid;
    }

    /**
     * @return the budget_total
     */
    public double getBudget_total() {
        return budget_total;
    }

    /**
     * @param budget_total the budget_total to set
     */
    public void setBudget_total(double budget_total) {
        this.budget_total = budget_total;
    }

    /**
     * @return the tranfer_budget_datetime
     */
    public String getTranfer_budget_datetime() {
        return tranfer_budget_datetime;
    }

    /**
     * @param tranfer_budget_datetime the tranfer_budget_datetime to set
     */
    public void setTranfer_budget_datetime(String tranfer_budget_datetime) {
        this.tranfer_budget_datetime = tranfer_budget_datetime;
    }

    /**
     * @return the receive_budget_status
     */
    public String getReceive_budget_status() {
        return receive_budget_status;
    }

    /**
     * @param receive_budget_status the receive_budget_status to set
     */
    public void setReceive_budget_status(String receive_budget_status) {
        this.receive_budget_status = receive_budget_status;
    }

    public int getDisbursement_category_id() {
        return disbursement_category_id;
    }

    public void setDisbursement_category_id(int disbursement_category_id) {
        this.disbursement_category_id = disbursement_category_id;
    }

    
    
}
