package rd.ebudget.object.lookup.Gov;

import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class GovernmentPolicy {

    private String government_policy_id;
    private String government_policy_name;
    private String government_policy_status;

    public boolean InsertGovernmentPolicy(GovernmentPolicy gp) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "INSERT INTO e_budget.government_policy(government_policy_name,government_policy_status) "
                    + "VALUES('"+gp.getGovernment_policy_name()+"','"+gp.getGovernment_policy_status()+"')";
            ret = mm.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }
    
    public boolean UpdateGovernmentPolicy(GovernmentPolicy gp) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "UPDATE e_budget.government_policy "
                    + "SET government_policy_name='"+gp.getGovernment_policy_name()+"',"
                    + "government_policy_status='"+gp.getGovernment_policy_status()+"' "
                    + "WHERE government_policy_id="+gp.getGovernment_policy_id();
            ret = mm.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }
    
    public boolean DeleteGovernmentPolicy(GovernmentPolicy gp) {
        boolean ret = false;
        try {
            DB2Manager mm = new DB2Manager();
            String query = "DELETE FROM e_budget.government_policy WHERE government_policy_id="+gp.getGovernment_policy_id();
            ret = mm.Excute(query);
        } catch (Exception ex) {

        }
        return ret;
    }

    public String getGovernment_policy_id() {
        return government_policy_id;
    }

    public void setGovernment_policy_id(String government_policy_id) {
        this.government_policy_id = government_policy_id;
    }

    public String getGovernment_policy_name() {
        return government_policy_name;
    }

    public void setGovernment_policy_name(String government_policy_name) {
        this.government_policy_name = government_policy_name;
    }

    public String getGovernment_policy_status() {
        return government_policy_status;
    }

    public void setGovernment_policy_status(String government_policy_status) {
        this.government_policy_status = government_policy_status;
    }

}
