package connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectMYSQL implements IConnectMYSQL{
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
    @Override
    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }
}
