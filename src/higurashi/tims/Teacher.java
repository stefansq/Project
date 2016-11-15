package higurashi.tims;

import java.sql.Date;

public class Teacher {
    public String name;  //not null
    public boolean sex;  //not null
    public int id;
    public int institute;
    public String email;
    public String web;
    public String basic;
    public String awards;
    public String work;
    public String education;
    public String research;
    public String other;
    
    public Teacher() {
		sex = true;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInstitute() {
		return institute;
	}

	public void setInstitute(int institute) {
		this.institute = institute;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public String getBasic() {
		return basic;
	}

	public void setBasic(String basic) {
		this.basic = basic;
	}

	public String getAwards() {
		return awards;
	}

	public void setAwards(String awards) {
		this.awards = awards;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getResearch() {
		return research;
	}

	public void setResearch(String research) {
		this.research = research;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
}
/*
try {  
    String date_str = "5555-22-33";  
      
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");  
    format.setLenient(false);  
    Date date = format.parse(date_str);  
      
} catch (Exception ex){  
    ex.printStackTrace();  
    System.out.println("日期不合法");  
}  */

/*
TABLE teacher(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(40) NOT NULL,
sex TINYINT NOT NULL,
t_id INT,
institute INT,
email VARCHAR(100),
web VARCHAR(100),
basic TEXT,
awards TEXT,
work TEXT,
education TEXT,
research TEXT,
other TEXT,
PRIMARY KEY ( id )
);
 */
