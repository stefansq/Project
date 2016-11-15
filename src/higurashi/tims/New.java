package higurashi.tims;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

public class New extends ActionSupport{
	public New() {
		newteacher = new Teacher();
		institutes = new HashMap<Integer, String>();
	}
	
	private Teacher newteacher;
	private Map<Integer, String> institutes;

	public Teacher getNewteacher() {
		return newteacher;
	}

	public void setNewteacher(Teacher newteacher) {
		this.newteacher = newteacher;
	}

	public Map<Integer, String> getInstitutes() {
		return institutes;
	}

	public void setInstitutes(Map<Integer, String> institutes) {
		this.institutes = institutes;
	}

	public String execute() throws Exception {
		Database db = new Database();
		String sql = "SELECT * FROM inst";
        ResultSet result = db.query(sql);
        try
        {
            while(result.next()) {
            	//System.out.println(result.getString(2));
            	institutes.put(result.getInt(1), result.getString(2));
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        result.close();
        db.close();
		
		return SUCCESS;
	}
	
	public String submit() throws Exception {
		
		Database db = new Database();
		String sql = "INSERT INTO teacher (name, sex, t_id, " +
				"institute, email, web, basic, awards, work, education, research, " +
				"other) VALUES (" + "'" + newteacher.name + "'" + ", " + (newteacher.sex == true ? "0" : "1") +
				", " + (newteacher.id == 0 ? "null" : newteacher.id) + ", " +
				"'" + String.valueOf(newteacher.institute) + "'" + ", " +
				(newteacher.email.length() == 0 ? "null" : "'" + newteacher.email + "'") + ", " +
				(newteacher.web.length() == 0 ? "null" : "'" + newteacher.web + "'") + ", " +
				(newteacher.basic.length() == 0 ? "null" : "'" + newteacher.basic + "'") + ", " +
				(newteacher.awards.length() == 0 ? "null" : "'" + newteacher.awards + "'") + ", " +
				(newteacher.work.length() == 0 ? "null" : "'" + newteacher.work + "'") + ", " +
				(newteacher.education.length() == 0 ? "null" : "'" + newteacher.education + "'") + ", " +
				(newteacher.research.length() == 0 ? "null" : "'" + newteacher.research + "'") + ", " +
				(newteacher.other.length() == 0 ? "null" : "'" + newteacher.other + "'") + "); ";
		System.out.println(sql);

        db.executeSql(sql);
        db.close();
        
		return SUCCESS;
	}
	
	public void validate() {
		
	}
}
