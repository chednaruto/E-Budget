package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.Gov.MofStrategic;
import rd.ebudget.tools.Accessories;

public class MofStrategicServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            MofStrategic ms = new MofStrategic();
            String method = acc.IsNullToEmtyString(request.getParameter("mof_strategic[METHOD]"));
            boolean status = false;
            if (method.equals("INSERT")) {
                ms.setMof_strategic_id(acc.IsNullToEmtyString(request.getParameter("mof_strategic[mof_strategic_id]")));
                ms.setMof_strategic_name(acc.IsNullToEmtyString(request.getParameter("mof_strategic[mof_strategic_name]")));
                ms.setMof_strategic_status(acc.IsNullToEmtyString(request.getParameter("mof_strategic[mof_strategic_status]")));
                if (ms.getMof_strategic_id().isEmpty()) {
                    status = ms.InsertMofStrategic(ms);
                } else {
                    status = ms.UpdateMofStrategic(ms);
                }
            } else {
                ms.setMof_strategic_id(acc.IsNullToEmtyString(request.getParameter("mof_strategic[mof_strategic_id]")));
                status = ms.DeleteMofStrategic(ms);
            }
            if (status) {
                out.print("TRUE");
            } else {
                out.print("FALSE");
            }
            out.flush();
            out.close();
        } catch (Exception ex) {
            ex.printStackTrace();
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
