
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.ProjectActivity;
import rd.ebudget.tools.Accessories;

public class ProjectActivityServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = request.getParameter("project_activity[METHOD]");
            boolean ret = false;
            if(method.equals("INSERT")){
               ProjectActivity pa = new ProjectActivity();
               pa.setProject_activity_id(acc.IsNullToEmtyString(request.getParameter("project_activity[project_activity_id]")).isEmpty() ? 0:Integer.parseInt(request.getParameter("project_activity[project_activity_id]")));
               pa.setProject_activity_name(acc.IsNullToEmtyString(request.getParameter("project_activity[project_activity_name]")));
               pa.setProject_id(acc.IsNullToEmtyString(request.getParameter("project_activity[project_id]")));
               pa.setProject_activity_budget(Double.parseDouble(request.getParameter("project_activity[project_activity_budget]")));
               if(pa.getProject_activity_id()>0){
                   ret = pa.UpdateProjectActivity(pa);
               }else{
                   ret = pa.InsertProjectActivity(pa);
               }
            }else{
                ProjectActivity pa = new ProjectActivity();
                pa.setProject_activity_id(Integer.parseInt(request.getParameter("project_activity[project_activity_id]")));
                ret = pa.DeleteProjectActivity(pa);
            }
            if(ret){
                out.write("TRUE");
            }else{
                out.write("FALSE");
            }
            out.flush();
            out.close();
        }catch(Exception  ex){
            
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
