package model;

public class Product {
    protected int id;
    protected String name;
    protected String color;
    protected int quantity;
    protected double price;
    protected String image;
    protected int idcategory;


    public Product() {
    }

    public Product(int id, String name, String color, int quantity, double price, String image,int idcategory) {
        super();
        this.id = id;
        this.name = name;
        this.color = color;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.idcategory = idcategory;
    }

    public Product(String name, String color, int quantity, double price, String image,int idcategory) {
        super();
        this.name = name;
        this.color = color;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.idcategory = idcategory;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getIdcategory() {
        return idcategory;
    }

    public void setIdcategory(int idcategory) {
        this.idcategory = idcategory;
    }
}
