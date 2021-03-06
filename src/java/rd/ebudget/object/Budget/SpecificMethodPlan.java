package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class SpecificMethodPlan {

    private String project_id;
    private String invitation_announcement_start;
    private String invitation_announcement_end;
    private String board_review_start;
    private String board_review_end;
    private String approve_start;
    private String approve_end;
    private String sign_promise_start;
    private String sign_promise_end;

    public boolean InsertSpecificMethodPlan(SpecificMethodPlan sp) {
        boolean ret = false;
        try {
            String query = "SELECT COUNT(*) AS cc FROM e_budget.specific_method_plan WHERE project_id='" + sp.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            rs.next();
            if (rs.getInt("cc") > 0) {
                query = "UPDATE e_budget.specific_method_plan SET "
                        + "invitation_announcement_start='" + sp.getInvitation_announcement_start() + "',invitation_announcement_end='" + sp.getInvitation_announcement_end() + "',"
                        + "board_review_start='" + sp.getBoard_review_start() + "',board_review_end='" + sp.getBoard_review_end() + "',approve_start='" + sp.getApprove_start() + "',"
                        + "approve_end='" + sp.getApprove_end() + "',sign_promise_start='" + sp.getSign_promise_start() + "',sign_promise_end='" + sp.getSign_promise_end() + "' WHERE project_id='" + sp.getProject_id() + "'";
                System.out.println(query);
                ret = dbms.Excute(query);
            } else {
                query = "INSERT INTO e_budget.specific_method_plan(project_id,invitation_announcement_start,invitation_announcement_end,"
                        + "board_review_start,board_review_end,approve_start,"
                        + "approve_end,sign_promise_start,sign_promise_end) VALUES("
                        + "'" + sp.getProject_id() + "','" + sp.getInvitation_announcement_start() + "','" + sp.getInvitation_announcement_end() + "',"
                        + "'" + sp.getBoard_review_start() + "','" + sp.getBoard_review_end() + "','" + sp.getApprove_start() + "',"
                        + "'" + sp.getApprove_end() + "','" + sp.getSign_promise_start() + "','" + sp.getSign_promise_end() + "'"
                        + ")";
                System.out.println(query);
                ret = dbms.Excute(query);
            }
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeleteSpecificMethodPlan(SpecificMethodPlan sp) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.specific_method_plan WHERE project_id='" + sp.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }
    
    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getInvitation_announcement_start() {
        return invitation_announcement_start;
    }

    public void setInvitation_announcement_start(String invitation_announcement_start) {
        this.invitation_announcement_start = invitation_announcement_start;
    }

    public String getInvitation_announcement_end() {
        return invitation_announcement_end;
    }

    public void setInvitation_announcement_end(String invitation_announcement_end) {
        this.invitation_announcement_end = invitation_announcement_end;
    }

    public String getBoard_review_start() {
        return board_review_start;
    }

    public void setBoard_review_start(String board_review_start) {
        this.board_review_start = board_review_start;
    }

    public String getBoard_review_end() {
        return board_review_end;
    }

    public void setBoard_review_end(String board_review_end) {
        this.board_review_end = board_review_end;
    }

    public String getApprove_start() {
        return approve_start;
    }

    public void setApprove_start(String approve_start) {
        this.approve_start = approve_start;
    }

    public String getApprove_end() {
        return approve_end;
    }

    public void setApprove_end(String approve_end) {
        this.approve_end = approve_end;
    }

    public String getSign_promise_start() {
        return sign_promise_start;
    }

    public void setSign_promise_start(String sign_promise_start) {
        this.sign_promise_start = sign_promise_start;
    }

    public String getSign_promise_end() {
        return sign_promise_end;
    }

    public void setSign_promise_end(String sign_promise_end) {
        this.sign_promise_end = sign_promise_end;
    }
}
