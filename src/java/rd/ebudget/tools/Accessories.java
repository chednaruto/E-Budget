package rd.ebudget.tools;

import java.security.Key;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

public class Accessories {

    public boolean IsNull(Object value) {
        return (value == null) ? (true) : (false);
    }

    public boolean IsEquals(Object ojb, String value) {
        return (ojb != null && ojb.equals(value)) ? (true) : (false);
    }

    public boolean IsEqualsInList(Object obj, String[] value) {
        boolean ret = false;
        if (obj != null) {
            for (int i = 0; i < value.length; i++) {
                if (value[i].equals(obj)) {
                    ret = true;
                }
            }
        } else {
            ret = false;
        }
        return ret;
    }

    public String IsNullToEmtyString(Object value) {
        return (value == null) ? "" : value.toString();
    }

    public String GetThaiDateTime(String strDateTime) {
        String ret = "";
        try {
            String Months[] = {"มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"};
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            int year = 0, month = 0, day = 0;
            Date date = df.parse(strDateTime);
            SimpleDateFormat sdf = new SimpleDateFormat(" HH:mm:ss");
            ret = sdf.format(date);
            Calendar c = Calendar.getInstance();
            c.setTime(date);
            year = c.get(Calendar.YEAR);
            month = c.get(Calendar.MONTH);
            day = c.get(Calendar.DATE);
            ret = String.format("%s %s %s เวลา %s", day, Months[month], year + 543, ret);
        } catch (Exception ex) {
            
        }
        return ret;
    }

    public String GetThaiDate(String strDate) {
        String ret = null;
        try {
            String Months[] = {"มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"};
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            int year = 0, month = 0, day = 0;
            Date date = df.parse(strDate);
            Calendar c = Calendar.getInstance();
            c.setTime(date);

            year = c.get(Calendar.YEAR);
            month = c.get(Calendar.MONTH);
            day = c.get(Calendar.DATE);
            ret = String.format("%s %s %s", day, Months[month], year + 543);
        } catch (Exception ex) {

        }
        return ret;
    }

    public String NumberFormat(Object value, String format) {
        String ret = null;
        try {
            DecimalFormat df = new DecimalFormat(format);
            ret = df.format(value);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }

    public void ListRequest(HttpServletRequest request) {
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            System.out.print(paramName + " : ");
            String[] paramValues = request.getParameterValues(paramName);
            for (int i = 0; i < paramValues.length; i++) {
                String paramValue = paramValues[i];
                System.out.println(paramValue);
            }
        }
    }

    public String Decryp(String encryptedText, String Textkey) {
        String DecrypText = "";
        try {
            byte[] KeyValue = Textkey.getBytes();
            Key key = new SecretKeySpec(KeyValue, "AES");
            Cipher chiper = Cipher.getInstance("AES");
            chiper.init(Cipher.DECRYPT_MODE, key);
            byte[] decordedValue = decode(encryptedText);
            byte[] decValue = chiper.doFinal(decordedValue);
            DecrypText = new String(decValue, "UTF-8");
        } catch (Exception ex) {

        }
        return DecrypText;
    }

    private static byte[] decode(String textString) {
        byte[] byteArray = new byte[(textString.length() / 2)];
        int intVal = 0;
        String frag = "";
        int c1 = 0;
        for (int i = 0; i < byteArray.length; i++) {
            c1 = (i * 2);
            frag = textString.substring(c1, (c1 + 2));
            intVal = Integer.parseInt(frag, 16);
            byteArray[i] = (byte) (0xff & intVal);
        }
        return byteArray;
    }

    public String encodeTIS620ToUTF8(String encoded) {
        String ret = "";
        try {

            ret = new String(encoded.getBytes("UTF-8"));
        } catch (Exception Ex) {

        }
        return ret;
    }

    public String getKey() {
        return "EBudgetxxxxxxxxx";
    }

    public String ChageDateFormat(String date, String formatOld, String formatNew) {
        String ret = "";
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(formatOld);
            Date d = formatter.parse(date);
            ret = new SimpleDateFormat(formatNew).format(d).toString();
        } catch (Exception ex) {
        }
        return ret;
    }

    public static String LPAD(int i) {
        return String.format("%03d", i);
    }
    
    public String GenerateProjectID(String officeid) {
        String ret = "";
        try {
            String query = "select max(p.project_id) as project_id from e_budget.project p where p.officeid='" + officeid + "'";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            if (rs.next()) {
                if (!IsNull(rs.getString("project_id"))) {
                    int project_id = Integer.parseInt(rs.getString("project_id").substring(8));
                    ret = officeid + LPAD(project_id + 1);
                } else {
                    ret = officeid + "001";
                }
            } else {
                ret = officeid + "001";
            }
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }

    public boolean CompareStrinDate(String minDate, String maxDate) {
        boolean ret = false;
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = format.parse(minDate);
            Date date2 = format.parse(maxDate);
            if (date1.compareTo(date2) <= 0) {
                ret = true;
            } else {
                ret = false;
            }
        } catch (Exception ex) {

        }
        return ret;
    }
}
