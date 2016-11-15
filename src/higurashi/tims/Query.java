package higurashi.tims;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

public class Query extends ActionSupport{
	public Query() {
		teachers = new HashMap<Integer, String>();
	}
	private String name;
	public Map<Integer, String> teachers;
	
	public Map<Integer, String> getTeachers() {
		return teachers;
	}

	public void setTeachers(Map<Integer, String> teachers) {
		this.teachers = teachers;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void validate() {
		if (name.length() == 0){
			name = "null";
		}
	}


	public String execute() throws Exception {
		Database db = new Database();
		String sql = "SELECT * FROM teacher WHERE name LIKE '%" + name + "%'";
		//System.out.println(sql);
        ResultSet result = db.query(sql);
        try
        {
            while(result.next()) {
            	teachers.put(result.getInt(1), result.getString(2));
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