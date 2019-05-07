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
import rd.ebudget.object.lookup.budget.TranferBudget;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.EBudgetTools;

/**
 *
 * @author Mr.Tue
 */
public class TranferBudgetServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean ret = false;
        String error_status = "";
        EBudgetTools ebt = new EBudgetTools();
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = request.getParameter("tranfer_budget[METHOD]");
            if (method.equals("INSERT")) {
                TranferBudget tb = new TranferBudget();
                tb.setTranfer_budget_id(acc.IsNullToEmtyString(request.getParameter("tranfer_budget[tranfer_budget_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("tranfer_budget[tranfer_budget_id]")));
                tb.setFrom_officeid(request.getParameter("tranfer_budget[from_officeid]"));
                tb.setTo_officeid(request.getParameter("tranfer_budget[to_officeid]"));
                tb.setDisbursement_category_id(Integer.parseInt(request.getParameter("tranfer_budget[disbursement_category_id]")));
                tb.setBudget_total(Double.parseDouble(request.getParameter("tranfer_budget[budget_total]")));
                tb.setTranfer_budget_datetime(acc.ChageDateFormat(request.getParameter("tranfer_budget[tranfer_budget_datetime]"),"dd-MM-yyyy hh:mm:ss","yyyy-MM-dd hh:mm:ss"));
                if (tb.getTranfer_budget_id() != 0) {
                    ret = tb.UpdateTranferBudget(tb);
                } else {
                    if (ebt.CheckBalance(tb.getDisbursement_category_id(), request.getSession().getAttribute("E-Budget-OFFICEID").toString(), tb.getBudget_total())) {
                        ret = tb.InsertTranferBudget(tb);
                    } else {
                        error_status = "งบประมาณไม่พอทำรายการ";
                    }
                }
            }else if(method.equals("DELETE")){
                TranferBudget tb = new TranferBudget();
                tb.setTranfer_budget_id(acc.IsNullToEmtyString(request.getParameter("tranfer_budget[tranfer_budget_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("tranfer_budget[tranfer_budget_id]")));
                ret = tb.DeleteTranferBudget(tb);
            }
            if (ret) {
                out.print("TRUE");
            } else {
                out.print(error_status);
            }
            out.flush();
            out.close();
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
