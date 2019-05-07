/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rd.ebudget.object.projectManagement;

import rd.ebudget.tools.MysqlManager;

/**
 *
 * @author Mr.Tue
 */
public class Project {

    private String project_id;
    private String project_name;
    private String office_code;
    private String project_type_id;
    private String project_start_date;
    private String project_end_date;

    public boolean InsertProject(Project p) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project(project_id,project_name,office_code,project_type_id,project_start_date,project_end_date) "
                    + "VALUES('" + p.getProject_id() + "','" + p.getProject_name() + "','" + p.getOffice_code() + "','" + p.getProject_type_id() + "','" + p.getProject_start_date() + "','" + p.getProject_end_date() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean UpdateProject(Project p) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "INSERT INTO project(project_id,project_name,office_code,project_type_id,project_start_date,project_end_date) "
                    + "VALUES('" + p.getProject_id() + "','" + p.getProject_name() + "','" + p.getOffice_code() + "','" + p.getProject_type_id() + "','" + p.getProject_start_date() + "','" + p.getProject_end_date() + "')";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public boolean DeletePorject(Project p) {
        boolean ret = false;
        try {
            MysqlManager mm = new MysqlManager();
            String query = "DELETE FROM proeject WHERE project_id='" + p.getProject_id() + "'";
            ret = mm.Excute(query);
        } catch (Exception ex) {
        }
        return ret;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getOffice_code() {
        return office_code;
    }

    public void setOffice_code(String office_code) {
        this.office_code = office_code;
    }

    public String getProject_type_id() {
        return project_type_id;
    }

    public void setProject_type_id(String project_type_id) {
        this.project_type_id = project_type_id;
    }

    public String getProject_start_date() {
        return project_start_date;
    }

    public void setProject_start_date(String project_start_date) {
        this.project_start_date = project_start_date;
    }

    public String getProject_end_date() {
        return project_end_date;
    }

    public void setProject_end_date(String project_end_date) {
        this.project_end_date = project_end_date;
    }
}
