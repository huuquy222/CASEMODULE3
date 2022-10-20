package service;

import model.Country;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ICountryDAO {
    public void insertCountry(Country country) throws SQLException;

    Country selectCountry(int id);

    public List<Country> selectAllCountry();

//    public boolean deleteCountry(int id) throws SQLException;
//
//    public boolean updateCountry(Country country) throws SQLException;


}
