package rd.ebudget.object.lookup.budget;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.EMarketDataModal;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.EMarketColorStatus;

public class GetEmarketDataModal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Accessories acc = new Accessories();
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = null;
            if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                String query = "SELECT * FROM e_budget.project p WHERE p.project_id='" + request.getParameter("project_id") + "'";
                rs = dbms.GetDataAsResultSet(query);
                EMarketDataModal em = null;
                if (rs.next()) {
                    em = new EMarketDataModal();
                    em.setProject_id(request.getParameter("project_id"));
                    em.setProject_name(rs.getString("project_name"));
                    query = "SELECT * FROM e_budget.e_market_result WHERE project_id='" + request.getParameter("project_id") + "'";
                    ResultSet rx = dbms.GetDataAsResultSet(query);
                    if(rx.next()){
                        if(acc.IsNullToEmtyString(rx.getString("contest_announcement_step1_date")).isEmpty()){
                            em.setContest_announcement_step1_date("-");
                        }else{
                            em.setContest_announcement_step1_date(acc.GetThaiDate(rx.getString("contest_announcement_step1_date")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("contest_announcement_step2_date")).isEmpty()){
                            em.setContest_announcement_step2_date("-");
                        }else{
                            em.setContest_announcement_step2_date(acc.GetThaiDate(rx.getString("contest_announcement_step2_date")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("contest_announcement_step3_date")).isEmpty()){
                            em.setContest_announcement_step3_date("-");
                        }else{
                            em.setContest_announcement_step3_date(acc.GetThaiDate(rx.getString("contest_announcement_step3_date")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("contest_announcement_step4_startdate")).isEmpty()){
                            em.setContest_announcement_step4_startdate("-");
                        }else{
                            em.setContest_announcement_step4_startdate(acc.GetThaiDate(rx.getString("contest_announcement_step4_startdate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("contest_announcement_step4_enddate")).isEmpty()){
                            em.setContest_announcement_step4_enddate("-");
                        }else{
                            em.setContest_announcement_step4_enddate(acc.GetThaiDate(rx.getString("contest_announcement_step4_enddate")));
                        }
                        
                        if(acc.IsNullToEmtyString(rx.getString("open_envelope_step1_date")).isEmpty()){
                            em.setOpen_envelope_step1_date("-");
                        }else{
                            em.setOpen_envelope_step1_date(acc.GetThaiDate(rx.getString("open_envelope_step1_date")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("open_envelope_step2_startdate")).isEmpty()){
                            em.setOpen_envelope_step2_startdate("-");
                        }else{
                            em.setOpen_envelope_step2_startdate(acc.GetThaiDate(rx.getString("open_envelope_step2_startdate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("open_envelope_step2_enddate")).isEmpty()){
                            em.setOpen_envelope_step2_enddate("-");
                        }else{
                            em.setOpen_envelope_step2_enddate(acc.GetThaiDate(rx.getString("open_envelope_step2_enddate")));
                        }
                        
                        if(acc.IsNullToEmtyString(rx.getString("approve_step1_startdate")).isEmpty()){
                            em.setApprove_step1_startdate("-");
                        }else{
                            em.setApprove_step1_startdate(acc.GetThaiDate(rx.getString("approve_step1_startdate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step1_enddate")).isEmpty()){
                            em.setApprove_step1_enddate("-");
                        }else{
                            em.setApprove_step1_enddate(acc.GetThaiDate(rx.getString("approve_step1_enddate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step2_startdate")).isEmpty()){
                            em.setApprove_step2_startdate("-");
                        }else{
                            em.setApprove_step2_startdate(acc.GetThaiDate(rx.getString("approve_step2_startdate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step2_enddate")).isEmpty()){
                            em.setApprove_step2_enddate("-");
                        }else{
                            em.setApprove_step2_enddate(acc.GetThaiDate(rx.getString("approve_step2_enddate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step3_date")).isEmpty()){
                            em.setApprove_step3_date("-");
                        }else{
                            em.setApprove_step3_date(acc.GetThaiDate(rx.getString("approve_step3_date")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step4_startdate")).isEmpty()){
                            em.setApprove_step4_startdate("-");
                        }else{
                            em.setApprove_step4_startdate(acc.GetThaiDate(rx.getString("approve_step4_startdate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step4_enddate")).isEmpty()){
                            em.setApprove_step4_enddate("-");
                        }else{
                            em.setApprove_step4_enddate(acc.GetThaiDate(rx.getString("approve_step4_enddate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step5_startdate")).isEmpty()){
                            em.setApprove_step5_startdate("-");
                        }else{
                            em.setApprove_step5_startdate(acc.GetThaiDate(rx.getString("approve_step5_startdate")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("approve_step5_enddate")).isEmpty()){
                            em.setApprove_step5_enddate("-");
                        }else{
                            em.setApprove_step5_enddate(acc.GetThaiDate(rx.getString("approve_step5_enddate")));
                        }
                        
                        if(acc.IsNullToEmtyString(rx.getString("sign_promise_date")).isEmpty()){
                            em.setSign_promise_date("-");
                        }else{
                            em.setSign_promise_date(acc.GetThaiDate(rx.getString("sign_promise_date")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("promise_number")).isEmpty()){
                            em.setPromise_number("-");
                        }else{
                            em.setPromise_number(acc.GetThaiDate(rx.getString("promise_number")));
                        }
                        if(acc.IsNullToEmtyString(rx.getString("promise_name")).isEmpty()){
                            em.setPromise_name("-");
                        }else{
                            em.setPromise_name(acc.GetThaiDate(rx.getString("promise_name")));
                        }
                    }
                    query = "SELECT * FROM e_budget.e_market_plan WHERE project_id='" + request.getParameter("project_id") + "'";
                    ResultSet rsx = dbms.GetDataAsResultSet(query);
                    if(rsx.next()){
                        if(acc.IsNullToEmtyString(rsx.getString("contest_announcement_start")).isEmpty()){
                            em.setContest_announcement_start("-");
                        }else{
                            em.setContest_announcement_start(acc.GetThaiDate(rsx.getString("contest_announcement_start")));
                        }
                        if(acc.IsNullToEmtyString(rsx.getString("contest_announcement_end")).isEmpty()){
                            em.setContest_announcement_end("-");
                        }else{
                            em.setContest_announcement_end(acc.GetThaiDate(rsx.getString("contest_announcement_end")));
                        }
                        
                        if(acc.IsNullToEmtyString(rsx.getString("open_envelope_start")).isEmpty()){
                            em.setOpen_envelope_start("-");
                        }else{
                            em.setOpen_envelope_start(acc.GetThaiDate(rsx.getString("open_envelope_start")));
                        }
                        if(acc.IsNullToEmtyString(rsx.getString("open_envelope_end")).isEmpty()){
                            em.setOpen_envelope_end("-");
                        }else{
                            em.setOpen_envelope_end(acc.GetThaiDate(rsx.getString("open_envelope_end")));
                        }
                        
                        if(acc.IsNullToEmtyString(rsx.getString("approve_start")).isEmpty()){
                            em.setApprove_start("-");
                        }else{
                            em.setApprove_start(acc.GetThaiDate(rsx.getString("approve_start")));
                        }
                        if(acc.IsNullToEmtyString(rsx.getString("approve_end")).isEmpty()){
                            em.setApprove_end("-");
                        }else{
                            em.setApprove_end(acc.GetThaiDate(rsx.getString("approve_end")));
                        }
                        
                        if(acc.IsNullToEmtyString(rsx.getString("sign_promise_start")).isEmpty()){
                            em.setSign_promise_start("-");
                        }else{
                            em.setSign_promise_start(acc.GetThaiDate(rsx.getString("sign_promise_start")));
                        }
                        if(acc.IsNullToEmtyString(rsx.getString("sign_promise_end")).isEmpty()){
                            em.setSign_promise_end("-");
                        }else{
                            em.setSign_promise_end(acc.GetThaiDate(rsx.getString("sign_promise_end")));
                        }
                    }
                    query = "SELECT * FROM e_budget.term_of_payment_plan WHERE project_id = '" + request.getParameter("project_id") + "'";
                    ResultSet pr = dbms.GetDataAsResultSet(query);
                    String ret = "";
                    while(pr.next()){
                        query = "SELECT * FROM e_budget.term_of_payment_result WHERE project_id = '" + request.getParameter("project_id") + "' AND term_of_payment_id="+pr.getString("term_of_payment_plan_id");
                        rs = dbms.GetDataAsResultSet(query);
                        if(rs.next()){
                            ret += "<tr>"
                                    + "<td rowspan='2' class='center'>งวดที่ "+pr.getString("term_of_payment_plan_id")+"</td>"
                                    + "<td class='center'> แผน </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_deliver_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_check_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_approve_payment_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_payment_date"))+" </td>"
                                    + "<td class='center'> "+acc.NumberFormat(pr.getDouble("term_of_payment_plan_budget"),"#,###.##")+" </td>"
                                    + "</tr>";
                            ret += "</tr>"
                                    + "<td class='center'> รายละเอียดการดำเนินการ </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(rs.getString("term_of_payment_result_deliver_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(rs.getString("term_of_payment_result_check_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(rs.getString("term_of_payment_result_approve_payment_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(rs.getString("term_of_payment_result_payment_date"))+" </td>"
                                    + "<td class='center'> "+acc.NumberFormat(rs.getDouble("term_of_payment_result_budget"),"#,###.##")+" </td>"
                                    + "</tr>";
                            em.setPeroid(ret);
                        }else{
                            ret += "<tr>"
                                    + "<td rowspan='2' class='center'>งวดที่ "+pr.getString("term_of_payment_plan_id")+"</td>"
                                    + "<td class='center'> แผน </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_deliver_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_check_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_approve_payment_date"))+" </td>"
                                    + "<td class='center'> "+acc.GetThaiDate(pr.getString("term_of_payment_plan_payment_date"))+" </td>"
                                    + "<td class='center'> "+acc.NumberFormat(pr.getDouble("term_of_payment_plan_budget"),"#,###.##")+" </td>"
                                    + "</tr>";
                            ret += "</tr>"
                                    + "<td class='center'> รายละเอียดการดำเนินการ </td>"
                                    + "<td class='center'></td>"
                                    + "<td class='center'></td>"
                                    + "<td class='center'></td>"
                                    + "<td class='center'></td>"
                                    + "<td class='center'></td>"
                                    + "</tr>";
                            em.setPeroid(ret);
                        }
                    }
                }
                rs.close();
                Gson gson = new Gson();
                out.print(gson.toJson(em));
                out.flush();
                out.close();
                dbms.closeConnection();
            }

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
