package rd.ebudget.tools;

import java.io.PrintWriter;
import java.sql.ResultSet;
import rd.ebudget.object.Budget.EBiddingResult;
import rd.ebudget.object.Budget.EMarketResult;

public class EBudgetTools {

    public boolean CheckBalance(int disbursement_category_id, String officeid, double total_budget) {
        boolean ret = false;
        try {
            String query = "SELECT bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,"
                    + "SUM(CASE WHEN t.tb_source IN('receive_budget','receive_tranfer_budget','receive_change_budget') THEN t.budget_total ELSE 0 END) receive_total,"
                    + "SUM(CASE WHEN t.tb_source IN('tranfer_budget','change_budget','allocate_budget') THEN t.budget_total ELSE 0 END) used_total,dc.disbursement_category_id,dc.disbursement_category_name "
                    + "FROM ( "
                    + " 	select 'receive_budget' as tb_source,"
                    + "    	TIMESTAMP(rb.budget_receive_date,'00:00:00') As transaction_datetime,"
                    + "    	'' AS detail,"
                    + "    	rb.budget_total,"
                    + "	rb.disbursement_category_id "
                    + "    	from e_budget.receive_budget rb "
                    + "    	where rb.officeid = '" + officeid + "' "
                    + "    	UNION "
                    + "    	select 'tranfer_budget' AS tb_source,"
                    + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                    + "    	of.officename AS detail,"
                    + "    	tb.budget_total,"
                    + "	tb.disbursement_category_id "
                    + "    	from e_budget.tranfer_budget tb "
                    + "    	left join e_budget.office of ON tb.to_officeid = of.officeid "
                    + "    	where tb.from_officeid = '" + officeid + "' "
                    + "    	UNION "
                    + "    	select 'receive_tranfer_budget' AS tb_source,"
                    + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                    + "    	of.officename as detail,"
                    + "    	tb.budget_total,"
                    + "	tb.disbursement_category_id "
                    + " 	from e_budget.tranfer_budget tb "
                    + "    	left join e_budget.office of ON tb.from_officeid = officeid "
                    + "    	where tb.to_officeid = '" + officeid + "' "
                    + "   	UNION"
                    + "    	select 'change_budget' AS tb_source,"
                    + "    	cb.change_budget_datetime AS transaction_datetime,"
                    + "    	bc.disbursement_category_name AS detail,"
                    + "    	cb.budget_total,"
                    + "     cb.from_disbursement_category_id as disbursement_category_id "
                    + " 	from e_budget.change_budget cb "
                    + "   	LEFT JOIN e_budget.disbursement_category bc On cb.to_disbursement_category_id = disbursement_category_id "
                    + "    	WHERE cb.officeid = '" + officeid + "' "
                    + "     UNION "
                    + "    	select 'receive_change_budget' as tb_source,"
                    + "    	cb.change_budget_datetime as transaction_datetime,"
                    + "    	bc.disbursement_category_name as detail,"
                    + "    	cb.budget_total,"
                    + "	cb.to_disbursement_category_id as disbursement_category_id "
                    + "	from e_budget.change_budget cb "
                    + "    	left join e_budget.disbursement_category bc ON cb.from_disbursement_category_id = bc.disbursement_category_id "
                    + "   	where cb.officeid= '" + officeid + "' "
                    + "    	UNION "
                    + "    	SELECT 'allocate_budget' AS tb_source,ab.allocate_budget_datetime AS transaction_datetime,p.project_name AS detail,"
                    + "    	ab.allocate_budget_total AS  budget_total,disbursement_category_id "
                    + "	FROM e_budget.allocate_budget ab LEFT JOIN e_budget.project p ON ab.project_id = p.project_id "
                    + "     WHERE ab.officeid= '" + officeid + "' "
                    + ") as t  "
                    + "left join e_budget.disbursement_category dc ON t.disbursement_category_id = dc.disbursement_category_id "
                    + "left join e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                    + "left join e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                    + "WHERE t.disbursement_category_id=" + disbursement_category_id + " "
                    + "group by bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,dc.disbursement_category_id,dc.disbursement_category_name";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            if (rs.next()) {
                double receive_total = rs.getDouble("receive_total");
                double used_total = rs.getDouble("receive_total");
                if (Double.compare((used_total + total_budget), receive_total) == 1) {
                    ret = true;
                } else {
                    ret = false;
                }
            }
            rs.close();
            dbms.closeConnection();
        } catch (Exception ex) {

        }
        return ret;
    }

    public String getProjectStatus(String project_id) {
        String ret = "รออนุมัติโครงการ";
        try {
            DB2Manager dbms = new DB2Manager();
            Accessories acc = new Accessories();
            int purchase_sub_type_id = 0;
            String query = "SELECT * FROM e_budget.project WHERE project_id = '" + project_id + "'";
            ResultSet rs = dbms.GetDataAsResultSet(query);

            if (rs.next()) {
                purchase_sub_type_id = rs.getInt("purchase_sub_type_id");
                String table = "";
                if (purchase_sub_type_id == 1) {
                    table = "e_market_result ";
                } else if (purchase_sub_type_id == 2) {
                    table = "e_bidding_result ";
                } else if (purchase_sub_type_id == 3) {
                    table = "selection_method_result ";
                } else if (purchase_sub_type_id == 4) {
                    table = "specific_method_result ";
                }
                if (purchase_sub_type_id == 1) {
                    query = "SELECT * FROM e_budget.term_of_payment_result WHERE project_id='" + project_id + "' ORDER BY term_of_payment_result_payment_date DESC FETCH FIRST 1 ROW ONLY";
                    rs = dbms.GetDataAsResultSet(query);
                    if (rs.next()) {
                        ret = "เบิกจ่ายงวดงานที่ " + rs.getString("term_of_payment_id");
                    } else {
                        query = "SELECT * FROM e_budget." + table + " WHERE project_id = '" + project_id + "'";
                        rs = dbms.GetDataAsResultSet(query);
                        if (rs.next()) {
                            if (!acc.IsNullToEmtyString(rs.getString("sign_promise_date")).isEmpty()) {
                                ret = "ลงนาในสัญญา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step5_startdate")).isEmpty()) {
                                ret = "เปิดทำสัญญา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step4_startdate")).isEmpty()) {
                                ret = "รออุทธรณ์";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step3_date")).isEmpty()) {
                                ret = "ประกาศผู้ชนะ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step3_date")).isEmpty()) {
                                ret = "เสนอกระทรวงอนุมัติ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step2_startdate")).isEmpty()) {
                                ret = "เสนอกระทรวงอนุมัติ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step1_startdate")).isEmpty()) {
                                ret = "เสนอกรม ฯ ให้ความเห็นชอบ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("open_envelope_step2_startdate")).isEmpty()) {
                                ret = "คณะกรรมการพิจารณาผลเปิดซอง";
                            } else if (!acc.IsNullToEmtyString(rs.getString("open_envelope_step1_date")).isEmpty()) {
                                ret = "เสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("contest_announcement_step4_startdate")).isEmpty()) {
                                ret = "ลงประกาศประกวดราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("contest_announcement_step3_date")).isEmpty()) {
                                ret = "กรม ฯ อนุมัติ ลงนามประกาศเผยแพร่";
                            } else if (!acc.IsNullToEmtyString(rs.getString("contest_announcement_step2_date")).isEmpty()) {
                                ret = "เสนอกรม ฯ เพื่อลงนามและเผยแพร่";
                            } else if (!acc.IsNullToEmtyString(rs.getString("contest_announcement_step1_date")).isEmpty()) {
                                ret = "เสนอรายงานตามระเบียบ ฯ ข้อ 22";
                            }
                        } else {
                            query = "SELECT * FROM e_budget.project WHERE project_active_status='Y' AND project_id='" + project_id + "'";
                            rs = dbms.GetDataAsResultSet(query);
                            if (rs.next()) {
                                ret = "โครงการได้รับการอนุมัติ";
                            }
                        }
                    }
                } else if (purchase_sub_type_id == 2) {
                    table = "e_bidding_result ";
                    query = "SELECT * FROM e_budget.term_of_payment_result WHERE project_id='" + project_id + "' ORDER BY term_of_payment_result_payment_date DESC FETCH FIRST 1 ROW ONLY";
                    rs = dbms.GetDataAsResultSet(query);
                    if (rs.next()) {
                        ret = "เบิกจ่ายงวดงานที่ " + rs.getString("term_of_payment_id");
                    } else {
                        query = "SELECT * FROM e_budget." + table + " WHERE project_id = '" + project_id + "'";
                        rs = dbms.GetDataAsResultSet(query);
                        if (rs.next()) {
                            if (!acc.IsNullToEmtyString(rs.getString("sign_promise_date")).isEmpty()) {
                                ret = "ลงนาในสัญญา";

                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step5_startdate")).isEmpty()) {
                                ret = "เปิดทำสัญญา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step4_startdate")).isEmpty()) {
                                ret = "รออุทธรณ์";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step3_date")).isEmpty()) {
                                ret = "ประกาศผู้ชนะ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step3_date")).isEmpty()) {
                                ret = "เสนอกระทรวงอนุมัติ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step2_startdate")).isEmpty()) {
                                ret = "เสนอกระทรวงอนุมัติ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step1_startdate")).isEmpty()) {
                                ret = "เสนอกรม ฯ ให้ความเห็นชอบ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("open_envelope_step2_startdate")).isEmpty()) {
                                ret = "คณะกรรมการพิจารณาผลเปิดซอง";
                            } else if (!acc.IsNullToEmtyString(rs.getString("open_envelope_step1_date")).isEmpty()) {
                                ret = "เสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("contest_announcement_step1_startdate")).isEmpty()) {
                                ret = "ลงประกาศประกวดราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_tor_step2_date")).isEmpty()) {
                                ret = "กรม ฯ อนุมัติ ลงนามประกาศเผยแพร่ TOR";
                            } else if (!acc.IsNullToEmtyString(rs.getString("draf_tor_step3_date")).isEmpty()) {
                                ret = "เสนอรายงานตามระเบียบ ฯ ข้อ 22";
                                query = "SELECT *  FROM e_budget.e_bidding_result_tor_loop WHERE project_id='" + project_id + "' ORDER BY e_bidding_result_tor_loop_id DESC fetch first 1 row only";
                                rs = dbms.GetDataAsResultSet(query);
                                if (rs.next()) {
                                    if (acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step5_status")).equals("Y")) {
                                        ret = "เสนอปรับปรุงร่าง";
                                    } else if (!acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step4_date")).isEmpty()) {
                                        ret = "คณะกรรมการ ฯ รายงานผลการวิจารณ์ ";
                                    } else if (!acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step3_date")).isEmpty()) {
                                        ret = "ส่งรายละเอียดการวิจารณ์ให้คณะกรรมการ ฯ ";
                                    } else if (!acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step1_startdate")).isEmpty()) {
                                        ret = "ลงประกาศร่าง TOR ครั่งที่ " + rs.getString("e_bidding_result_tor_loop_id");
                                    }
                                }
                            } else if (!acc.IsNullToEmtyString(rs.getString("draf_tor_step2_date")).isEmpty()) {
                                ret = "คณะกรรมการส่งคืนเอกสาร";
                            } else if (!acc.IsNullToEmtyString(rs.getString("draf_tor_step1_date")).isEmpty()) {
                                ret = "แต่งตั้งคณะกรรมการจัดทำรายละเอียดคุณลักษณะเฉพาะ";
                            }
                        } else {
                            query = "SELECT * FROM e_budget.project WHERE project_active_status='y' AND project_id='" + project_id + "'";
                            rs = dbms.GetDataAsResultSet(query);
                            if (rs.next()) {
                                ret = "โครงการได้รับการอนุมัติ";
                            }
                        }
                    }
                } else if (purchase_sub_type_id == 3) {
                    query = "SELECT * FROM e_budget.term_of_payment_result WHERE project_id='" + project_id + "' ORDER BY term_of_payment_result_payment_date DESC FETCH FIRST 1 ROW ONLY";
                    rs = dbms.GetDataAsResultSet(query);
                    if (rs.next()) {
                        ret = "เบิกจ่ายงวดงานที่ " + rs.getString("term_of_payment_id");
                    } else {
                        query = "SELECT * FROM e_budget." + table + " WHERE project_id = '" + project_id + "'";
                        rs = dbms.GetDataAsResultSet(query);
                        if (rs.next()) {
                            if (!acc.IsNullToEmtyString(rs.getString("sign_promise_date")).isEmpty()) {
                                ret = "ลงนามสัญญา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step4_startdate")).isEmpty()) {
                                ret = "เปิดทำสัญญา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step3_startdate")).isEmpty()) {
                                ret = "รออุทธรณ์";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step2_date")).isEmpty()) {
                                ret = "ประกาศผู้ชนะ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step1_date")).isEmpty()) {
                                ret = "กรม ฯ ให้ความเห็นชอบ อนุมัติ ลงนามประกาศผู้ชนะ ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("board_review_step3_date")).isEmpty()) {
                                ret = "เสนอกรม ฯ ให้ความเห็นชอบ อนุมัติ ลงนามประกาศผู้ชนะ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("board_review_step2_startdate")).isEmpty()) {
                                ret = "คณะกรรมการ ฯ พิจารณาผลการเสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("board_review_step1_date")).isEmpty()) {
                                ret = "ผู้เสนอราคายื่นเอกสารเสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step4_startdate")).isEmpty()) {
                                ret = "คณะกรรมการ ฯ มีหนีงสือเชิญชวนผู้เสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step3_date")).isEmpty()) {
                                ret = "ส่งคำสั่งแต่งตั้งคณะกรรมการซื้อหรือจ้างโดยวิธีคัดเลือก";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step2_date")).isEmpty()) {
                                ret = "กรมอนุมัติ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step1_date")).isEmpty()) {
                                ret = "เสนอรายงานตามระเบียบ ฯ ข้อ 22";
                            }
                        } else {
                            query = "SELECT * FROM e_budget.project WHERE project_active_status='y' AND project_id='" + project_id + "'";
                            rs = dbms.GetDataAsResultSet(query);
                            if (rs.next()) {
                                ret = "โครงการได้รับการอนุมัติ";
                            }
                        }
                    }
                } else if (purchase_sub_type_id == 4) {
                    table = "specific_method_result ";
                    query = "SELECT * FROM e_budget.term_of_payment_result WHERE project_id='" + project_id + "' ORDER BY term_of_payment_result_payment_date DESC FETCH FIRST 1 ROW ONLY";
                    rs = dbms.GetDataAsResultSet(query);
                    if (rs.next()) {
                        ret = "เบิกจ่ายงวดงานที่ " + rs.getString("term_of_payment_id");
                    } else {
                        query = "SELECT * FROM e_budget." + table + " WHERE project_id = '" + project_id + "'";
                        rs = dbms.GetDataAsResultSet(query);
                        if (rs.next()) {
                            if (!acc.IsNullToEmtyString(rs.getString("sign_promise_date")).isEmpty()) {
                                ret = "ลงนามสัญญา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step4_startdate")).isEmpty()) {
                                ret = "เปิดทำสัญญา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step3_startdate")).isEmpty()) {
                                ret = "รออุทธรณ์";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step2_date")).isEmpty()) {
                                ret = "ประกาศผู้ชนะ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("approve_step1_date")).isEmpty()) {
                                ret = "กรม ฯ ให้ความเห็นชอบ อนุมัติ ลงนามประกาศผู้ชนะ ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("board_review_step3_date")).isEmpty()) {
                                ret = "เสนอกรม ฯ ให้ความเห็นชอบ อนุมัติ ลงนามประกาศผู้ชนะ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("board_review_step2_startdate")).isEmpty()) {
                                ret = "คณะกรรมการ ฯ พิจารณาผลการเสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("board_review_step1_date")).isEmpty()) {
                                ret = "ผู้เสนอราคายื่นเอกสารเสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step4_startdate")).isEmpty()) {
                                ret = "คณะกรรมการ ฯ มีหนีงสือเชิญชวนผู้เสนอราคา";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step3_date")).isEmpty()) {
                                ret = "ส่งคำสั่งแต่งตั้งคณะกรรมการซื้อหรือจ้างโดยวิธีคัดเลือก";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step2_date")).isEmpty()) {
                                ret = "กรมอนุมัติ";
                            } else if (!acc.IsNullToEmtyString(rs.getString("invitation_announcement_step1_date")).isEmpty()) {
                                ret = "เสนอรายงานตามระเบียบ ฯ ข้อ 22";
                            }
                        } else {
                            query = "SELECT * FROM e_budget.project WHERE project_active_status='y' AND project_id='" + project_id + "'";
                            rs = dbms.GetDataAsResultSet(query);
                            if (rs.next()) {
                                ret = "โครงการได้รับการอนุมัติ";
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }

    public String GetDashboardReceiveBudget() {
        String ret = "";
        try {
            Accessories acc = new Accessories();
            DB2Manager dbms = new DB2Manager();

            String query = "SELECT SUM(rb.budget_total) AS budget_total FROM e_budget.receive_budget rb "
                    + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                    + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id";
            ResultSet rs = dbms.GetDataAsResultSet(query);
            String[] colorAr = {"#f8bd19", "#33ccff", "#ffcccc", "#ccff66"};
            if (rs.next()) {
                ret = "'label': 'งบประมาณรวม',"
                        + "'tooltext': '',"
                        + "'color': '#ffffff',"
                        + "'value': '" + acc.NumberFormat(rs.getDouble("budget_total"), "####.##") + "',"
                        + "'category': [";
                query = "SELECT "
                        + "bt.budget_type_id,bt.budget_type_name, "
                        + "SUM(rb.budget_total) AS budget_total "
                        + "FROM e_budget.receive_budget rb "
                        + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                        + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                        + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                        + "GROUP BY bt.budget_type_id,bt.budget_type_name";
                rs = dbms.GetDataAsResultSet(query);

                int i = 0;
                while (rs.next()) {
                    ret += " {";
                    ret += "'label': '" + rs.getString("budget_type_name") + "',"
                            + "'color': '" + colorAr[i] + "',"
                            + "'value': '" + acc.NumberFormat(rs.getDouble("budget_total"), "####.##") + "',"
                            + "'category':[";
                    query = "SELECT "
                            + "bc.budget_category_id,bc.budget_category_name,"
                            + "SUM(rb.budget_total) AS budget_total "
                            + "FROM e_budget.receive_budget rb "
                            + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                            + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                            + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                            + "WHERE bt.budget_type_id =  " + rs.getString("budget_type_id")
                            + " GROUP BY bc.budget_category_id,bc.budget_category_name";
                    ResultSet rs1 = dbms.GetDataAsResultSet(query);
                    while (rs1.next()) {
                        ret += "{"
                                + "'label': '" + rs1.getString("budget_category_name") + "',"
                                + "'color': '" + colorAr[i] + "',"
                                + "'value': '" + acc.NumberFormat(rs1.getDouble("budget_total"), "####.##") + "'"
                                + "},";
                    }
                    ret = ret.substring(0, ret.length() - 1);
                    ret += "]},";
                    i++;
                }

                ret += "]";
            }

        } catch (Exception ex) {

        }
        return ret;
    }

    public double GetDash2ReceiveBugetwidget() {
        double ret = 0;
        try {
            String query = "SELECT SUM(rb.budget_total) AS budget_total FROM e_budget.receive_budget rb";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            if (rs.next()) {
                ret = rs.getDouble("budget_total");
            }
        } catch (Exception ex) {
        }
        return ret;
    }

    public double GetDash2PaymentBudgetwidget() {
        double ret = 0;
        try {
            String query = "SELECT SUM(pb.payment_budget_total) AS payment_budget_total FROM e_budget.payment_budget pb";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            if (rs.next()) {
                ret = rs.getDouble("payment_budget_total");
            }
        } catch (Exception ex) {
        }
        return ret;
    }

    public String GetDash2Dash12() {
        String ret = "[";
        try {
            Accessories acc = new Accessories();
            String query = "SELECT * FROM e_budget.budget_type";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            while (rs.next()) {
                ret += "{"
                        + "'seriesname': '" + rs.getString("budget_type_name") + "',"
                        + " 'data': [";

                query = "SELECT o.officeid,officename,rb.receive_budget_total,"
                        + "tr.tranfer_budget,"
                        + "rtrf.receive_tranfer_budget,"
                        + "pm.payment_budget_total "
                        + "FROM e_budget.office o "
                        + "LEFT JOIN ("
                        + "	SELECT bt.budget_type_id,bt.budget_type_name,"
                        + "	SUBSTR(rb.officeid,1,2) CONCAT '000000' AS officeid ,sum(rb.budget_total) AS receive_budget_total "
                        + "	FROM e_budget.receive_budget rb "
                        + "	LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id =dc.disbursement_category_id "
                        + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                        + "	LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                        + "	WHERE bt.budget_type_id = " + rs.getString("budget_type_id") + " "
                        + "	GROUP BY bt.budget_type_id,bt.budget_type_name,SUBSTR(rb.officeid,1,2)"
                        + ") AS rb ON o.officeid = rb.officeid "
                        + "LEFT JOIN ("
                        + "	SELECT bc.budget_type_id,SUBSTR(tb.from_officeid,1,2) CONCAT '000000' AS officeid,SUM(tb.budget_total) As tranfer_budget "
                        + "	FROM e_budget.tranfer_budget tb "
                        + "	LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                        + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id	"
                        + "	WHERE bc.budget_type_id = " + rs.getString("budget_type_id") + " "
                        + "	GROUP BY  bc.budget_type_id,SUBSTR(tb.from_officeid,1,2)"
                        + ") AS tr ON o.officeid = tr.officeid "
                        + "LEFT JOIN (	"
                        + "	SELECT bt.budget_type_id,bt.budget_type_name,"
                        + "	SUBSTR(tb.to_officeid,1,2) CONCAT '000000' As officeid,"
                        + "	SUM(tb.budget_total) AS receive_tranfer_budget "
                        + "	FROM e_budget.tranfer_budget tb "
                        + "	LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                        + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                        + "	LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                        + "	WHERE bt.budget_type_id = " + rs.getString("budget_type_id") + " "
                        + "	GROUP BY bt.budget_type_id,bt.budget_type_name,SUBSTR(tb.to_officeid,1,2)"
                        + ") AS rtrf ON o.officeid = rtrf.officeid "
                        + "LEFT JOIN ("
                        + "	SELECT bc.budget_type_id,substr(pb.officeid,1,2) concat '000000' as officeid,SUM(pb.payment_budget_total) AS payment_budget_total "
                        + "	FROM e_budget.payment_budget pb "
                        + "	LEFT JOIN e_budget.disbursement_category dc ON pb.disbursement_category_id = dc.disbursement_category_id "
                        + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                        + "	WHERE bc.budget_type_id = " + rs.getString("budget_type_id") + " "
                        + "	GROUP BY bc.budget_type_id,substr(pb.officeid,1,2) "
                        + ") AS pm ON o.officeid = pm.officeid "
                        + "WHERE o.office_level = '00' "
                        + "ORDER BY o.officeid ASC";
                ResultSet r1 = dbms.GetDataAsResultSet(query);
                while (r1.next()) {
                    ret += "{'value': '" + acc.NumberFormat(r1.getDouble("receive_budget_total") - r1.getDouble("tranfer_budget") + r1.getDouble("receive_tranfer_budget") - r1.getDouble("payment_budget_total"), "####.##") + "'},";
                }
                ret  = ret.substring(0, ret.length()-1)+ "]},";
            }
            ret = ret.substring(0, ret.length()-1)+ "]";
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ret;
    }

    public String GetDash2Dash22() {
        String ret = "'seriesname': 'เบิกจ่าย',"
                + "'data': [";
        String total = "";
        try {
            Accessories acc = new Accessories();
            DB2Manager dbms = new DB2Manager();
            String query = "SELECT o.officeid,officename,rb.receive_budget_total,"
                    + "tr.tranfer_budget,"
                    + "rtrf.receive_tranfer_budget,"
                    + "pm.payment_budget_total "
                    + "FROM e_budget.office o "
                    + "LEFT JOIN ("
                    + "	SELECT "
                    + "	SUBSTR(rb.officeid,1,2) CONCAT '000000' AS officeid ,sum(rb.budget_total) AS receive_budget_total "
                    + "	FROM e_budget.receive_budget rb "
                    + "	LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id =dc.disbursement_category_id "
                    + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                    + "	LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                    + "	GROUP BY SUBSTR(rb.officeid,1,2) "
                    + ") AS rb ON o.officeid = rb.officeid "
                    + "LEFT JOIN ("
                    + "	SELECT SUBSTR(tb.from_officeid,1,2) CONCAT '000000' AS officeid,SUM(tb.budget_total) As tranfer_budget "
                    + "	FROM e_budget.tranfer_budget tb "
                    + "	LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                    + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id	"
                    + "	GROUP BY  SUBSTR(tb.from_officeid,1,2)"
                    + ") AS tr ON o.officeid = tr.officeid "
                    + "LEFT JOIN (	"
                    + "	SELECT 	SUBSTR(tb.to_officeid,1,2) CONCAT '000000' As officeid,"
                    + "	SUM(tb.budget_total) AS receive_tranfer_budget "
                    + "	FROM e_budget.tranfer_budget tb "
                    + "	LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                    + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                    + "	LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                    + "	GROUP BY SUBSTR(tb.to_officeid,1,2)"
                    + ") AS rtrf ON o.officeid = rtrf.officeid "
                    + "LEFT JOIN ("
                    + "	SELECT substr(pb.officeid,1,2) concat '000000' as officeid,SUM(pb.payment_budget_total) AS payment_budget_total "
                    + "	FROM e_budget.payment_budget pb "
                    + "	LEFT JOIN e_budget.disbursement_category dc ON pb.disbursement_category_id = dc.disbursement_category_id "
                    + "	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                    + "	GROUP BY substr(pb.officeid,1,2)"
                    + ") AS pm ON o.officeid = pm.officeid "
                    + "WHERE o.office_level = '00' "
                    + "ORDER BY o.officeid ASC";
            ResultSet rxx = dbms.GetDataAsResultSet(query);
            while (rxx.next()) {
                ret += "{'value': '" + acc.NumberFormat(rxx.getDouble("payment_budget_total"), "####.##") + "'},";
                total += "{'value': '" + acc.NumberFormat(rxx.getDouble("receive_budget_total") - rxx.getDouble("tranfer_budget") + rxx.getDouble("receive_tranfer_budget"), "####.##") + "'},";
            }

            ret = ret.substring(0, ret.length()-1)+ "]";
            
        } catch (Exception ex) {

        }
        return ret+"|"+total.substring(0, total.length()-1);
    }
}
