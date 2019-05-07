
package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class EBiddingResultTorLoop {
    private String project_id;
    private String e_bidding_result_tor_loop_id;
    private String e_bidding_result_tor_loop_step1_startdate;
    private String e_bidding_result_tor_loop_step1_enddate;
    private String e_bidding_result_tor_loop_step2_status;
    private String e_bidding_result_tor_loop_step2_desc;
    private String e_bidding_result_tor_loop_step3_date;
    private String e_bidding_result_tor_loop_step4_date;
    private String e_bidding_result_tor_loop_step5_status;
    private String e_bidding_result_tor_loop_step5_date;

    public boolean InsertEBiddingResultTorLoop(EBiddingResultTorLoop el){
        boolean ret = false;
        try{
            DB2Manager dbms = new DB2Manager();
            String query = "INSERT INTO e_budget.e_bidding_result_tor_loop("
                    + "project_id,e_bidding_result_tor_loop_id,e_bidding_result_tor_loop_step1_startdate,"
                    + "e_bidding_result_tor_loop_step1_enddate,e_bidding_result_tor_loop_step2_status,e_bidding_result_tor_loop_step2_desc,"
                    + "e_bidding_result_tor_loop_step3_date,e_bidding_result_tor_loop_step4_date,e_bidding_result_tor_loop_step5_status,"
                    + "e_bidding_result_tor_loop_step5_date) VALUES('"+el.getProject_id()+"',"+el.getE_bidding_result_tor_loop_id()+","+el.getE_bidding_result_tor_loop_step1_startdate()+","
                    + ""+el.getE_bidding_result_tor_loop_step1_enddate()+",'"+el.getE_bidding_result_tor_loop_step2_status()+"','"+el.getE_bidding_result_tor_loop_step2_desc()+"',"
                    + ""+el.getE_bidding_result_tor_loop_step3_date()+","+el.getE_bidding_result_tor_loop_step4_date()+",'"+el.getE_bidding_result_tor_loop_step5_status()+"',"
                    + ""+el.getE_bidding_result_tor_loop_step5_date()+")";
            System.out.println(query);
            ret = dbms.Excute(query);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return ret ;
    }
    
    
    public boolean DeleteEBiddingResultTorLoop(String project_id){
        boolean ret =false;
        try{
            String query = "DELETE FROM e_budget.e_bidding_result_tor_loop WHERE project_id='"+project_id+"'";
            System.out.println(query);
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        }catch(Exception ex){
            
        }
        return ret;
    }
    
    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getE_bidding_result_tor_loop_id() {
        return e_bidding_result_tor_loop_id;
    }

    public void setE_bidding_result_tor_loop_id(String e_bidding_result_tor_loop_id) {
        this.e_bidding_result_tor_loop_id = e_bidding_result_tor_loop_id;
    }

    public String getE_bidding_result_tor_loop_step1_startdate() {
        return e_bidding_result_tor_loop_step1_startdate;
    }

    public void setE_bidding_result_tor_loop_step1_startdate(String e_bidding_result_tor_loop_step1_startdate) {
        this.e_bidding_result_tor_loop_step1_startdate = e_bidding_result_tor_loop_step1_startdate;
    }

    public String getE_bidding_result_tor_loop_step1_enddate() {
        return e_bidding_result_tor_loop_step1_enddate;
    }

    public void setE_bidding_result_tor_loop_step1_enddate(String e_bidding_result_tor_loop_step1_enddate) {
        this.e_bidding_result_tor_loop_step1_enddate = e_bidding_result_tor_loop_step1_enddate;
    }

    public String getE_bidding_result_tor_loop_step2_status() {
        return e_bidding_result_tor_loop_step2_status;
    }

    public void setE_bidding_result_tor_loop_step2_status(String e_bidding_result_tor_loop_step2_status) {
        this.e_bidding_result_tor_loop_step2_status = e_bidding_result_tor_loop_step2_status;
    }

    public String getE_bidding_result_tor_loop_step2_desc() {
        return e_bidding_result_tor_loop_step2_desc;
    }

    public void setE_bidding_result_tor_loop_step2_desc(String e_bidding_result_tor_loop_step2_desc) {
        this.e_bidding_result_tor_loop_step2_desc = e_bidding_result_tor_loop_step2_desc;
    }

    public String getE_bidding_result_tor_loop_step3_date() {
        return e_bidding_result_tor_loop_step3_date;
    }

    public void setE_bidding_result_tor_loop_step3_date(String e_bidding_result_tor_loop_step3_date) {
        this.e_bidding_result_tor_loop_step3_date = e_bidding_result_tor_loop_step3_date;
    }

    public String getE_bidding_result_tor_loop_step4_date() {
        return e_bidding_result_tor_loop_step4_date;
    }

    public void setE_bidding_result_tor_loop_step4_date(String e_bidding_result_tor_loop_step4_date) {
        this.e_bidding_result_tor_loop_step4_date = e_bidding_result_tor_loop_step4_date;
    }

    public String getE_bidding_result_tor_loop_step5_status() {
        return e_bidding_result_tor_loop_step5_status;
    }

    public void setE_bidding_result_tor_loop_step5_status(String e_bidding_result_tor_loop_step5_status) {
        this.e_bidding_result_tor_loop_step5_status = e_bidding_result_tor_loop_step5_status;
    }

    public String getE_bidding_result_tor_loop_step5_date() {
        return e_bidding_result_tor_loop_step5_date;
    }

    public void setE_bidding_result_tor_loop_step5_date(String e_bidding_result_tor_loop_step5_date) {
        this.e_bidding_result_tor_loop_step5_date = e_bidding_result_tor_loop_step5_date;
    }

}
