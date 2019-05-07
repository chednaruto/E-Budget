/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

/**
 *
 * @author Mr.Tue
 */
public class EBiddingPlan {

    private String project_id;
    private String draf_tor_start;
    private String draf_tor_end;
    private String approve_tor_start;
    private String approve_tor_end;
    private String contest_announcement_start;
    private String contest_announcement_end;
    private String open_envelope_start;
    private String open_envelope_end;
    private String approve_start;
    private String approve_end;
    private String sign_promise_start;
    private String sign_promise_end;

    public boolean InsertEBiddingPlan(EBiddingPlan ep) {
        boolean ret = false;
        try {
            String query = "SELECT COUNT(*) AS cc FROM e_budget.e_bidding_plan WHERE project_id='" + ep.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            rs.next();
            if (rs.getInt("cc") > 0) {
                query = "UPDATE e_budget.e_bidding_plan "
                        + "SET draf_tor_start='" + ep.getDraf_tor_start() + "',draf_tor_end='" + ep.getDraf_tor_end() + "',"
                        + "approve_tor_start='" + ep.getApprove_tor_start() + "',approve_tor_end='" + ep.getApprove_tor_end() + "',contest_announcement_start='" + ep.getContest_announcement_start() + "',"
                        + "contest_announcement_end='" + ep.getContest_announcement_end() + "',open_envelope_start='" + ep.getOpen_envelope_start() + "',open_envelope_end='" + ep.getOpen_envelope_end() + "',"
                        + "approve_start='" + ep.getApprove_start() + "',approve_end='" + ep.getApprove_end() + "',sign_promise_start='" + ep.getSign_promise_start() + "',sign_promise_end='" + ep.getSign_promise_end() + "' "
                        + "WHERE project_id='" + ep.getProject_id() + "'";
                System.out.println(query);
                ret = dbms.Excute(query);
            } else {
                query = "INSERT INTO e_budget.e_bidding_plan(project_id,draf_tor_start,draf_tor_end,"
                        + "approve_tor_start,approve_tor_end,contest_announcement_start,"
                        + "contest_announcement_end,open_envelope_start,open_envelope_end,"
                        + "approve_start,approve_end,sign_promise_start,sign_promise_end) "
                        + "VALUES("
                        + "'" + ep.getProject_id() + "','" + ep.getDraf_tor_start() + "','" + ep.getDraf_tor_end() + "',"
                        + "'" + ep.getApprove_tor_start() + "','" + ep.getApprove_tor_end() + "','" + ep.getContest_announcement_start() + "',"
                        + "'" + ep.getContest_announcement_end() + "','" + ep.getOpen_envelope_start() + "','" + ep.getOpen_envelope_end() + "',"
                        + "'" + ep.getApprove_start() + "','" + ep.getApprove_end() + "','" + ep.getSign_promise_start() + "','" + ep.getSign_promise_end() + "'"
                        + ")";
                System.out.println("query");
                ret = dbms.Excute(query);
            }
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }

    public boolean DeleteEBiddingPlan(EBiddingPlan ep) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.e_bidding_plan WHERE project_id='" + ep.getProject_id() + "'";
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

    /**
     * @param project_id the project_id to set
     */
    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    /**
     * @return the draf_tor_start
     */
    public String getDraf_tor_start() {
        return draf_tor_start;
    }

    /**
     * @param draf_tor_start the draf_tor_start to set
     */
    public void setDraf_tor_start(String draf_tor_start) {
        this.draf_tor_start = draf_tor_start;
    }

    /**
     * @return the draf_tor_end
     */
    public String getDraf_tor_end() {
        return draf_tor_end;
    }

    /**
     * @param draf_tor_end the draf_tor_end to set
     */
    public void setDraf_tor_end(String draf_tor_end) {
        this.draf_tor_end = draf_tor_end;
    }

    /**
     * @return the approve_tor_start
     */
    public String getApprove_tor_start() {
        return approve_tor_start;
    }

    /**
     * @param approve_tor_start the approve_tor_start to set
     */
    public void setApprove_tor_start(String approve_tor_start) {
        this.approve_tor_start = approve_tor_start;
    }

    /**
     * @return the approve_tor_end
     */
    public String getApprove_tor_end() {
        return approve_tor_end;
    }

    /**
     * @param approve_tor_end the approve_tor_end to set
     */
    public void setApprove_tor_end(String approve_tor_end) {
        this.approve_tor_end = approve_tor_end;
    }

    /**
     * @return the contest_announcement_start
     */
    public String getContest_announcement_start() {
        return contest_announcement_start;
    }

    /**
     * @param contest_announcement_start the contest_announcement_start to set
     */
    public void setContest_announcement_start(String contest_announcement_start) {
        this.contest_announcement_start = contest_announcement_start;
    }

    /**
     * @return the contest_announcement_end
     */
    public String getContest_announcement_end() {
        return contest_announcement_end;
    }

    /**
     * @param contest_announcement_end the contest_announcement_end to set
     */
    public void setContest_announcement_end(String contest_announcement_end) {
        this.contest_announcement_end = contest_announcement_end;
    }

    /**
     * @return the open_envelope_start
     */
    public String getOpen_envelope_start() {
        return open_envelope_start;
    }

    /**
     * @param open_envelope_start the open_envelope_start to set
     */
    public void setOpen_envelope_start(String open_envelope_start) {
        this.open_envelope_start = open_envelope_start;
    }

    /**
     * @return the open_envelope_end
     */
    public String getOpen_envelope_end() {
        return open_envelope_end;
    }

    /**
     * @param open_envelope_end the open_envelope_end to set
     */
    public void setOpen_envelope_end(String open_envelope_end) {
        this.open_envelope_end = open_envelope_end;
    }

    /**
     * @return the approve_start
     */
    public String getApprove_start() {
        return approve_start;
    }

    /**
     * @param approve_start the approve_start to set
     */
    public void setApprove_start(String approve_start) {
        this.approve_start = approve_start;
    }

    /**
     * @return the approve_end
     */
    public String getApprove_end() {
        return approve_end;
    }

    /**
     * @param approve_end the approve_end to set
     */
    public void setApprove_end(String approve_end) {
        this.approve_end = approve_end;
    }

    /**
     * @return the sign_promise_start
     */
    public String getSign_promise_start() {
        return sign_promise_start;
    }

    /**
     * @param sign_promise_start the sign_promise_start to set
     */
    public void setSign_promise_start(String sign_promise_start) {
        this.sign_promise_start = sign_promise_start;
    }

    /**
     * @return the sign_promise_end
     */
    public String getSign_promise_end() {
        return sign_promise_end;
    }

    /**
     * @param sign_promise_end the sign_promise_end to set
     */
    public void setSign_promise_end(String sign_promise_end) {
        this.sign_promise_end = sign_promise_end;
    }
}
