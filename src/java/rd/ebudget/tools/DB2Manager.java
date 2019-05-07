
package rd.ebudget.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import rd.ebudget.object.DB2Properties;
import rd.ebudget.object.MysqlProperties;
import rd.ebudget.prop.PropertiesManagement;

public class DB2Manager {
    private Connection conn;
    Statement st = null;
    ResultSet rs = null;
    
    private void SetConnection() {
        //db2
        PropertiesManagement pm = new PropertiesManagement();
         DB2Properties dp =  pm.GetDB2Properties();
        try {
            Class.forName(dp.getDriver());
            conn = DriverManager.getConnection(dp.getUrl() + ":" + dp.getPort() + "/" + dp.getDbname(),dp.getUsername(),dp.getPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        //mysql
        /*PropertiesManagement pm = new PropertiesManagement();
        MysqlProperties dp = pm.GetMysqlProperties();
        try{
            Class.forName(dp.getDriver());
            conn = DriverManager.getConnection(dp.getUrl() + ":" + dp.getPort() + "/" + dp.getDbname(),dp.getUsername(),dp.getPassword());
        }catch(Exception ex){
            
        }*/
        
    }
    
    public static void main(String []args){
        DB2Manager dbms = new DB2Manager();
        dbms.SetConnection();
    }
    public ResultSet GetDataAsResultSet(String query) {
        try {
            SetConnection();
            st = conn.createStatement();
            rs = st.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return rs;
    }
    
    public boolean Excute(String query){
        boolean ret = false;
        try{
            SetConnection();
            st = conn.createStatement();
            ret = !st.execute(query);
            closeConnection();
        }catch(Exception ex){
        }
        return ret;
    }
    
    public void closeConnection(){
        try{
            if(rs != null)
                rs.close();
            if(st != null)
                st.close();
            if(conn!= null)
                conn.close();
            
        }catch(Exception e){
        }
    }
}
