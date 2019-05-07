package rd.ebudget.servlet.LookUp;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.budget.DisbursementCategory;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class GetDisbursementCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String budget_category_id = acc.IsNullToEmtyString(request.getParameter("budget_category_id"));

            String query = "SELECT * FROM e_budget.disbursement_category WHERE disbursement_category_status='Y' AND budget_category_id=" + budget_category_id;
            DB2Manager mm = new DB2Manager();
            ResultSet rs = mm.GetDataAsResultSet(query);
            Vector<DisbursementCategory> dcs = new Vector<>();
            DisbursementCategory dc = null;
            try {
                while (rs.next()) {
                    dc = new DisbursementCategory();
                    dc.setDisbursement_category_id(acc.IsNullToEmtyString(rs.getString("disbursement_category_id")));
                    dc.setDisbursement_category_name(acc.IsNullToEmtyString(rs.getString("disbursement_category_name")));
                    dc.setDisbursement_category_status(acc.IsNullToEmtyString(rs.getString("disbursement_category_status")));
                    dc.setBudget_category_id(acc.IsNullToEmtyString(rs.getString("budget_category_id")));
                    dcs.add(dc);
                }
                Gson gson = new Gson();
                out.print(gson.toJson(dcs));
                out.flush();
                out.close();

                rs.close();
                mm.closeConnection();
            } catch (Exception ex) {

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
