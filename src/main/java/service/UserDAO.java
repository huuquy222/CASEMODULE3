package service;

import model.Product;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";

    private static final String INSERT_USERS_SQL = "INSERT INTO `users` (name, email,password,country,address,idrole ) VALUES (?, ?, ?, ?,?,?)";
    private static final String SELECT_USERS_BY_ID = "select name,email,password,country,address,idrole from users where id =?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users;";

    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET  name = ?, email = ?,password = ?, country = ?,address = ?, idrole = ? WHERE (id = ?)";

    private int noOfRecords;

    public UserDAO() {
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
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3,user.getPassword());
            preparedStatement.setInt(4, user.getCountry());
            preparedStatement.setString(5,user.getAddress());
            preparedStatement.setInt(6,user.getIdrole());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
        }
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
    public User selectUser(int id) throws SQLException {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                Integer idCountry = rs.getInt("country");
                String address = rs.getString("address");
                int idrole = rs.getInt("idrole");

                return new User(name, email,password, idCountry,address,idrole);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }



    @Override
    public List<User> selectAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                Integer idCountry = rs.getInt("country");
                String address = rs.getString("address");
                int idrole = rs.getInt("idrole");

                users.add(new User(id, name, email,password, idCountry,address,idrole));


            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> selectUsersPagging(int offset, int noOfRecords, String q) {
        String query = "select SQL_CALC_FOUND_ROWS * from users where name like ? limit "
                + offset + ", " + noOfRecords;
        List<User> list = new ArrayList<User>();
        User user = null;
        Connection connection = null;
        PreparedStatement stmt = null;
        try {
            connection = getConnection();
            stmt = connection.prepareStatement(query);
            stmt.setString(1, "%" + q + "%");

            System.out.println(this.getClass() + " selectUsersPagging " + stmt);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setCountry(rs.getInt("country"));
                user.setAddress(rs.getString("address"));
                user.setIdrole(rs.getInt("idrole"));

                list.add(user);
            }
            rs.close();

            rs = stmt.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }


//    public List<User> searchUser(String search) throws SQLException {
//        Connection connection = getConnection();
//        System.out.println("numberpage");
//
//        String query = "select * from `demo2`.`users` WHERE name like ?";
//        List<User> listUser = new ArrayList<>();
//        PreparedStatement ps = connection.prepareStatement(query);
//        ps.setString(1, '%' + search + '%');
//
//        ResultSet rs = ps.executeQuery();
//        while (rs.next()) {
//            User user = new User();
//            int id = rs.getInt("id");
//            String name = rs.getString("name");
//            String email = rs.getString("email");
//            int idCountry = rs.getInt("country");
//            address
//
//
//            listUser.add(user);
//        }
//        return listUser;
//    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3,user.getPassword());
            statement.setInt(4, user.getCountry());
            statement.setString(5,user.getAddress());
            statement.setInt(6,user.getIdrole());
            statement.setInt(7, user.getId());
//            "UPDATE users SET  name = ?, email = ?, country = ? WHERE (id = ?)";

            System.out.println(this.getClass() + " updateUser: " + statement);
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


    @Override
    public boolean checkUserExists(String username, String password) {
        if (username.equals("admin") && password.equals("1234")) {
            return true;
        }
        if (username.equals("user") && password.equals("12345")) {
            return true;
        }
        return false;
    }
}


