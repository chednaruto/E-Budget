package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class SpecificMethodResult {

    private String project_id;
    private String invitation_announcement_step1_date;
    private String invitation_announcement_step2_date;
    private String invitation_announcement_step3_date;
    private String invitation_announcement_step4_startdate;
    private String invitation_announcement_step4_enddate;
    private String board_review_step1_date;
    private String board_review_step2_startdate;
    private String board_review_step2_enddate;
    private String board_review_step3_date;
    private String approve_step1_date;
    private String approve_step2_date;
    private String approve_step3_startdate;
    private String approve_step3_enddate;
    private String approve_step4_startdate;
    private String approve_step4_enddate;
    private String sign_promise_date;
    private String promise_number;
    private String promise_name;

    public boolean InsertSpecificMethodResult(SpecificMethodResult sr) {
        boolean ret = false;
        try {
            DB2Manager dbms = new DB2Manager();
            String query = "SELECT * FROM e_budget.specific_method_result WHERE project_id='" + sr.getProject_id() + "'";
            ResultSet rs = dbms.GetDataAsResultSet(query);
            if (rs.next()) {
                query = "UPDATE e_budget.specific_method_result SET "
                        + "invitation_announcement_step1_date=" + sr.getInvitation_announcement_step1_date() + ","
                        + "invitation_announcement_step2_date=" + sr.getInvitation_announcement_step2_date() + ","
                        + "invitation_announcement_step3_date=" + sr.getInvitation_announcement_step3_date() + ","
                        + "invitation_announcement_step4_startdate=" + sr.getInvitation_announcement_step4_startdate() + ","
                        + "invitation_announcement_step4_enddate=" + sr.getInvitation_announcement_step4_enddate() + ","
                        + "board_review_step1_date=" + sr.getBoard_review_step1_date() + ","
                        + "board_review_step2_startdate=" + sr.getBoard_review_step2_startdate() + ","
                        + "board_review_step2_enddate=" + sr.getBoard_review_step2_enddate() + ","
                        + "board_review_step3_date=" + sr.getBoard_review_step3_date() + ","
                        + "approve_step1_date=" + sr.getApprove_step1_date() + ","
                        + "approve_step2_date=" + sr.getApprove_step2_date() + ","
                        + "approve_step3_startdate=" + sr.getApprove_step3_startdate() + ","
                        + "approve_step3_enddate=" + sr.getApprove_step3_enddate() + ","
                        + "approve_step4_startdate=" + sr.getApprove_step4_startdate() + ","
                        + "approve_step4_enddate=" + sr.getApprove_step4_enddate() + ","
                        + "sign_promise_date=" + sr.getSign_promise_date() + ", "
                        + "promise_number='" + sr.getPromise_number()+ "', "
                        + "promise_name='" + sr.getPromise_name()+ "' "
                        + "WHERE project_id='" + sr.getProject_id() + "'";
            } else {
                query = "INSERT INTO e_budget.specific_method_result(project_id,invitation_announcement_step1_date,invitation_announcement_step2_date,"
                        + "invitation_announcement_step3_date,invitation_announcement_step4_startdate,invitation_announcement_step4_enddate,board_review_step1_date,board_review_step2_startdate,"
                        + "board_review_step2_enddate,board_review_step3_date,approve_step1_date,"
                        + "approve_step2_date,approve_step3_startdate,approve_step3_enddate,"
                        + "approve_step4_startdate,approve_step4_enddate,sign_promise_date,promise_number,promise_name) "
                        + " VALUES('" + sr.getProject_id() + "'," + sr.getInvitation_announcement_step1_date() + "," + sr.getInvitation_announcement_step2_date() + ","
                        + "" + sr.getInvitation_announcement_step3_date() + ","+sr.getInvitation_announcement_step4_startdate()+"," + sr.getInvitation_announcement_step4_enddate() + "," + sr.getBoard_review_step1_date() + "," + sr.getBoard_review_step2_startdate() + ","
                        + "" + sr.getBoard_review_step2_enddate() + "," + sr.getBoard_review_step3_date() + "," + sr.getApprove_step1_date() + ","
                        + "" + sr.getApprove_step2_date() + "," + sr.getApprove_step3_startdate() + "," + sr.getApprove_step3_enddate() + ","
                        + "" + sr.getApprove_step4_startdate() + "," + sr.getApprove_step4_enddate() + "," + sr.getSign_promise_date() + ",'"+sr.getPromise_number()+"','"+sr.getPromise_name()+"')";
            }
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

    public String getInvitation_announcement_step1_date() {
        return invitation_announcement_step1_date;
    }

    public void setInvitation_announcement_step1_date(String invitation_announcement_step1_date) {
        this.invitation_announcement_step1_date = invitation_announcement_step1_date;
    }

    public String getInvitation_announcement_step2_date() {
        return invitation_announcement_step2_date;
    }

    public void setInvitation_announcement_step2_date(String invitation_announcement_step2_date) {
        this.invitation_announcement_step2_date = invitation_announcement_step2_date;
    }

    public String getInvitation_announcement_step3_date() {
        return invitation_announcement_step3_date;
    }

    public void setInvitation_announcement_step3_date(String invitation_announcement_step3_date) {
        this.invitation_announcement_step3_date = invitation_announcement_step3_date;
    }

    public String getInvitation_announcement_step4_startdate() {
        return invitation_announcement_step4_startdate;
    }

    public void setInvitation_announcement_step4_startdate(String invitation_announcement_step4_startdate) {
        this.invitation_announcement_step4_startdate = invitation_announcement_step4_startdate;
    }

    public String getInvitation_announcement_step4_enddate() {
        return invitation_announcement_step4_enddate;
    }

    public void setInvitation_announcement_step4_enddate(String invitation_announcement_step4_enddate) {
        this.invitation_announcement_step4_enddate = invitation_announcement_step4_enddate;
    }

    public String getBoard_review_step1_date() {
        return board_review_step1_date;
    }

    public void setBoard_review_step1_date(String board_review_step1_date) {
        this.board_review_step1_date = board_review_step1_date;
    }

    public String getBoard_review_step2_startdate() {
        return board_review_step2_startdate;
    }

    public void setBoard_review_step2_startdate(String board_review_step2_startdate) {
        this.board_review_step2_startdate = board_review_step2_startdate;
    }

    public String getBoard_review_step2_enddate() {
        return board_review_step2_enddate;
    }

    public void setBoard_review_step2_enddate(String board_review_step2_enddate) {
        this.board_review_step2_enddate = board_review_step2_enddate;
    }

    public String getBoard_review_step3_date() {
        return board_review_step3_date;
    }

    public void setBoard_review_step3_date(String board_review_step3_date) {
        this.board_review_step3_date = board_review_step3_date;
    }

    public String getApprove_step1_date() {
        return approve_step1_date;
    }

    public void setApprove_step1_date(String approve_step1_date) {
        this.approve_step1_date = approve_step1_date;
    }

    public String getApprove_step2_date() {
        return approve_step2_date;
    }

    public void setApprove_step2_date(String approve_step2_date) {
        this.approve_step2_date = approve_step2_date;
    }

    public String getApprove_step3_startdate() {
        return approve_step3_startdate;
    }

    public void setApprove_step3_startdate(String approve_step3_startdate) {
        this.approve_step3_startdate = approve_step3_startdate;
    }

    public String getApprove_step3_enddate() {
        return approve_step3_enddate;
    }

    public void setApprove_step3_enddate(String approve_step3_enddate) {
        this.approve_step3_enddate = approve_step3_enddate;
    }

    public String getApprove_step4_startdate() {
        return approve_step4_startdate;
    }

    public void setApprove_step4_startdate(String approve_step4_startdate) {
        this.approve_step4_startdate = approve_step4_startdate;
    }

    public String getApprove_step4_enddate() {
        return approve_step4_enddate;
    }

    public void setApprove_step4_enddate(String approve_step4_enddate) {
        this.approve_step4_enddate = approve_step4_enddate;
    }

    public String getSign_promise_date() {
        return sign_promise_date;
    }

    public void setSign_promise_date(String sign_promise_date) {
        this.sign_promise_date = sign_promise_date;
    }

    public String getPromise_number() {
        return promise_number;
    }

    public void setPromise_number(String promise_number) {
        this.promise_number = promise_number;
    }

    public String getPromise_name() {
        return promise_name;
    }

    public void setPromise_name(String promise_name) {
        this.promise_name = promise_name;
    }
}
