package higurashi.tims;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Extend extends ActionSupport{
	public Extend() {
		names = new HashMap<Integer, String>();
	}
	private String instname;
	private Map<Integer, String> names;
	
	public Map<Integer, String> getNames() {
		return names;
	}
	public void setNames(Map<Integer, String> names) {
		this.names = names;
	}
	public String getInstname() {
		return instname;
	}
	public void setInstname(String instname) {
		this.instname = instname;
	}
	
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext(); 
		Map params = context.getParameters();
		String[] str = (String[])params.get("instname");
		instname = str[0];
		
		Database db = new Database();
		String sql = "SELECT * FROM teacher WHERE institute=" + instname;
        ResultSet result = db.query(sql);
        try
        {
            while(result.next()) {
            	//System.out.println(result.getString(1));
            	names.put(result.getInt(1), result.getString(2));
            }
            System.out.println("extend end");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        result.close();
        db.close();

		return "SUCCESS";
	}
}




	