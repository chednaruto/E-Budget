/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.EMarketResult;
import rd.ebudget.tools.Accessories;

public class EMarketResultServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = request.getParameter("e_marget_result[METHOD]");
            boolean ret = false;
            if (method.equals("INSERT")) {
                EMarketResult er = new EMarketResult();
                er.setProject_id(request.getParameter("e_marget_result[project_id]"));
                er.setContest_announcement_step1_date(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step1_date]")).isEmpty() ? "" : acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step1_date]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setContest_announcement_step2_date(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step2_date]")).isEmpty() ? "" : acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step2_date]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setContest_announcement_step3_date(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step3_date]")).isEmpty() ? "" : acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step3_date]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setContest_announcement_step4_startdate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step4_startdate]")).isEmpty() ? "" : acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step4_startdate]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setContest_announcement_step4_enddate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step4_enddate]")).isEmpty() ? "" : acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_result[contest_announcement_step4_enddate]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setOpen_envelope_step1_date(acc.IsNullToEmtyString(request.getParameter("e_marget_result[open_envelope_step1_date]")).isEmpty() ? "" : acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_result[open_envelope_step1_date]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setOpen_envelope_step2_startdate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[open_envelope_step2_startdate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[open_envelope_step2_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setOpen_envelope_step2_enddate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[open_envelope_step2_enddate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[open_envelope_step2_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step1_startdate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step1_startdate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step1_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step1_enddate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step1_enddate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step1_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step2_startdate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step2_startdate")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step2_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step2_enddate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step2_enddate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step2_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step3_date(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step3_date]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step3_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step4_startdate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step4_startdate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step4_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step4_enddate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step4_enddate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step4_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step5_startdate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step5_startdate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step5_startdate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setApprove_step5_enddate(acc.IsNullToEmtyString(request.getParameter("e_marget_result[approve_step5_enddate]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[approve_step5_enddate]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setSign_promise_date(acc.IsNullToEmtyString(request.getParameter("e_marget_result[sign_promise_date]")).isEmpty() ? "" : acc.ChageDateFormat(request.getParameter("e_marget_result[sign_promise_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                er.setPromise_number(acc.IsNullToEmtyString(request.getParameter("e_marget_result[promise_number]")));
                er.setPromise_name(acc.IsNullToEmtyString(request.getParameter("e_marget_result[promise_name]")));
                ret = er.InsertEMarketResult(er);
            } else if (method.equals("DELETE")) {
                EMarketResult er = new EMarketResult();
                er.setProject_id(request.getParameter("e_marget_result[project_id]"));
                ret = er.DeleteEMarketResult(er);
            }
            if(ret){
                out.print("TRUE");
            }else{
                out.print("FALSE");
            }
            out.flush();
            out.close();
        } catch (Exception ex) {

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
