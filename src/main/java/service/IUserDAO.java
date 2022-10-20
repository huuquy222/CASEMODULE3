package service;


import model.User;
import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id) throws SQLException;

    public List<User> selectAllUsers() throws SQLException;

   public List<User> selectUsersPagging(int offset, int noOfRecords, String q);

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    boolean checkUserExists(String username, String password);

//    boolean checkUserExists(String username, String password);
}
