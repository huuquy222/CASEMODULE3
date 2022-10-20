package service;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";

    private static final String INSERT_PRODUCTS_SQL = "INSERT INTO `demo2`.`products` (`name`, `color`, `quantity`, `price`,`image`,`idcategory`) VALUES (?, ?, ?, ?, ?,?)";
    private static final String SELECT_PRODUCTS_BY_ID = "select name,color,quantity,price,image,idcategory from products where id =?";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM demo2.products;";
    private static final String DELETE_PRODUCTS_SQL = "delete from products where id = ?;";
    private static final String UPDATE_PRODUCTS_SQL = "UPDATE `demo2`.`products` SET `name` = ?, `color` = ?, `quantity` = ?, `price` = ?,`image` =?, idcategory= ? WHERE (`id` = ?)";
    private int noOfRecords;

    public ProductDAO() {
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
    public void insertProduct(Product product) throws SQLException {
        System.out.println(INSERT_PRODUCTS_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCTS_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getColor());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5,product.getImage());
            preparedStatement.setInt(6, product.getIdcategory());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
        }
    }

    private  void printSQLException(SQLException ex) {
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
    public Product selectProduct(int id) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String color = rs.getString("color");
                Integer quantity = rs.getInt("quantity");
                Double price = rs.getDouble("price");
                String image = rs.getString("image");
                Integer idcategory = rs.getInt("idcategory");
//                idcategory

                //id, String name, String color, int quantity, double price,String image
                return new Product(name, color, quantity, price,image,idcategory);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    @Override
    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String color = rs.getString("color");
                int quantity = rs.getInt("quantity");
                Double price = rs.getDouble("price");
                String image = rs.getString("image");
                Integer idcategory = rs.getInt("idcategory");


                products.add(new Product(id,name,color,quantity,price,image,idcategory));


            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    @Override
    public List<Product> selectProductsPaging(int offset, int noOfRecords) {
        String query =  "select SQL_CALC_FOUND_ROWS * from products limit "
                + offset + ", " + noOfRecords;
        List<Product> list = new ArrayList<Product>();
        Product product = null;
        Connection connection = null;
        Statement stmt = null;
        try {
            connection = getConnection();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setColor(rs.getString("color"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setIdcategory(rs.getInt("idcategory"));
                list.add(product);
            }
            rs.close();

            rs = stmt.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally
        {
            try {
                if(stmt != null)
                    stmt.close();
                if(connection != null)
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
    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCTS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCTS_SQL);) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getColor());
            statement.setInt(3, product.getQuantity());
            statement.setDouble(4, product.getPrice());
            statement.setString(5,product.getImage());
            statement.setInt(6,product.getIdcategory());
            statement.setInt(7,product.getId());


            //UPDATE `demo2`.`products` SET `name` = ?, `color` = ?, `quantity` = ?, `price` = ? WHERE (`id` = ?)
            System.out.println(this.getClass() + " updateProduct: " + statement);
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}










