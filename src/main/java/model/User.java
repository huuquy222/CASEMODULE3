package model;

public class User {
    protected int id;
    protected String name;
    protected String email;
    protected String password;
    protected int country;
    protected String address;
    protected int idrole;

    public User(String name, String email,String password, int country,String address, int idrole) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.country = country;
        this.address = address;
        this.idrole = idrole;
    }

    public User(int id, String name, String email,String password, int country,String address, int idrole) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.country = country;
        this.address = address;
        this.idrole = idrole;
    }

    public User() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCountry() {
        return country;
    }

    public void setCountry(int country) {
        this.country = country;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIdrole() {
        return idrole;
    }

    public void setIdrole(int idrole) {
        this.idrole = idrole;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
