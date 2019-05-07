
package rd.ebudget.tools;

import java.sql.ResultSet;


public class SelectionColorStatus {
    public double getPaymentBudgetResult(String project_id){
        double ret = 0;
        try {
            String query = "select SUM(term_of_payment_result_budget) AS cc from e_budget.term_of_payment_result where project_id = '" + project_id + "'";
            DB2Manager dbmsx = new DB2Manager();
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            rsx.next();
            ret = rsx.getDouble("cc");
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    public double getPaymentBudgetPlan(String project_id){
        double ret = 0;
        try {
            String query = "select SUM(term_of_payment_plan_budget) AS cc from e_budget.term_of_payment_plan where project_id = '" + project_id + "'";
            DB2Manager dbmsx = new DB2Manager();
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            rsx.next();
            ret = rsx.getDouble("cc");
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    
    public int getTermOfPaymentResult(String project_id) {
        int ret = 0;
        try {
            String query = "select COUNT(*) AS cc from e_budget.term_of_payment_result where project_id = '" + project_id + "'";
            DB2Manager dbmsx = new DB2Manager();
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            rsx.next();
            ret = rsx.getInt("cc");
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    
    public int getTermOfPaymentPlan(String project_id) {
        int ret = 0;
        try {
            String query = "select COUNT(*) AS cc from e_budget.term_of_payment_plan where project_id = '" + project_id + "'";
            DB2Manager dbmsx = new DB2Manager();
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            rsx.next();
            ret = rsx.getInt("cc");
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    
    public String getSignPromiseStatusColor(String project_id) {
        String ret = "";
        try {
            String EndDatePlan = "";
            Accessories acc = new Accessories();
            DB2Manager dbmsx = new DB2Manager();
            String query = "SELECT * FROM e_budget.selection_method_plan WHERE project_id = '" + project_id + "'";
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            if (rsx.next()) {
                EndDatePlan = rsx.getString("SIGN_PROMISE_END");
                query = "SELECT * FROM e_budget.selection_method_result WHERE project_id='" + project_id + "'";
                ResultSet rs1 = dbmsx.GetDataAsResultSet(query);
                if (rs1.next()) {
                    if (!acc.IsNullToEmtyString(rs1.getString("SIGN_PROMISE_DATE")).isEmpty()) {
                        if (acc.CompareStrinDate(rs1.getString("SIGN_PROMISE_DATE"), EndDatePlan)) {
                            ret = "green";
                        } else {
                            ret = "blue";
                        }
                    } else {
                        ret = "red";
                    }
                }
                rs1.close();
            } else {
                ret = "red";
            }
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    
    public String getApproveStatusColor(String project_id) {
        String ret = "";
        try {
            String EndDatePlan = "";
            Accessories acc = new Accessories();
            DB2Manager dbmsx = new DB2Manager();
            String query = "SELECT * FROM e_budget.selection_method_plan WHERE project_id = '" + project_id + "'";
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            if (rsx.next()) {
                EndDatePlan = rsx.getString("APPROVE_END");
                query = "SELECT * FROM e_budget.selection_method_result WHERE project_id='" + project_id + "'";
                ResultSet rs1 = dbmsx.GetDataAsResultSet(query);
                if (rs1.next()) {
                    if (!acc.IsNullToEmtyString(rs1.getString("APPROVE_STEP4_ENDDATE")).isEmpty()) {
                        if (acc.CompareStrinDate(rs1.getString("APPROVE_STEP4_ENDDATE"), EndDatePlan)) {
                            ret = "green";
                        } else {
                            ret = "blue";
                        }
                    } else if (!acc.IsNullToEmtyString(rs1.getString("APPROVE_STEP3_ENDDATE")).isEmpty() || !acc.IsNullToEmtyString(rs1.getString("APPROVE_STEP2_DATE")).isEmpty() || !acc.IsNullToEmtyString(rs1.getString("APPROVE_STEP1_DATE")).isEmpty()) {
                        ret = "yellow";
                    } else {
                        ret = "red";
                    }
                }
                rs1.close();
            } else {
                ret = "red";
            }
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    
    public String getBoardReviewStatusColor(String project_id) {
        String ret = "";
        try {
            String EndDatePlan = "";
            Accessories acc = new Accessories();
            DB2Manager dbmsx = new DB2Manager();
            String query = "SELECT * FROM e_budget.selection_method_plan WHERE project_id = '" + project_id + "'";
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            if (rsx.next()) {
                EndDatePlan = rsx.getString("BOARD_REVIEW_END");
                query = "SELECT * FROM e_budget.selection_method_result WHERE project_id='" + project_id + "'";
                ResultSet rs1 = dbmsx.GetDataAsResultSet(query);
                if (rs1.next()) {
                    if (!acc.IsNullToEmtyString(rs1.getString("BOARD_REVIEW_STEP3_DATE")).isEmpty()) {
                        if (acc.CompareStrinDate(rs1.getString("BOARD_REVIEW_STEP3_DATE"), EndDatePlan)) {
                            ret = "green";
                        } else {
                            ret = "blue";
                        }
                    } else if (!acc.IsNullToEmtyString(rs1.getString("BOARD_REVIEW_STEP2_ENDDATE")).isEmpty() || !acc.IsNullToEmtyString(rs1.getString("BOARD_REVIEW_STEP1_DATE")).isEmpty() ) {
                        ret = "yellow";
                    } else {
                        ret = "red";
                    }
                }
                rs1.close();
            } else {
                ret = "red";
            }
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    
    public String getInvitationStatusColor(String project_id) {
        String ret = "";
        try {
            String EndDatePlan = "";
            Accessories acc = new Accessories();
            DB2Manager dbmsx = new DB2Manager();
            String query = "SELECT * FROM e_budget.selection_method_plan WHERE project_id = '" + project_id + "'";
            ResultSet rsx = dbmsx.GetDataAsResultSet(query);
            if (rsx.next()) {
                EndDatePlan = rsx.getString("INVITATION_ANNOUNCEMENT_END");
                query = "SELECT * FROM e_budget.selection_method_result WHERE project_id='" + project_id + "'";
                ResultSet rs1 = dbmsx.GetDataAsResultSet(query);
                if (rs1.next()) {
                    if (!acc.IsNullToEmtyString(rs1.getString("INVITATION_ANNOUNCEMENT_STEP4_ENDDATE")).isEmpty()) {
                        if (acc.CompareStrinDate(rs1.getString("INVITATION_ANNOUNCEMENT_STEP4_ENDDATE"), EndDatePlan)) {
                            ret = "green";
                        } else {
                            ret = "blue";
                        }
                    } else if (!acc.IsNullToEmtyString(rs1.getString("INVITATION_ANNOUNCEMENT_STEP3_DATE")).isEmpty() || !acc.IsNullToEmtyString(rs1.getString("INVITATION_ANNOUNCEMENT_STEP2_DATE")).isEmpty() || !acc.IsNullToEmtyString(rs1.getString("INVITATION_ANNOUNCEMENT_STEP1_DATE")).isEmpty()) {
                        ret = "yellow";
                    } else {
                        ret = "red";
                    }
                }
                rs1.close();
            } else {
                ret = "red";
            }
            rsx.close();
            dbmsx.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }
    
}
