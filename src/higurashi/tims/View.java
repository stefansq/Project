package higurashi.tims;

import java.sql.*;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class View extends ActionSupport{
	public View() {
		institutes = new HashMap<Integer, Institute>();
	}
	
	private HashMap<Integer, Institute> institutes;
	private int state;
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public HashMap<Integer, Institute> getInstitutes() {
		return institutes;
	}
	public void setInstitutes(HashMap<Integer, Institute> institutes) {
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
            	Institute inst = new Institute();
            	inst.setName(result.getString(2));
            	institutes.put(result.getInt(1), inst);
            	
            	String sql2 = "SELECT * FROM teacher WHERE institute=" + result.getInt(1);
		        ResultSet result2 = db.query(sql2, true);  //参数重载，嵌套查询
		        try
		        {
		            while(result2.next()) {
		            	System.out.println(result.getString(1));
		            	institutes.get(result.getInt(1)).teachers.put(result2.getInt(1), result2.getString(2));
		            }
		            //System.out.println("extend end");
		            result2.close();
		        } catch (SQLException e)
		        {
		            e.printStackTrace();
		        }
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

class Institute{
	public Institute() {
		teachers = new HashMap<Integer, String>();
	}
	public String name;
	public Map<Integer, String> teachers;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Map<Integer, String> getTeachers() {
		return teachers;
	}
	public void setTeachers(Map<Integer, String> teachers) {
		this.teachers = teachers;
	}
}