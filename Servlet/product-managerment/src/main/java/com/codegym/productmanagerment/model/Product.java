package com.codegym.productmanagerment.model;

public class Product {
    private int id;
    private String name;
    private String description;
    private String category;
    private Double price;
    private Integer quantity;
    private String unit; // đơn vị tính, ví dụ: cái, hộp, kg
    private String brand;
    private boolean available;
    private String imageUrl;

    // Constructors
    public Product() {
    }

    public Product(int id, String name, String description, String category,
                   Double price, Integer quantity, String unit,
                   String brand, boolean available, String imageUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
        this.unit = unit;
        this.brand = brand;
        this.available = available;
        this.imageUrl = imageUrl;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public boolean isAvailable() { return available; }
    public void setAvailable(boolean available) { this.available = available; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    // toString()
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", category='" + category + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", unit='" + unit + '\'' +
                ", brand='" + brand + '\'' +
                ", available=" + available +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}

