package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.PaymentBudget;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.EBudgetTools;

public class PaymentBudgetServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            boolean ret = false;
            String error_status = "";
            EBudgetTools ebt = new EBudgetTools();
            String method = request.getParameter("payment_budget[METHOD]");
            if (method.equals("INSERT")) {
                PaymentBudget pb = new PaymentBudget();
                pb.setPayment_budget_id(acc.IsNullToEmtyString(request.getParameter("payment_budget[payment_budget_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("payment_budget[payment_budget_id]")));
                pb.setDisbursement_category_id(Integer.parseInt(request.getParameter("payment_budget[disbursement_category_id]")));
                String date_selection = acc.ChageDateFormat(request.getParameter("payment_budget[payment_budget_datetime]"), "dd-MM-yyyy hh:mm:ss", "yyyy-MM-dd hh:mm:ss");
                pb.setPayment_budget_datetime(date_selection);
                pb.setPayment_budget_total(Double.parseDouble(request.getParameter("payment_budget[payment_budget_total]")));
                pb.setOfficeid(request.getParameter("payment_budget[officeid]"));
                pb.setDisbursement_id(Integer.parseInt(request.getParameter("payment_budget[disbursement_id]")));
                if (pb.getPayment_budget_id() != 0) {
                    ret = pb.UpdatePaymentBudget(pb);
                } else {
                    if(ebt.CheckBalance(pb.getDisbursement_category_id(), request.getSession().getAttribute("E-Budget-OFFICEID").toString(), pb.getPayment_budget_total())){
                        ret = pb.InsertPaymentBudget(pb);
                    }else{
                        error_status = "งบประมาณไม่พอทำรายการ";
                    }
                }
            } else if (method.equals("DELETE")) {
                PaymentBudget pb = new PaymentBudget();
                pb.setPayment_budget_id(acc.IsNullToEmtyString(request.getParameter("payment_budget[payment_budget_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("payment_budget[payment_budget_id]")));
                ret = pb.DeletePaymentBudget(pb);
            }
            if(ret){
                out.print("TRUE");
            }else{
                out.print(error_status);
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
