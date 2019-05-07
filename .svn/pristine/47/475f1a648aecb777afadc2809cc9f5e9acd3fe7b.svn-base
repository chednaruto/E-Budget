
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.TermOfPaymentResult;
import rd.ebudget.tools.Accessories;

public class TermOfPaymentResultServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            boolean ret = false;
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            String method = request.getParameter("term_of_payment_result[METHOD]");
            if(method.equals("INSERT")){
                TermOfPaymentResult tr = new TermOfPaymentResult();
                tr.setProject_id(request.getParameter("term_of_payment_result[project_id]"));
                tr.setTerm_of_payment_id(Integer.parseInt(request.getParameter("term_of_payment_result[term_of_payment_id]")));
                tr.setTerm_of_payment_result_deliver_date(acc.ChageDateFormat(request.getParameter("term_of_payment_result[term_of_payment_result_deliver_date]"),"dd-MM-yyyy","yyyy-MM-dd"));
                tr.setTerm_of_payment_result_check_date(acc.ChageDateFormat(request.getParameter("term_of_payment_result[term_of_payment_result_check_date]"),"dd-MM-yyyy","yyyy-MM-dd"));
                tr.setTerm_of_payment_result_approve_date(acc.ChageDateFormat(request.getParameter("term_of_payment_result[term_of_payment_result_approve_date]"),"dd-MM-yyyy","yyyy-MM-dd"));
                tr.setTerm_of_payment_result_payment_date(acc.ChageDateFormat(request.getParameter("term_of_payment_result[term_of_payment_result_payment_date]"),"dd-MM-yyyy","yyyy-MM-dd"));
                tr.setDisbursement_id(Integer.parseInt(request.getParameter("term_of_payment_result[disbursement_id]")));
                tr.setTerm_of_payment_result_budget(Double.parseDouble(request.getParameter("term_of_payment_result[term_of_payment_result_budget]")));
                ret = tr.InsertTermOfPaymentResult(tr);
            }else if(method.equals("DELETE")){
                TermOfPaymentResult tr = new TermOfPaymentResult();
                tr.setProject_id(request.getParameter("term_of_payment_result[project_id]"));
                tr.setTerm_of_payment_id(Integer.parseInt(request.getParameter("term_of_payment_result[term_of_payment_id]")));
                ret = tr.DeleteTermOfPaymentResult(tr);
            }
                   
            if(ret){
                out.print("TRUE");
            }else{
                out.print("FALSE");
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
