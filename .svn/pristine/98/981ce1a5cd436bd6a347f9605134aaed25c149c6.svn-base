package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.Project;
import rd.ebudget.object.Budget.ProjectBenefit;
import rd.ebudget.object.Budget.ProjectGovernmentPolicy;
import rd.ebudget.object.Budget.ProjectMOFStrategic;
import rd.ebudget.object.Budget.ProjectObjective;
import rd.ebudget.object.Budget.ProjectOutCome;
import rd.ebudget.object.Budget.ProjectOutput;
import rd.ebudget.object.Budget.ProjectOwner;
import rd.ebudget.object.Budget.ProjectRDGoal;
import rd.ebudget.object.Budget.ProjectRDStrategic;
import rd.ebudget.object.Budget.ProjectRDTacTics;
import rd.ebudget.tools.Accessories;

public class ProjectServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            boolean ret = false;
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            String project_id = "";
            Project p = new Project();
            p.setProject_name(acc.IsNullToEmtyString(request.getParameter("project[project_name]")));
            p.setProject_type_id(Integer.parseInt(request.getParameter("project[project_type_id]")));
            p.setProject_start_date(acc.ChageDateFormat(request.getParameter("project[project_start_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
            p.setProject_end_date(acc.ChageDateFormat(request.getParameter("project[project_end_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
            p.setOfficeid(acc.IsNullToEmtyString(request.getParameter("project[office_code]")));
            if (acc.IsNullToEmtyString(request.getParameter("project[project_id]")).isEmpty()) {
                project_id = acc.GenerateProjectID(acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-OFFICEID")));
            } else {
                project_id = acc.IsNullToEmtyString(request.getParameter("project[project_id]"));
            }
            p.setProject_id(project_id);
            Vector<ProjectGovernmentPolicy> pgps = new Vector<ProjectGovernmentPolicy>();
            String pgp[] = request.getParameterValues("project[government_policy][]");
            for (int i = 0; i < pgp.length; i++) {
                ProjectGovernmentPolicy p1 = new ProjectGovernmentPolicy();
                p1.setProject_id(project_id);
                p1.setGovernment_id(Integer.parseInt(pgp[i]));
                pgps.add(p1);
            }
            p.setProjectGovernmentPolicys(pgps);

            Vector<ProjectMOFStrategic> pmss = new Vector();
            String pms[] = request.getParameterValues("project[mof_strategic][]");
            for (int i = 0; i < pms.length; i++) {
                ProjectMOFStrategic p1 = new ProjectMOFStrategic();
                p1.setProject_id(project_id);
                p1.setMof_strategic_id(Integer.parseInt(pms[i]));
                pmss.add(p1);
            }
            p.setProjectMOFStrategics(pmss);

            Vector<ProjectRDStrategic> prss = new Vector();
            String prss_arr[] = request.getParameterValues("project[rd_strategic][]");
            for (int i = 0; i < prss_arr.length; i++) {
                ProjectRDStrategic p1 = new ProjectRDStrategic();
                p1.setProject_id(project_id);
                p1.setRd_strategic_id(Integer.parseInt(prss_arr[i]));
                prss.add(p1);
            }
            p.setProjectRDStrategic(prss);
            
            Vector<ProjectRDGoal> prgs = new Vector();
            String prgs_arr[] = request.getParameterValues("project[rd_goal][]");
            for (int i = 0; i < prgs_arr.length; i++) {
                ProjectRDGoal p1 = new ProjectRDGoal();
                p1.setProject_id(project_id);
                p1.setRd_goal_id(Integer.parseInt(prgs_arr[i]));
                prgs.add(p1);
            }
            p.setProjectRDGoal(prgs);
            
            Vector<ProjectRDTacTics> prts = new Vector();
            String prts_arr[] = request.getParameterValues("project[rd_tactics][]");
            for (int i = 0; i < prts_arr.length; i++) {
                ProjectRDTacTics p1 = new ProjectRDTacTics();
                p1.setProject_id(project_id);
                p1.setRd_tactics_id(Integer.parseInt(prts_arr[i]));
                prts.add(p1);
            }
            p.setProjectRDTacTicss(prts);
            
            Vector<ProjectOwner> pons = new Vector();
            String uid_arr[] = request.getParameterValues("project[project_owner][uid][]");
            String fullname_arr[] = request.getParameterValues("project[project_owner][fullname][]");
            String position_m_arr[] = request.getParameterValues("project[project_owner][position_m][]");
            String email_arr[] = request.getParameterValues("project[project_owner][email][]");
            for (int i = 0; i < uid_arr.length; i++) {
                ProjectOwner p1 = new ProjectOwner();
                p1.setProject_id(project_id);
                p1.setId(uid_arr[i]);
                p1.setFullname(fullname_arr[i]);
                p1.setPosition_m(position_m_arr[i]);
                p1.setEmail(email_arr[i]);
                pons.add(p1);
            }
            p.setProjectOwners(pons);
            
            Vector<ProjectObjective> pojs = new Vector();
            String pojs_arr[] = request.getParameterValues("project[project_objective][]");
            for (int i = 0; i < pojs_arr.length; i++) {
                ProjectObjective p1 = new ProjectObjective();
                p1.setProject_id(project_id);
                p1.setProject_objective_id(i);
                p1.setProject_objective_name(pojs_arr[i]);
                pojs.add(p1);
            }
            p.setProjectObjectives(pojs);
            
            Vector<ProjectOutput> pops = new Vector();
            String pops_arr[] = request.getParameterValues("project[project_output][]");
            for (int i = 0; i < pops_arr.length; i++) {
                ProjectOutput p1 = new ProjectOutput();
                p1.setProject_id(project_id);
                p1.setProject_output_id(i);
                p1.setProject_output_name(pops_arr[i]);
                pops.add(p1);
            }
            p.setProjectOutputs(pops);
            
            Vector<ProjectOutCome> pocs = new Vector();
            String pocs_arr[] = request.getParameterValues("project[project_outcome][]");
            for (int i = 0; i < pocs_arr.length; i++) {
                ProjectOutCome p1 = new ProjectOutCome();
                p1.setProject_id(project_id);
                p1.setProject_outcome_id(i);
                p1.setProject_outcome_name(pocs_arr[i]);
                pocs.add(p1);
            }
            p.setProjectOutComes(pocs);
            
            Vector<ProjectBenefit> pbfs = new Vector();
            String pbfs_arr[] = request.getParameterValues("project[project_benefit][]");
            for (int i = 0; i < pbfs_arr.length; i++) {
                ProjectBenefit p1 = new ProjectBenefit();
                p1.setProject_id(project_id);
                p1.setProject_benefit_id(i);
                p1.setProject_benefit_name(pbfs_arr[i]);
                pbfs.add(p1);
            }
            p.setProjectBenefits(pbfs);
            ret = p.InsertProject(p);

            if (ret) {
                out.write("TRUE");
            } else {
                out.write("FALSE");
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
