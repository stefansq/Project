package higurashi.tims;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport {

	private String id;
	private String userpassword;
	private int tp;

	public String execute() throws Exception {
		String ret = ERROR;
		try {
			Database db = new Database();
			String sql = "SELECT * FROM user WHERE id=" + id;
			if (sql != null) {
				ResultSet result = db.query(sql);
				if (result.getString(2) == userpassword && result.getInt(3) == tp)
					ret = SUCCESS;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		result.close();
		db.close();

		return ret;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public int getTp() {
		return tp;
	}

	public void setTp(int tp) {
		this.tp = tp;
	}

}

public void validate()
{
	
}