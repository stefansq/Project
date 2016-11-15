package higurashi.tims;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherForm extends ActionSupport{
	public TeacherForm() {
		teacher = new Teacher();
	}
	
	private Teacher teacher;
	private int tid;
	
	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}
	
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext(); 
		Map params = context.getParameters();
		String[] str = (String[])params.get("tid");
		tid = Integer.parseInt(str[0]);
		
		//System.out.println("tid");
		//System.out.println(tid);
		Database db = new Database();
		String sql = "SELECT * FROM teacher WHERE id=" + String.valueOf(tid);
		System.out.println(sql);
        ResultSet result = db.query(sql);
        //System.out.println("result end");
        try
        {
        	while(result.next()) {
        		//System.out.println("Not null");
            	teacher.name = result.getString(2);
            	teacher.sex = result.getBoolean(3);
            	teacher.id = result.getInt(4);
            	teacher.institute = result.getInt(5);
            	teacher.email = result.getString(6);
            	teacher.web = result.getString(7);
            	teacher.basic = result.getString(8);
            	teacher.awards = result.getString(9);
            	teacher.work = result.getString(10);
            	teacher.education = result.getString(11);
            	teacher.research = result.getString(12);
            	teacher.other = result.getString(13);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        result.close();
        db.close();
        
		return SUCCESS;
	}
}
