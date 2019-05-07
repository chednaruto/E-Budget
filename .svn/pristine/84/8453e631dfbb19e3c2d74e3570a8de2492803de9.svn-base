package rd.ebudget.prop;

import java.io.InputStream;
import java.util.Properties;
import rd.ebudget.object.DB2Properties;
import rd.ebudget.object.MysqlProperties;

public class PropertiesManagement {

    public MysqlProperties GetMysqlProperties() {
        MysqlProperties ret = null;
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream input = classLoader.getResourceAsStream("rd/ebudget/prop/ConfigFile.properties");
            Properties prop = new Properties();
            prop.load(input);
            ret = new MysqlProperties();
            ret.setDriver(prop.getProperty("jdbc.driver"));
            ret.setUrl(prop.getProperty("jdbc.url"));
            ret.setPort(prop.getProperty("jdbc.port"));
            ret.setDbname(prop.getProperty("jdbc.dbname"));
            ret.setUsername(prop.getProperty("jdbc.username"));
            ret.setPassword(prop.getProperty("jdbc.password"));
            input.close();
        } catch (Exception ex) {
        }
        return ret;
    }
    
    public DB2Properties GetDB2Properties(){
        DB2Properties ret = null;
        try{
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream input = classLoader.getResourceAsStream("rd/ebudget/prop/ConfigFile.properties");
            Properties prop = new Properties();
            prop.load(input);
            ret = new DB2Properties();
            ret.setDriver(prop.getProperty("db2.driver"));
            ret.setUrl(prop.getProperty("db2.url"));
            ret.setPort(prop.getProperty("db2.port"));
            ret.setDbname(prop.getProperty("db2.dbname"));
            ret.setUsername(prop.getProperty("db2.username"));
            ret.setPassword(prop.getProperty("db2.password"));
            input.close();
        }catch(Exception ex){
            
        }
        return ret;
    }
    public static void main(String arg[]) {
        PropertiesManagement pm = new PropertiesManagement();
        pm.GetDB2Properties();
    }
}
