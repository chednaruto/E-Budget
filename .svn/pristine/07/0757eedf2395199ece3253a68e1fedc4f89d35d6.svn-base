
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.EBiddingResultTorLoop;
import rd.ebudget.tools.Accessories;

public class TorLoopServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            boolean ret = false;
            String method = request.getParameter("tls[METHOD]");
            if(method.equals("INSERT")){
                EBiddingResultTorLoop tr = new EBiddingResultTorLoop();
                tr.setProject_id(request.getParameter("tls[project_id]"));
                tr.setE_bidding_result_tor_loop_id(acc.IsNullToEmtyString(request.getParameter("tls[e_bidding_result_tor_loop_id]")));
                tr.setE_bidding_result_tor_loop_step1_startdate(acc.IsNullToEmtyString(request.getParameter("tls[e_bidding_result_tor_loop_step1_startdate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("tls[e_bidding_result_tor_loop_step1_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                tr.setE_bidding_result_tor_loop_step1_enddate(acc.IsNullToEmtyString(request.getParameter("tls[e_bidding_result_tor_loop_step1_enddate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("tls[e_bidding_result_tor_loop_step1_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                tr.setE_bidding_result_tor_loop_step2_status(request.getParameter("tls[e_bidding_result_tor_loop_step2_status]"));
                tr.setE_bidding_result_tor_loop_step2_desc(request.getParameter("tls[e_bidding_result_tor_loop_step2_desc]"));
                tr.setE_bidding_result_tor_loop_step3_date(acc.IsNullToEmtyString(request.getParameter("tls[e_bidding_result_tor_loop_step3_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("tls[e_bidding_result_tor_loop_step3_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                tr.setE_bidding_result_tor_loop_step4_date(acc.IsNullToEmtyString(request.getParameter("tls[e_bidding_result_tor_loop_step4_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("tls[e_bidding_result_tor_loop_step4_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                tr.setE_bidding_result_tor_loop_step5_status(request.getParameter("tls[e_bidding_result_tor_loop_step5_status]"));
                tr.setE_bidding_result_tor_loop_step5_date(acc.IsNullToEmtyString(request.getParameter("tls[e_bidding_result_tor_loop_step5_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("tls[e_bidding_result_tor_loop_step5_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                tr.InsertEBiddingResultTorLoop(tr);
            }else{
                EBiddingResultTorLoop tr = new EBiddingResultTorLoop();
                ret = tr.DeleteEBiddingResultTorLoop(request.getParameter("tls[project_id]"));
            }
            if(ret){
                out.write("TRUE");
            }else{
                out.write("FALSE");
            }
            out.flush();
            out.close();
        }catch(Exception ex){
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
