package higurashi.tims;

import com.opensymphony.xwork2.ActionSupport;

public class New extends ActionSupport{
	private Teacher teacher;
	
	public New() {
		teacher = new Teacher();
	}

	public String execute() throws Exception {
		
		return "SUCCESS";
	}
}