package service;

import model.Role;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoleDAO implements IRoleDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";

    private static final String INSERT_ROLE_SQL = "INSERT INTO role (`id`, `name`) VALUES (?, ? )";
    private static final String SELECT_ROLE_BY_ID = "select id ,name from role where id =?";
    private static final String SELECT_ALL_ROLE = "SELECT * FROM role;";
    private static final String DELETE_ROLE_SQL = "delete from role where id = ?;";
    private static final String UPDATE_ROLE_SQL = "UPDATE role SET `id` = ?, `name` = ? WHERE (`id` = ?)";

    public RoleDAO() {

    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertRole(Role role) throws SQLException {
        System.out.println(INSERT_ROLE_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ROLE_SQL)) {
            preparedStatement.setInt(1, role.getId());
            preparedStatement.setString(2, role.getName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
        }
    }
    @Override
    public Role selectRole(int id) {
        Role role = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROLE_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id1 = rs.getInt("id");
                String name = rs.getString("name");


                return new Role(id, name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return role;
    }



    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }



    @Override
    public List<Role> selectAllRole() {
        List<Role> countries = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ROLE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");

                countries.add(new Role(id, name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return countries;
    }
}

