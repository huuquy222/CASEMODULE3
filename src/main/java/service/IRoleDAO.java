package service;

import model.Country;
import model.Role;

import java.sql.SQLException;
import java.util.List;

public interface IRoleDAO {
    public void insertRole(Role role) throws SQLException;

    Role selectRole(int id);

    public List<Role> selectAllRole();
}
