package rd.ebudget.servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.EBiddingDataModal;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

public class GetEBiddingDataModal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = null;
            if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                String query = "SELECT * FROM e_budget.project p WHERE p.project_id='" + request.getParameter("project_id") + "'";
                rs = dbms.GetDataAsResultSet(query);
                EBiddingDataModal eb = null;
                if (rs.next()) {
                    eb = new EBiddingDataModal();
                    eb.setProject_id(request.getParameter("project_id"));
                    eb.setProject_name(rs.getString("project_name"));
                    query = "SELECT * FROM e_budget.e_bidding_result WHERE project_id='" + request.getParameter("project_id") + "'";
                    ResultSet rx = dbms.GetDataAsResultSet(query);
                    if (rx.next()) {
                        if (acc.IsNullToEmtyString(rx.getString("draf_tor_step1_date")).isEmpty()) {
                            eb.setDraf_tor_step1_date("-");
                        } else {
                            eb.setDraf_tor_step1_date(acc.GetThaiDate(rx.getString("draf_tor_step1_date")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("draf_tor_step2_date")).isEmpty()) {
                            eb.setDraf_tor_step2_date("-");
                        } else {
                            eb.setDraf_tor_step2_date(acc.GetThaiDate(rx.getString("draf_tor_step2_date")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("draf_tor_step3_date")).isEmpty()) {
                            eb.setDraf_tor_step3_date("-");
                        } else {
                            eb.setDraf_tor_step3_date(acc.GetThaiDate(rx.getString("draf_tor_step3_date")));
                        }
                        query = "SELECT * FROM e_budget.e_bidding_result_tor_loop WHERE project_id = '" + request.getParameter("project_id") + "' ORDER BY e_bidding_result_tor_loop_id ASC";

                        ResultSet torLopp = dbms.GetDataAsResultSet(query);
                        String ret = "";
                        int i = 1;
                        while (torLopp.next()) {
                            if (!acc.IsNullToEmtyString(torLopp.getString("e_bidding_result_tor_loop_step1_enddate")).isEmpty()) {
                                ret += "<div class='profile-info-row'>\n"
                                        + " <div class='profile-info-name' style='width: 230px;'> ลงประกาศร่าง (ครั้งที่ " + torLopp.getString("e_bidding_result_tor_loop_id") + ") </div>\n"
                                        + " <div class='profile-info-value'>\n"
                                        + " <span class='editable editable-click'> " + acc.GetThaiDate(torLopp.getString("e_bidding_result_tor_loop_step1_startdate")) + " ถึง " + acc.GetThaiDate(torLopp.getString("e_bidding_result_tor_loop_step1_enddate")) + " </span>\n"
                                        + " </div>\n"
                                        + " </div>\n";
                            } else {
                                ret += "<div class='profile-info-row'>\n"
                                        + " <div class='profile-info-name' style='width: 230px;'> ลงประกาศร่าง (ครั้งที่ 1) </div>\n"
                                        + " <div class='profile-info-value'>\n"
                                        + " <span class='editable editable-click'>  </span>\n"
                                        + " </div>\n"
                                        + " </div>\n";
                            }

                            if (acc.IsNullToEmtyString(torLopp.getString("e_bidding_result_tor_loop_step2_status")).contains("Y")) {
                                String step3 = "-";
                                String step4 = "-";
                                String step5Sataus = "";
                                if (!acc.IsNullToEmtyString(torLopp.getString("e_bidding_result_tor_loop_step3_date")).isEmpty()) {
                                    step3 = acc.GetThaiDate(torLopp.getString("e_bidding_result_tor_loop_step3_date"));
                                }
                                if (!acc.IsNullToEmtyString(torLopp.getString("e_bidding_result_tor_loop_step4_date")).isEmpty()) {
                                    step4 = acc.GetThaiDate(torLopp.getString("e_bidding_result_tor_loop_step4_date"));
                                }
                                if (acc.IsNullToEmtyString(torLopp.getString("e_bidding_result_tor_loop_step5_status")).contains("N")) {
                                    step4 = "เสนอยืน";
                                } else {
                                    step4 += " เสนอปรับปรุงร่าง วันที่ ";
                                    if (!acc.IsNullToEmtyString(torLopp.getString("e_bidding_result_tor_loop_step5_date")).isEmpty()) {
                                        step4 += acc.GetThaiDate(torLopp.getString("e_bidding_result_tor_loop_step5_date"));;
                                    } else {
                                        step4 += "-";
                                    }
                                }
                                ret += "<div class='profile-info-row'>\n"
                                        + "<div class='profile-info-name' style='width: 230px;'> รายละเอียดวิจารณ์ </div>\n"
                                        + "<div class='profile-info-value'>\n"
                                        + "<span class='editable editable-click'> มีผู้วิจารย์ " + torLopp.getString("e_bidding_result_tor_loop_step2_desc") + " ส่งรายละเอียดให้คณะกรรมการ ฯ วันที่ " + step3 + " </span>\n"
                                        + "</div>\n"
                                        + "</div>\n";
                                ret += "<div class='profile-info-row'>\n"
                                        + "<div class='profile-info-name' style='width: 230px;'> คณะกรรมการ ฯ รายงานผลการวิจารณ์ </div>\n"
                                        + "<div class='profile-info-value'>\n"
                                        + "<span class='editable editable-click'> วันที่ " + step4 + "  </span>\n"
                                        + "</div>\n"
                                        + "</div>\n";
                            } else {
                                ret += "<div class='profile-info-row'>\n"
                                        + "<div class='profile-info-name' style='width: 230px;'> รายละเอียดวิจารณ์ </div>\n"
                                        + "<div class='profile-info-value'>\n"
                                        + "<span class='editable editable-click'> ไม่มีผู้วิจารย์ </span>\n"
                                        + "</div>\n"
                                        + "</div>\n";
                            }

                        }
                        if (ret.isEmpty()) {
                            ret += "<div class='profile-info-row'>\n"
                                    + " <div class='profile-info-name' style='width: 230px;'> ลงประกาศร่าง (ครั้งที่ 1) </div>\n"
                                    + " <div class='profile-info-value'>\n"
                                    + " <span class='editable editable-click'>  </span>\n"
                                    + " </div>\n"
                                    + " </div>\n"
                                    + "<div class='profile-info-row'>\n"
                                    + "<div class='profile-info-name' style='width: 230px;'> รายละเอียดวิจารณ์ </div>\n"
                                    + "<div class='profile-info-value'>\n"
                                    + "<span class='editable editable-click'> </span>\n"
                                    + "</div>\n"
                                    + "</div>";
                        }
                        eb.setE_bidding_result_tor_loop(ret);
                        torLopp.close();

                        if (acc.IsNullToEmtyString(rx.getString("approve_tor_step1_date")).isEmpty()) {
                            eb.setApprove_tor_step1_date("-");
                        } else {
                            eb.setApprove_tor_step1_date(acc.GetThaiDate(rx.getString("approve_tor_step1_date")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_tor_step2_date")).isEmpty()) {
                            eb.setApprove_tor_step2_date("-");
                        } else {
                            eb.setApprove_tor_step2_date(acc.GetThaiDate(rx.getString("approve_tor_step2_date")));
                        }

                        if (acc.IsNullToEmtyString(rx.getString("contest_announcement_step1_startdate")).isEmpty()) {
                            eb.setContest_announcement_step1_startdate("-");
                        } else {
                            eb.setContest_announcement_step1_startdate(acc.GetThaiDate(rx.getString("contest_announcement_step1_startdate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("contest_announcement_step1_enddate")).isEmpty()) {
                            eb.setContest_announcement_step1_enddate("-");
                        } else {
                            eb.setContest_announcement_step1_enddate(acc.GetThaiDate(rx.getString("contest_announcement_step1_enddate")));
                        }

                        if (acc.IsNullToEmtyString(rx.getString("open_envelope_step1_date")).isEmpty()) {
                            eb.setOpen_envelope_step1_date("-");
                        } else {
                            eb.setOpen_envelope_step1_date(acc.GetThaiDate(rx.getString("open_envelope_step1_date")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("open_envelope_step2_startdate")).isEmpty()) {
                            eb.setOpen_envelope_step2_startdate("-");
                        } else {
                            eb.setOpen_envelope_step2_startdate(acc.GetThaiDate(rx.getString("open_envelope_step2_startdate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("open_envelope_step2_enddate")).isEmpty()) {
                            eb.setOpen_envelope_step2_enddate("-");
                        } else {
                            eb.setOpen_envelope_step2_enddate(acc.GetThaiDate(rx.getString("open_envelope_step2_enddate")));
                        }

                        if (acc.IsNullToEmtyString(rx.getString("approve_step1_startdate")).isEmpty()) {
                            eb.setApprove_step1_startdate("-");
                        } else {
                            eb.setApprove_step1_startdate(acc.GetThaiDate(rx.getString("approve_step1_startdate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step1_enddate")).isEmpty()) {
                            eb.setApprove_step1_enddate("-");
                        } else {
                            eb.setApprove_step1_enddate(acc.GetThaiDate(rx.getString("approve_step1_enddate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step2_startdate")).isEmpty()) {
                            eb.setApprove_step2_startdate("-");
                        } else {
                            eb.setApprove_step2_startdate(acc.GetThaiDate(rx.getString("approve_step2_startdate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step2_enddate")).isEmpty()) {
                            eb.setApprove_step2_enddate("-");
                        } else {
                            eb.setApprove_step2_enddate(acc.GetThaiDate(rx.getString("approve_step2_enddate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step3_date")).isEmpty()) {
                            eb.setApprove_step3_date("-");
                        } else {
                            eb.setApprove_step3_date(acc.GetThaiDate(rx.getString("approve_step3_date")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step4_startdate")).isEmpty()) {
                            eb.setApprove_step4_startdate("-");
                        } else {
                            eb.setApprove_step4_startdate(acc.GetThaiDate(rx.getString("approve_step4_startdate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step4_enddate")).isEmpty()) {
                            eb.setApprove_step4_enddate("-");
                        } else {
                            eb.setApprove_step4_enddate(acc.GetThaiDate(rx.getString("approve_step4_enddate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step5_startdate")).isEmpty()) {
                            eb.setApprove_step5_startdate("-");
                        } else {
                            eb.setApprove_step5_startdate(acc.GetThaiDate(rx.getString("approve_step5_startdate")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("approve_step5_enddate")).isEmpty()) {
                            eb.setApprove_step5_enddate("-");
                        } else {
                            eb.setApprove_step5_enddate(acc.GetThaiDate(rx.getString("approve_step5_enddate")));
                        }

                        if (acc.IsNullToEmtyString(rx.getString("sign_promise_date")).isEmpty()) {
                            eb.setSign_promise_date("-");
                        } else {
                            eb.setSign_promise_date(acc.GetThaiDate(rx.getString("sign_promise_date")));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("promise_number")).isEmpty()) {
                            eb.setPromise_number("-");
                        } else {
                            eb.setPromise_number(rx.getString("promise_number"));
                        }
                        if (acc.IsNullToEmtyString(rx.getString("promise_name")).isEmpty()) {
                            eb.setPromise_name("-");
                        } else {
                            eb.setPromise_name(rx.getString("promise_name"));
                        }

                        query = "SELECT * FROM e_budget.e_bidding_plan WHERE project_id='" + request.getParameter("project_id") + "'";
                        ResultSet rsx = dbms.GetDataAsResultSet(query);
                        if (rsx.next()) {
                            if (acc.IsNullToEmtyString(rsx.getString("draf_tor_start")).isEmpty()) {
                                eb.setDraf_tor_start("-");
                            } else {
                                eb.setDraf_tor_start(acc.GetThaiDate(rsx.getString("draf_tor_start")));
                            }
                            if (acc.IsNullToEmtyString(rsx.getString("draf_tor_end")).isEmpty()) {
                                eb.setDraf_tor_end("-");
                            } else {
                                eb.setDraf_tor_end(acc.GetThaiDate(rsx.getString("draf_tor_end")));
                            }

                            if (acc.IsNullToEmtyString(rsx.getString("approve_tor_start")).isEmpty()) {
                                eb.setApprove_tor_start("-");
                            } else {
                                eb.setApprove_tor_start(acc.GetThaiDate(rsx.getString("approve_tor_start")));
                            }
                            if (acc.IsNullToEmtyString(rsx.getString("approve_tor_end")).isEmpty()) {
                                eb.setApprove_tor_end("-");
                            } else {
                                eb.setApprove_tor_end(acc.GetThaiDate(rsx.getString("approve_tor_end")));
                            }

                            if (acc.IsNullToEmtyString(rsx.getString("contest_announcement_start")).isEmpty()) {
                                eb.setContest_announcement_start("-");
                            } else {
                                eb.setContest_announcement_start(acc.GetThaiDate(rsx.getString("contest_announcement_start")));
                            }
                            if (acc.IsNullToEmtyString(rsx.getString("contest_announcement_end")).isEmpty()) {
                                eb.setContest_announcement_end("-");
                            } else {
                                eb.setContest_announcement_end(acc.GetThaiDate(rsx.getString("contest_announcement_end")));
                            }

                            if (acc.IsNullToEmtyString(rsx.getString("open_envelope_start")).isEmpty()) {
                                eb.setOpen_envelope_start("-");
                            } else {
                                eb.setOpen_envelope_start(acc.GetThaiDate(rsx.getString("open_envelope_start")));
                            }
                            if (acc.IsNullToEmtyString(rsx.getString("open_envelope_end")).isEmpty()) {
                                eb.setOpen_envelope_end("-");
                            } else {
                                eb.setOpen_envelope_end(acc.GetThaiDate(rsx.getString("open_envelope_end")));
                            }

                            if (acc.IsNullToEmtyString(rsx.getString("approve_start")).isEmpty()) {
                                eb.setApprove_start("-");
                            } else {
                                eb.setApprove_start(acc.GetThaiDate(rsx.getString("approve_start")));
                            }
                            if (acc.IsNullToEmtyString(rsx.getString("approve_end")).isEmpty()) {
                                eb.setApprove_end("-");
                            } else {
                                eb.setApprove_end(acc.GetThaiDate(rsx.getString("approve_end")));
                            }

                            if (acc.IsNullToEmtyString(rsx.getString("sign_promise_start")).isEmpty()) {
                                eb.setSign_promise_start("-");
                            } else {
                                eb.setSign_promise_start(acc.GetThaiDate(rsx.getString("sign_promise_start")));
                            }
                            if (acc.IsNullToEmtyString(rsx.getString("sign_promise_end")).isEmpty()) {
                                eb.setSign_promise_end("-");
                            } else {
                                eb.setSign_promise_end(acc.GetThaiDate(rsx.getString("sign_promise_end")));
                            }
                        }
                        query = "SELECT * FROM e_budget.term_of_payment_plan WHERE project_id = '" + request.getParameter("project_id") + "'";
                        ResultSet pr = dbms.GetDataAsResultSet(query);
                        ret = "";
                        while (pr.next()) {
                            query = "SELECT * FROM e_budget.term_of_payment_result WHERE project_id = '" + request.getParameter("project_id") + "' AND term_of_payment_id=" + pr.getString("term_of_payment_plan_id");
                            rs = dbms.GetDataAsResultSet(query);
                            if (rs.next()) {
                                ret += "<tr>"
                                        + "<td rowspan='2' class='center'>งวดที่ " + pr.getString("term_of_payment_plan_id") + "</td>"
                                        + "<td class='center'> แผน </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_deliver_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_check_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_approve_payment_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_payment_date")) + " </td>"
                                        + "<td class='center'> " + acc.NumberFormat(pr.getDouble("term_of_payment_plan_budget"), "#,###.##") + " </td>"
                                        + "</tr>";
                                ret += "</tr>"
                                        + "<td class='center'> รายละเอียดการดำเนินการ </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(rs.getString("term_of_payment_result_deliver_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(rs.getString("term_of_payment_result_check_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(rs.getString("term_of_payment_result_approve_payment_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(rs.getString("term_of_payment_result_payment_date")) + " </td>"
                                        + "<td class='center'> " + acc.NumberFormat(rs.getDouble("term_of_payment_result_budget"), "#,###.##") + " </td>"
                                        + "</tr>";
                                eb.setPeroid(ret);
                            } else {
                                ret += "<tr>"
                                        + "<td rowspan='2' class='center'>งวดที่ " + pr.getString("term_of_payment_plan_id") + "</td>"
                                        + "<td class='center'> แผน </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_deliver_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_check_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_approve_payment_date")) + " </td>"
                                        + "<td class='center'> " + acc.GetThaiDate(pr.getString("term_of_payment_plan_payment_date")) + " </td>"
                                        + "<td class='center'> " + acc.NumberFormat(pr.getDouble("term_of_payment_plan_budget"), "#,###.##") + " </td>"
                                        + "</tr>";
                                ret += "</tr>"
                                        + "<td class='center'> รายละเอียดการดำเนินการ </td>"
                                        + "<td class='center'></td>"
                                        + "<td class='center'></td>"
                                        + "<td class='center'></td>"
                                        + "<td class='center'></td>"
                                        + "<td class='center'></td>"
                                        + "</tr>";
                                eb.setPeroid(ret);
                            }
                        }
                    } else {
                        eb.setDraf_tor_step1_date("-");
                        eb.setDraf_tor_step2_date("-");
                        eb.setDraf_tor_step3_date("-");
                        String ret = "<div class='profile-info-row'>\n"
                                + " <div class='profile-info-name' style='width: 230px;'> ลงประกาศร่าง (ครั้งที่ 1) </div>\n"
                                + " <div class='profile-info-value'>\n"
                                + " <span class='editable editable-click'>  </span>\n"
                                + " </div>\n"
                                + " </div>\n"
                                + "<div class='profile-info-row'>\n"
                                + "<div class='profile-info-name' style='width: 230px;'> รายละเอียดวิจารณ์ </div>\n"
                                + "<div class='profile-info-value'>\n"
                                + "<span class='editable editable-click'> </span>\n"
                                + "</div>\n"
                                + "</div>";

                        eb.setE_bidding_result_tor_loop(ret);
                        eb.setApprove_tor_step1_date("-");
                        eb.setApprove_tor_step2_date("-");
                    }

                }
                rs.close();
                Gson gson = new Gson();
                System.out.println(gson.toJson(eb));
                out.print(gson.toJson(eb));
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
