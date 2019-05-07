
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.SelectionMethodResult;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

public class SelectionMethodResultServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            String method = request.getParameter("slmr[METHOD]");
            boolean ret = false;
            if(method.equals("INSERT")){
                SelectionMethodResult smr = new SelectionMethodResult();
                smr.setProject_id(request.getParameter("slmr[project_id]"));
                smr.setInvitation_announcement_step1_date(acc.IsNullToEmtyString(request.getParameter("slmr[invitation_announcement_step1_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[invitation_announcement_step1_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setInvitation_announcement_step2_date(acc.IsNullToEmtyString(request.getParameter("slmr[invitation_announcement_step2_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[invitation_announcement_step2_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setInvitation_announcement_step3_date(acc.IsNullToEmtyString(request.getParameter("slmr[invitation_announcement_step3_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[invitation_announcement_step3_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setInvitation_announcement_step4_startdate(acc.IsNullToEmtyString(request.getParameter("slmr[invitation_announcement_step4_startdate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[invitation_announcement_step4_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setInvitation_announcement_step4_enddate(acc.IsNullToEmtyString(request.getParameter("slmr[invitation_announcement_step4_enddate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[invitation_announcement_step4_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setBoard_review_step1_date(acc.IsNullToEmtyString(request.getParameter("slmr[board_review_step1_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[board_review_step1_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setBoard_review_step2_startdate(acc.IsNullToEmtyString(request.getParameter("slmr[board_review_step2_startdate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[board_review_step2_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setBoard_review_step2_enddate(acc.IsNullToEmtyString(request.getParameter("slmr[board_review_step2_enddate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[board_review_step2_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setBoard_review_step3_date(acc.IsNullToEmtyString(request.getParameter("slmr[board_review_step3_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[board_review_step3_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setApprove_step1_date(acc.IsNullToEmtyString(request.getParameter("slmr[approve_step1_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[approve_step1_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setApprove_step2_date(acc.IsNullToEmtyString(request.getParameter("slmr[approve_step2_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[approve_step2_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setApprove_step3_startdate(acc.IsNullToEmtyString(request.getParameter("slmr[approve_step3_startdate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[approve_step3_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setApprove_step3_enddate(acc.IsNullToEmtyString(request.getParameter("slmr[approve_step3_enddate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[approve_step3_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setApprove_step4_startdate(acc.IsNullToEmtyString(request.getParameter("slmr[approve_step4_startdate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[approve_step4_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setApprove_step4_enddate(acc.IsNullToEmtyString(request.getParameter("slmr[approve_step4_enddate]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[approve_step4_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setSign_promise_date(acc.IsNullToEmtyString(request.getParameter("slmr[sign_promise_date]")).isEmpty() ? "NULL":"'"+acc.ChageDateFormat(request.getParameter("slmr[sign_promise_date]"), "dd-MM-yyyy", "yyyy-MM-dd")+"'");
                smr.setPromise_number(acc.IsNullToEmtyString(request.getParameter("slmr[promise_number]")));
                smr.setPromise_name(acc.IsNullToEmtyString(request.getParameter("slmr[promise_name]")));
                ret = smr.InsertSelectionMethodResult(smr);
            }
            if(ret){
                out.write("TRUE");
            }else{
                out.write("TRUE");
            }
            out.flush();
            out.close();
        }catch(Exception ex){
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
