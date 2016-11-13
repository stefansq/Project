package higurashi.tims;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Database{
	private static final String DRIVER_MYSQL = "com.mysql.jdbc.Driver";
	public static String URL = "jdbc:mysql://localhost:3306/tims";
	private static final String USER = "root";
	private static final String PASS = "269269";
	Connection conn;
	Statement stmt;
	
	public Database() {
		stmt = null;
		conn = null;
		try
	    {
	        Class.forName(DRIVER_MYSQL);
	        System.out.println("Driver Load Success.");
	        conn = DriverManager.getConnection(URL,USER,PASS);
	        System.out.println("Connection Success.");
	        stmt = conn.createStatement();
	        
	    } catch (Exception e)
	    {
	        e.printStackTrace();
	    }
	}
	
	public void executeSql(String sql) {
        try
        {
            stmt.execute(sql);
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
	
	public ResultSet query(String sql) {
        ResultSet result = null;

        try
        {
            result = stmt.executeQuery(sql);
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        return result;
    }
	
	public void close() {  
        try {  
            conn.close();  
            stmt.close();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
    }  
	/*
	public void print(ResultSet result) {
        try
        {
            while(result.next()) {
                System.out.println(result.toString());
                //result.getString(1)
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    */
	
}

/*
TABLE inst(
inst_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY ( inst_id )
);

create
TABLE teacher(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(40) NOT NULL,
sex TINYINT NOT NULL,
t_id INT,
birthday DATE,
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

INSERT INTO teacher (name, sex, institute) VALUES ( "张三", 1, 0);
INSERT INTO teacher (name, sex, institute) VALUES ( "李四", 1, 0);

DELETE FROM teacher WHERE sex=1;
*/



