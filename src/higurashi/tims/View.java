package higurashi.tims;

import java.sql.*;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

public class View extends ActionSupport{
	public View() {
		institutes = new ArrayList<String>();
	}
	private ArrayList<String> institutes;

	public ArrayList<String> getInstitutes() {
		return institutes;
	}

	public void setInstitutes(ArrayList<String> institutes) {
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
            	institutes.add(result.getString(2));
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
