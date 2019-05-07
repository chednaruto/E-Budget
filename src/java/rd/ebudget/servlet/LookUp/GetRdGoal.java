package rd.ebudget.servlet.LookUp;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Stack;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.Gov.RdGoal;
import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class GetRdGoal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String[] rd_strategic_id = request.getParameterValues("rd_strategic_id[]");
            String condition = "";
            for (int i = 0; i < rd_strategic_id.length; i++) {
                condition += rd_strategic_id[i] + ",";
            }
            condition = condition.substring(0, condition.length() - 1);
            String query = "SELECT * FROM e_budget.rd_goal WHERE rd_strategic_id IN(" + condition + ") AND rd_goal_status= 'Y'";
            DB2Manager mm = new DB2Manager();
            ResultSet rs = mm.GetDataAsResultSet(query);
            Vector<RdGoal> rdgoals = new Stack<>();
            RdGoal rdgoal;
            while (rs.next()) {
                rdgoal = new RdGoal();
                rdgoal.setRd_goal_id(rs.getString("rd_goal_id"));
                rdgoal.setRd_goal_name(rs.getString("rd_goal_name"));
                rdgoal.setRd_goal_status(rs.getString("rd_goal_status"));
                rdgoal.setRd_strategic_id(rs.getString("rd_strategic_id"));
                rdgoals.add(rdgoal);
            }
            mm.closeConnection();
            Gson gson = new Gson();
            out.print(gson.toJson(rdgoals));
            out.flush();
            out.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
