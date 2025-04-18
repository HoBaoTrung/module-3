package com.codegym.productmanagerment.service;

import com.codegym.productmanagerment.model.Product;

import java.text.Normalizer;
import java.util.*;
import java.util.regex.Pattern;

public class ProductServiceImpl implements ProductService {

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<Integer, Product>();
        products.put(1, new Product(1, "Laptop Pro 2024", "Laptop cao cấp", "Electronics",
                22000000.0, 10, "cái", "TechBrand", true, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3R1QBjo9YAo81awBNhzGEyqw5hqLcZnNy7A&s"));

        products.put(2, new Product(2, "Điện thoại X12", "Smartphone màn hình OLED", "Mobile",
                9990000.0, 25, "cái", "PhoneTech", true, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDHO_qrtcqQyUJmB5GP-S0hytDU6W_f0TiOQ&s"));

        products.put(3, new Product(3, "Tai nghe Bluetooth", "Tai nghe không dây chống ồn", "Accessories",
                120000.0, 50, "cái", "SoundPlus", true, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoxPXYRO2utVGSfpA5u2E9jQaaKI_001C5NQ&s"));

        products.put(4, new Product(4, "Bàn phím cơ", "Bàn phím cơ RGB", "Accessories",
                650000.5, 15, "cái", "KeyZone", false, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ7dzxnj_mZwAFlDOkNI6ZI6fU_kf_xqXikg&s"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product Product) {
        products.put(Product.getId(), Product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product product : products.values()) {
            if (product.getName().toLowerCase().contains(name.trim().toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }

    @Override
    public void update(int id, Product Product) {
        products.put(id, Product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
