package rd.ebudget.object.lookup.budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class BudgetCategory {

    private String budget_category_id;
    private String budget_category_name;
    private String budget_category_status;
    private String budget_type_id;

    public boolean InsertBudgetCategory(BudgetCategory bc) {
        boolean ret = false;
        try {
            String query = "INSERT INTO e_budget.budget_category(budget_category_name,budget_category_status,budget_type_id) "
                    + "VALUES('" + bc.getBudget_category_name() + "','" + bc.getBudget_category_status() + "'," + bc.getBudget_type_id() + ")";
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean UpdateBudgetCategory(BudgetCategory bc) {
        boolean ret = false;
        try {
            String query = "UPDATE e_budget.budget_category "
                    + "SET budget_category_name = '" + bc.budget_category_name + "',"
                    + "budget_category_status = '" + bc.getBudget_category_status() + "',"
                    + "budget_type_id = " + bc.budget_type_id + " "
                    + "WHERE budget_category_id = " + bc.getBudget_category_id();
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean DeleteBudgetCategory(BudgetCategory bc) {
        boolean ret = false;
        try {
            String query = "DELETE FROM e_budget.budget_category WHERE budget_category_id = " + bc.getBudget_category_id();
            DB2Manager mm = new DB2Manager();
            ret = mm.Excute(query);
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public boolean CheckingUsage(BudgetCategory bc) {
        boolean ret = true;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "SELECT COUNT(*) cc FROM  e_budget.receive_budget WHERE budget_category_id = " + bc.getBudget_category_id();
            ResultSet rsl = mm.GetDataAsResultSet(query);
            while (rsl.next()) {
                if (rsl.getInt("cc") > 0) {
                    ret = false;
                } else {
                    ret = true;
                }
            }
            query = "SELECT COUNT(*) cc FROM e_budget.disbursement_category WHERE budget_category_id=" + bc.getBudget_category_id();
            rsl = mm.GetDataAsResultSet(query);
            while (rsl.next()) {
                if (rsl.getInt("cc") > 0) {
                    ret = false;
                } else {
                    ret = true;
                }
            }
            rsl.close();
            mm.closeConnection();
        } catch (Exception ex) {
            ret = false;
        }
        return ret;
    }

    public String getBudget_category_id() {
        return budget_category_id;
    }

    public void setBudget_category_id(String budget_category_id) {
        this.budget_category_id = budget_category_id;
    }

    public String getBudget_category_name() {
        return budget_category_name;
    }

    public void setBudget_category_name(String budget_category_name) {
        this.budget_category_name = budget_category_name;
    }

    public String getBudget_category_status() {
        return budget_category_status;
    }

    public void setBudget_category_status(String budget_category_status) {
        this.budget_category_status = budget_category_status;
    }

    public String getBudget_type_id() {
        return budget_type_id;
    }

    public void setBudget_type_id(String budget_type_id) {
        this.budget_type_id = budget_type_id;
    }

}
