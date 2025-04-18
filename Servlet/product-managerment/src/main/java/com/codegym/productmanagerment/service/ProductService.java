package com.codegym.productmanagerment.service;

import com.codegym.productmanagerment.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void save(Product Product);

    Product findById(int id);

    List<Product> findByName(String name);

    void update(int id, Product Product);

    void remove(int id);
}
