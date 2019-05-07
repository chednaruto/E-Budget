package rd.ebudget.object.lookup.budget;

import java.sql.ResultSet;
import rd.ebudget.tools.DB2Manager;

public class BudgetType {

    private String budget_type_id;
    private String budget_type_name;
    private String budget_type_status;

    public boolean InsertBudgetType(BudgetType bt) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "INSERT INTO e_budget.budget_type(budget_type_name,budget_type_status) "
                    + "VALUES('" + bt.getBudget_type_name() + "','" + bt.getBudget_type_status() + "')";

            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean UpdateBudgetType(BudgetType bt) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "UPDATE e_budget.budget_type " 
                    + "SET budget_type_name='"+bt.getBudget_type_name()+"',budget_type_status='"+bt.getBudget_type_status()+"' "
                    + "WHERE budget_type_id = "+bt.getBudget_type_id();
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean DeleteBudgetType(BudgetType bt) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "DELETE FROM e_budget.budget_type WHERE budget_type_id=" + bt.getBudget_type_id();
            ret = mm.Excute(query);
            mm.closeConnection();
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean CheckingUsage(BudgetType bt) {
        boolean ret = true;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "SELECT COUNT(*) as cc  FROM  e_budget.budget_category WHERE budget_type_id=" + bt.getBudget_type_id();
            ResultSet rsl = mm.GetDataAsResultSet(query);

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

    public String getBudget_type_id() {
        return budget_type_id;
    }

    public void setBudget_type_id(String budget_type_id) {
        this.budget_type_id = budget_type_id;
    }

    public String getBudget_type_name() {
        return budget_type_name;
    }

    public void setBudget_type_name(String budget_type_name) {
        this.budget_type_name = budget_type_name;
    }

    /**
     * @return the budget_type_status
     */
    public String getBudget_type_status() {
        return budget_type_status;
    }

    /**
     * @param budget_type_status the budget_type_status to set
     */
    public void setBudget_type_status(String budget_type_status) {
        this.budget_type_status = budget_type_status;
    }
}
