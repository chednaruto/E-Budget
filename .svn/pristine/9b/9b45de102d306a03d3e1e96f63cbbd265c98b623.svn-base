package rd.ebudget.object.Budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class EMarketResult {

    private String project_id;
    private String contest_announcement_step1_date;
    private String contest_announcement_step2_date;
    private String contest_announcement_step3_date;
    private String contest_announcement_step4_startdate;
    private String contest_announcement_step4_enddate;
    private String open_envelope_step1_date;
    private String open_envelope_step2_startdate;
    private String open_envelope_step2_enddate;
    private String approve_step1_startdate;
    private String approve_step1_enddate;
    private String approve_step2_startdate;
    private String approve_step2_enddate;
    private String approve_step3_date;
    private String approve_step4_startdate;
    private String approve_step4_enddate;
    private String approve_step5_startdate;
    private String approve_step5_enddate;
    private String sign_promise_date;
    private String promise_number;
    private String promise_name;

    public boolean InsertEMarketResult(EMarketResult er) {
        boolean ret = true;
        try {
            String query = "SELECT * FROM e_budget.e_market_result WHERE project_id='" + er.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);

            if (!rs.next()) {
                query = "INSERT INTO e_budget.e_market_result(project_id,contest_announcement_step1_date,contest_announcement_step2_date,contest_announcement_step3_date,contest_announcement_step4_startdate,contest_announcement_step4_enddate,open_envelope_step1_date,open_envelope_step2_startdate,open_envelope_step2_enddate,approve_step1_startdate,approve_step1_enddate,approve_step2_startdate,approve_step2_enddate,approve_step3_date,approve_step4_startdate,approve_step4_enddate,approve_step5_startdate,approve_step5_enddate,sign_promise_date,promise_number,promise_name) "
                        + "VALUES('" + er.getProject_id() + "',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'" + er.getPromise_number() + "','" + er.getPromise_name() + "')";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }

            if (!er.getContest_announcement_step1_date().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step1_date='" + er.getContest_announcement_step1_date() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step1_date=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;

                }
            }

            if (!er.getContest_announcement_step2_date().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step2_date='" + er.getContest_announcement_step2_date() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step2_date=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }

            if (!er.getContest_announcement_step3_date().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step3_date='" + er.getContest_announcement_step3_date() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step3_date=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getContest_announcement_step4_startdate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step4_startdate='" + er.getContest_announcement_step4_startdate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step4_startdate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getContest_announcement_step4_enddate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step4_enddate='" + er.getContest_announcement_step4_enddate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET contest_announcement_step4_enddate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getOpen_envelope_step1_date().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET open_envelope_step1_date='" + er.getOpen_envelope_step1_date() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET open_envelope_step1_date=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }

            if (!er.getOpen_envelope_step2_startdate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET open_envelope_step2_startdate='" + er.getOpen_envelope_step2_startdate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET open_envelope_step2_startdate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getOpen_envelope_step2_enddate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET open_envelope_step2_enddate='" + er.getOpen_envelope_step2_enddate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET open_envelope_step2_enddate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step1_startdate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step1_startdate='" + er.getApprove_step1_startdate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step1_startdate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step1_enddate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step1_enddate='" + er.getApprove_step1_enddate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step1_enddate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step2_startdate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step2_startdate='" + er.getApprove_step2_startdate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step2_startdate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step2_enddate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step2_enddate='" + er.getApprove_step2_enddate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step2_enddate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step3_date().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step3_date='" + er.getApprove_step3_date() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step3_date=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";
                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step4_startdate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step4_startdate='" + er.getApprove_step4_startdate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step4_startdate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step4_enddate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step4_enddate='" + er.getApprove_step4_enddate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step4_enddate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step5_startdate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step5_startdate='" + er.getApprove_step5_startdate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step5_startdate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getApprove_step5_enddate().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step5_enddate='" + er.getApprove_step5_enddate() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET approve_step5_enddate=NULL "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            if (!er.getSign_promise_date().isEmpty()) {
                query = "UPDATE e_budget.e_market_result "
                        + "SET sign_promise_date='" + er.getSign_promise_date() + "',promise_number='" + er.getPromise_number() + "',promise_name='" + er.getPromise_name() + "' "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            } else {
                query = "UPDATE e_budget.e_market_result "
                        + "SET sign_promise_date=NULL,promise_number='',promise_name=''  "
                        + "WHERE project_id='" + er.getProject_id() + "'";

                if (!dbms.Excute(query)) {
                    ret = false;
                }
            }
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public boolean DeleteEMarketResult(EMarketResult er) {
        boolean ret = false;
        try {
            String qurey = "DELETE FROM e_budget.e_market_result WHERE project_id='" + er.getProject_id() + "'";
            DB2Manager dbms = new DB2Manager();
            ret = dbms.Excute(qurey);
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

    public String getContest_announcement_step1_date() {
        return contest_announcement_step1_date;
    }

    public void setContest_announcement_step1_date(String contest_announcement_step1_date) {
        this.contest_announcement_step1_date = contest_announcement_step1_date;
    }

    public String getContest_announcement_step2_date() {
        return contest_announcement_step2_date;
    }

    public void setContest_announcement_step2_date(String contest_announcement_step2_date) {
        this.contest_announcement_step2_date = contest_announcement_step2_date;
    }

    public String getContest_announcement_step3_date() {
        return contest_announcement_step3_date;
    }

    public void setContest_announcement_step3_date(String contest_announcement_step3_date) {
        this.contest_announcement_step3_date = contest_announcement_step3_date;
    }

    public String getContest_announcement_step4_startdate() {
        return contest_announcement_step4_startdate;
    }

    public void setContest_announcement_step4_startdate(String contest_announcement_step4_startdate) {
        this.contest_announcement_step4_startdate = contest_announcement_step4_startdate;
    }

    public String getContest_announcement_step4_enddate() {
        return contest_announcement_step4_enddate;
    }

    public void setContest_announcement_step4_enddate(String contest_announcement_step4_enddate) {
        this.contest_announcement_step4_enddate = contest_announcement_step4_enddate;
    }

    public String getOpen_envelope_step1_date() {
        return open_envelope_step1_date;
    }

    public void setOpen_envelope_step1_date(String open_envelope_step1_date) {
        this.open_envelope_step1_date = open_envelope_step1_date;
    }

    public String getOpen_envelope_step2_startdate() {
        return open_envelope_step2_startdate;
    }

    public void setOpen_envelope_step2_startdate(String open_envelope_step2_startdate) {
        this.open_envelope_step2_startdate = open_envelope_step2_startdate;
    }

    public String getOpen_envelope_step2_enddate() {
        return open_envelope_step2_enddate;
    }

    public void setOpen_envelope_step2_enddate(String open_envelope_step2_enddate) {
        this.open_envelope_step2_enddate = open_envelope_step2_enddate;
    }

    public String getApprove_step1_startdate() {
        return approve_step1_startdate;
    }

    public void setApprove_step1_startdate(String approve_step1_startdate) {
        this.approve_step1_startdate = approve_step1_startdate;
    }

    public String getApprove_step1_enddate() {
        return approve_step1_enddate;
    }

    public void setApprove_step1_enddate(String approve_step1_enddate) {
        this.approve_step1_enddate = approve_step1_enddate;
    }

    public String getApprove_step2_startdate() {
        return approve_step2_startdate;
    }

    public void setApprove_step2_startdate(String approve_step2_startdate) {
        this.approve_step2_startdate = approve_step2_startdate;
    }

    public String getApprove_step2_enddate() {
        return approve_step2_enddate;
    }

    public void setApprove_step2_enddate(String approve_step2_enddate) {
        this.approve_step2_enddate = approve_step2_enddate;
    }

    public String getApprove_step3_date() {
        return approve_step3_date;
    }

    public void setApprove_step3_date(String approve_step3_date) {
        this.approve_step3_date = approve_step3_date;
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

    public String getApprove_step5_startdate() {
        return approve_step5_startdate;
    }

    public void setApprove_step5_startdate(String approve_step5_startdate) {
        this.approve_step5_startdate = approve_step5_startdate;
    }

    public String getApprove_step5_enddate() {
        return approve_step5_enddate;
    }

    public void setApprove_step5_enddate(String approve_step5_enddate) {
        this.approve_step5_enddate = approve_step5_enddate;
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
