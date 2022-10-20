package service;

import model.Category;
import model.Role;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryDAO {

    void insertCategory(Category category) throws SQLException;

    Category selectCategory(int id);

    public List<Category> selectAllCategory();
}
