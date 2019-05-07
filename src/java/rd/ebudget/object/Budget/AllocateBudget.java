
package rd.ebudget.object.Budget;

import rd.ebudget.tools.DB2Manager;


public class AllocateBudget {
    private int allocate_budget_id;
    private String project_id;
    private String allocate_budget_datetime;
    private String officeid;
    private int disbursement_category_id;
    private double allocate_budget_total;
    
    public boolean InsertAllocateBudget(AllocateBudget ab){
        boolean ret = false;
        try{
            String query = "INSERT INTO e_budget.allocate_budget(project_id,allocate_budget_datetime,officeid,disbursement_category_id,allocate_budget_total) "
                    + "VALUES('"+ab.getProject_id()+"',CURRENT TIMESTAMP,'"+ab.getOfficeid()+"',"+ab.getDisbursement_category_id()+","+ab.getAllocate_budget_total()+")";
            DB2Manager dbms = new DB2Manager();
            System.out.println(query);
            ret = dbms.Excute(query);
        }catch(Exception ex){
            
        }
        return ret;
    }
    
    public boolean UpdateAllocateBudget(AllocateBudget ab){
        boolean ret = false;
        try{
            String query = "UPDATE e_budget.allocate_budget SET "
                    + "allocate_budget_datetime=CURRENT TIMESTAMP,"
                    + "officeid='"+ab.getOfficeid()+"',"
                    + "disbursement_category_id="+ab.getDisbursement_category_id()+","
                    + "allocate_budget_total="+ab.getAllocate_budget_total()+" "
                    + "WHERE allocate_budget_id="+ab.getAllocate_budget_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
            System.out.println(query);
        }catch(Exception ex){
            
        }
        return ret;
    }
    
    public boolean DeleteAllocateBudget(AllocateBudget ab){
        boolean ret = false;
        try{
            String query = "DELETE FROM e_budget.allocate_budget WHERE allocate_budget_id="+ab.getAllocate_budget_id();
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        }catch(Exception ex){
            
        }
        return ret;
    }

    public int getAllocate_budget_id() {
        return allocate_budget_id;
    }

    public void setAllocate_budget_id(int allocate_budget_id) {
        this.allocate_budget_id = allocate_budget_id;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getAllocate_budget_datetime() {
        return allocate_budget_datetime;
    }

    public void setAllocate_budget_datetime(String allocate_budget_datetime) {
        this.allocate_budget_datetime = allocate_budget_datetime;
    }

    public String getOfficeid() {
        return officeid;
    }

    public void setOfficeid(String officeid) {
        this.officeid = officeid;
    }

    public double getAllocate_budget_total() {
        return allocate_budget_total;
    }

    public void setAllocate_budget_total(double allocate_budget_total) {
        this.allocate_budget_total = allocate_budget_total;
    }

    public int getDisbursement_category_id() {
        return disbursement_category_id;
    }

    public void setDisbursement_category_id(int disbursement_category_id) {
        this.disbursement_category_id = disbursement_category_id;
    }
}
