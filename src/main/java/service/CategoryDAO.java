package service;

import model.Category;
import model.Role;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO implements ICategoryDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";

    private static final String INSERT_CATEGORY_SQL = "INSERT INTO category (`id`, `name`) VALUES (?, ? )";
    private static final String SELECT_CATEGORY_BY_ID = "select id ,name from category where id =?";
    private static final String SELECT_ALL_CATEGORY = "SELECT * FROM category;";
    private static final String DELETE_ROLE_SQL = "delete from role where id = ?;";
    private static final String UPDATE_ROLE_SQL = "UPDATE role SET `id` = ?, `name` = ? WHERE (`id` = ?)";

    public CategoryDAO() {

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
    public void insertCategory(Category category) throws SQLException {
        System.out.println(INSERT_CATEGORY_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_SQL)) {
            preparedStatement.setInt(1, category.getId());
            preparedStatement.setString(2, category.getName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
        }
    }
    @Override
    public Category selectCategory(int id) {
        Category category = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id1 = rs.getInt("id");
                String name = rs.getString("name");


                return new Category(id, name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return category;
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
    public List<Category> selectAllCategory() {
        List<Category> countries = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");

                countries.add(new Category(id, name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return countries;
    }
}
