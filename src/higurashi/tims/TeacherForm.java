package higurashi.tims;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        System.out.println("result end");
        try
        {
        	while(result.next()) {
        		//System.out.println("Not null");
            	teacher.name = result.getString(2);
            	teacher.sex = result.getBoolean(3);
            	teacher.id = result.getInt(4);
            	teacher.birthday = result.getDate(5);
            	teacher.institute = result.getInt(6);
            	teacher.email = result.getString(7);
            	teacher.web = result.getString(8);
            	teacher.basic = result.getString(9);
            	teacher.awards = result.getString(10);
            	teacher.work = result.getString(11);
            	teacher.education = result.getString(12);
            	teacher.research = result.getString(13);
            	teacher.other = result.getString(14);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        result.close();
        db.close();
        
		return "SUCCESS";
	}
}
