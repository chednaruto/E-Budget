package rd.ebudget.object.Budget;

import java.util.Vector;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

public class Project {

    private String project_id;
    private String project_name;
    private String officeid;
    private Vector<ProjectGovernmentPolicy> projectGovernmentPolicys;
    private Vector<ProjectMOFStrategic> projectMOFStrategics;
    private Vector<ProjectRDStrategic> projectRDStrategic;
    private Vector<ProjectRDGoal> projectRDGoal;
    private Vector<ProjectRDTacTics> projectRDTacTicss;
    private Vector<ProjectOwner> projectOwners;
    private Vector<ProjectObjective> projectObjectives;
    private Vector<ProjectOutput> projectOutputs;
    private Vector<ProjectOutCome> projectOutComes;
    private Vector<ProjectBenefit> projectBenefits;
    private int project_type_id;
    private String project_start_date;
    private String project_end_date;

    public boolean InsertProject(Project pj) {
        boolean ret = false;
        Accessories acc = new Accessories();
        try {
            String query = "DELETE FROM e_budget.project WHERE project_id='"+pj.getProject_id()+"'";
            DB2Manager dbms = new DB2Manager();
            dbms.Excute(query);
            query = "INSERT INTO e_budget.project(project_id,project_name,officeid,project_type_id,project_start_date,project_end_date) "
                    + "VALUES('" + pj.getProject_id() + "','" + pj.getProject_name() + "','" + pj.getOfficeid() + "'," + pj.getProject_type_id() + ",'" + pj.getProject_start_date() + "','" + pj.getProject_end_date() + "')";
             dbms.Excute(query);
            if (pj.getProjectGovernmentPolicys().size() > 0) {
                pj.getProjectGovernmentPolicys().elementAt(0).DeleteProjectGovernmentPolicy(pj.getProjectGovernmentPolicys().elementAt(0));
                for (int i = 0; i < pj.getProjectGovernmentPolicys().size(); i++) {
                    pj.getProjectGovernmentPolicys().elementAt(i).InsertProjectGovernmentPolicy(pj.getProjectGovernmentPolicys().elementAt(i));
                }
            }

            if (pj.getProjectMOFStrategics().size() > 0) {
                pj.getProjectMOFStrategics().elementAt(0).DeleteProjectMOFStrategic(pj.getProjectMOFStrategics().elementAt(0));
                for (int i = 0; i < pj.getProjectMOFStrategics().size(); i++) {
                    pj.getProjectMOFStrategics().elementAt(i).InsertProjectMOFStrategic(pj.getProjectMOFStrategics().elementAt(i));
                }
            }

            if (pj.getProjectRDStrategic().size() > 0) {
                pj.getProjectRDStrategic().elementAt(0).DeleteProjectRDStrategic(pj.getProjectRDStrategic().elementAt(0));
                for (int i = 0; i < pj.getProjectRDStrategic().size(); i++) {
                    pj.getProjectRDStrategic().elementAt(i).InsertProjectRDStrategic(pj.getProjectRDStrategic().elementAt(i));
                }
            }

            if (pj.getProjectRDGoal().size() > 0) {
                pj.getProjectRDGoal().elementAt(0).DeleteProjectRDGoal(pj.getProjectRDGoal().elementAt(0));
                for (int i = 0; i < pj.getProjectRDGoal().size(); i++) {
                    pj.getProjectRDGoal().elementAt(i).InsertProjectRDGoal(pj.getProjectRDGoal().elementAt(i));
                }
            }

            if (pj.getProjectRDTacTicss().size() > 0) {
                pj.getProjectRDTacTicss().elementAt(0).DeleteProjectRDTacTics(pj.getProjectRDTacTicss().elementAt(0));
                for (int i = 0; i < pj.getProjectRDTacTicss().size(); i++) {
                    pj.getProjectRDTacTicss().elementAt(i).InsertProjectRDTacTics(pj.getProjectRDTacTicss().elementAt(i));
                }
            }

            if (pj.getProjectOwners().size() > 0) {
                pj.getProjectOwners().elementAt(0).DeleteProjectOwner(pj.getProjectOwners().elementAt(0));
                for (int i = 0; i < pj.getProjectOwners().size(); i++) {
                    pj.getProjectOwners().elementAt(i).InsertProjectOwner(pj.getProjectOwners().elementAt(i));
                }
            }

            if (pj.getProjectObjectives().size() > 0) {
                pj.getProjectObjectives().elementAt(0).DeleteProjectObjective(pj.getProjectObjectives().elementAt(0));
                for (int i = 0; i < pj.getProjectObjectives().size(); i++) {
                    pj.getProjectObjectives().elementAt(i).InsertProjectObjective(pj.getProjectObjectives().elementAt(i));
                }
            }

            if (pj.getProjectOutputs().size() > 0) {
                pj.getProjectOutputs().elementAt(0).DeleteProjectOutput(pj.getProjectOutputs().elementAt(0));
                for (int i = 0; i < pj.getProjectOutputs().size(); i++) {
                    pj.getProjectOutputs().elementAt(i).InsertProjectOutput(pj.getProjectOutputs().elementAt(i));
                }
            }
                
            if (pj.getProjectOutComes().size() > 0) {
                pj.getProjectOutComes().elementAt(0).DeleteProjectOutCome(pj.getProjectOutComes().elementAt(0));
                for (int i = 0; i < pj.getProjectOutComes().size(); i++) {
                    pj.getProjectOutComes().elementAt(i).InsertProjectOutCome(pj.getProjectOutComes().elementAt(i));
                }
            }
            
            if (pj.getProjectBenefits().size() > 0) {
                pj.getProjectBenefits().elementAt(0).DeleteProjectBenefit(pj.getProjectBenefits().elementAt(0));
                for (int i = 0; i < pj.getProjectBenefits().size(); i++) {
                    pj.getProjectBenefits().elementAt(i).InsertProjectBenefit(pj.getProjectBenefits().elementAt(i));
                }
            }
            ret = true;

        } catch (Exception ex) {
            ret = false;
            ex.printStackTrace();
        }
        return ret;
    }

    private String GenProjectID() {
        String project_id = "select * from e_budget.project p where p.officeid='00004000'";
        try {
            String query = "";
        } catch (Exception ex) {

        }
        return project_id;
    }

    /**
     * @return the project_id
     */
    public String getProject_id() {
        return project_id;
    }

    /**
     * @param project_id the project_id to set
     */
    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    /**
     * @return the project_name
     */
    public String getProject_name() {
        return project_name;
    }

    /**
     * @param project_name the project_name to set
     */
    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    /**
     * @return the officeid
     */
    public String getOfficeid() {
        return officeid;
    }

    /**
     * @param officeid the officeid to set
     */
    public void setOfficeid(String officeid) {
        this.officeid = officeid;
    }

    /**
     * @return the projectGovernmentPolicys
     */
    public Vector<ProjectGovernmentPolicy> getProjectGovernmentPolicys() {
        return projectGovernmentPolicys;
    }

    /**
     * @param projectGovernmentPolicys the projectGovernmentPolicys to set
     */
    public void setProjectGovernmentPolicys(Vector<ProjectGovernmentPolicy> projectGovernmentPolicys) {
        this.projectGovernmentPolicys = projectGovernmentPolicys;
    }

    /**
     * @return the projectMOFStrategics
     */
    public Vector<ProjectMOFStrategic> getProjectMOFStrategics() {
        return projectMOFStrategics;
    }

    /**
     * @param projectMOFStrategics the projectMOFStrategics to set
     */
    public void setProjectMOFStrategics(Vector<ProjectMOFStrategic> projectMOFStrategics) {
        this.projectMOFStrategics = projectMOFStrategics;
    }

    /**
     * @return the projectRDStrategic
     */
    public Vector<ProjectRDStrategic> getProjectRDStrategic() {
        return projectRDStrategic;
    }

    /**
     * @param projectRDStrategic the projectRDStrategic to set
     */
    public void setProjectRDStrategic(Vector<ProjectRDStrategic> projectRDStrategic) {
        this.projectRDStrategic = projectRDStrategic;
    }

    /**
     * @return the projectRDGoal
     */
    public Vector<ProjectRDGoal> getProjectRDGoal() {
        return projectRDGoal;
    }

    /**
     * @param projectRDGoal the projectRDGoal to set
     */
    public void setProjectRDGoal(Vector<ProjectRDGoal> projectRDGoal) {
        this.projectRDGoal = projectRDGoal;
    }

    /**
     * @return the projectRDTacTicss
     */
    public Vector<ProjectRDTacTics> getProjectRDTacTicss() {
        return projectRDTacTicss;
    }

    /**
     * @param projectRDTacTicss the projectRDTacTicss to set
     */
    public void setProjectRDTacTicss(Vector<ProjectRDTacTics> projectRDTacTicss) {
        this.projectRDTacTicss = projectRDTacTicss;
    }

    /**
     * @return the projectOwners
     */
    public Vector<ProjectOwner> getProjectOwners() {
        return projectOwners;
    }

    /**
     * @param projectOwners the projectOwners to set
     */
    public void setProjectOwners(Vector<ProjectOwner> projectOwners) {
        this.projectOwners = projectOwners;
    }

    /**
     * @return the projectObjectives
     */
    public Vector<ProjectObjective> getProjectObjectives() {
        return projectObjectives;
    }

    /**
     * @param projectObjectives the projectObjectives to set
     */
    public void setProjectObjectives(Vector<ProjectObjective> projectObjectives) {
        this.projectObjectives = projectObjectives;
    }

    /**
     * @return the projectOutputs
     */
    public Vector<ProjectOutput> getProjectOutputs() {
        return projectOutputs;
    }

    /**
     * @param projectOutputs the projectOutputs to set
     */
    public void setProjectOutputs(Vector<ProjectOutput> projectOutputs) {
        this.projectOutputs = projectOutputs;
    }

    /**
     * @return the projectOutComes
     */
    public Vector<ProjectOutCome> getProjectOutComes() {
        return projectOutComes;
    }

    /**
     * @param projectOutComes the projectOutComes to set
     */
    public void setProjectOutComes(Vector<ProjectOutCome> projectOutComes) {
        this.projectOutComes = projectOutComes;
    }

    /**
     * @return the projectBenefits
     */
    public Vector<ProjectBenefit> getProjectBenefits() {
        return projectBenefits;
    }

    /**
     * @param projectBenefits the projectBenefits to set
     */
    public void setProjectBenefits(Vector<ProjectBenefit> projectBenefits) {
        this.projectBenefits = projectBenefits;
    }

    /**
     * @return the project_type_id
     */
    public int getProject_type_id() {
        return project_type_id;
    }

    /**
     * @param project_type_id the project_type_id to set
     */
    public void setProject_type_id(int project_type_id) {
        this.project_type_id = project_type_id;
    }

    /**
     * @return the project_start_date
     */
    public String getProject_start_date() {
        return project_start_date;
    }

    /**
     * @param project_start_date the project_start_date to set
     */
    public void setProject_start_date(String project_start_date) {
        this.project_start_date = project_start_date;
    }

    /**
     * @return the project_end_date
     */
    public String getProject_end_date() {
        return project_end_date;
    }

    /**
     * @param project_end_date the project_end_date to set
     */
    public void setProject_end_date(String project_end_date) {
        this.project_end_date = project_end_date;
    }

}
