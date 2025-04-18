<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome (icon đẹp) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            padding: 20px;
            background-color: #f5f5f5;
        }

        .product-item {
            margin-bottom: 20px;
            transition: transform 0.3s ease;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .product-item:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .image-container {
            position: relative;
            width: 100%;
            padding-top: 75%; /* 4:3 Aspect Ratio */
            overflow: hidden;
        }

        .product-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

    </style>
</head>
<body>

<div class="container mt-5">

    <a href="/products?action=create">
        <button type="button" class="btn btn-warning">Thêm sản phẩm</button>
    </a>

    <form class="row g-2 align-items-center mt-3">
        <div class="col-auto">
            <input class="form-control" type="search" placeholder="Search" aria-label="Search"
                   name="searchName" >
        </div>
        <div class="col-auto">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </div>
    </form>

    <h2 class="mb-4">Danh sách sản phẩm</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <c:forEach items="${products}" var="p">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="product-item">
                    <div class="card h-100 shadow-sm">
                        <div class="image-container">
                            <img src="${p.imageUrl}" class="card-img-top product-image" alt="${p.name}"
                                 onerror="this.src='https://via.placeholder.com/300x200'">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${p.name}
                            </h5>
                            <p class="card-text text-danger fw-bold">
                                <fmt:setLocale value="vi_VN" /> <!-- Đặt locale cho Việt Nam (VND) -->
                                <fmt:formatNumber value="${p.price}" type="currency" />
                            </p>
                            <a href="/products?action=view&id=${p.getId()}"
                               class="btn btn-primary w-100 mb-3">
                                Xem chi tiết
                            </a>
                            <div style="gap: 10px; display: flex">
                                <a href="/products?action=edit&id=${p.getId()}"
                                   class="btn btn-info w-100 mb-3">
                                    Sửa
                                </a>

                                <a href="/products?action=delete&id=${p.getId()}"
                                   class="btn btn-danger w-100 mb-3">
                                    Xóa
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>


</body>
</html>
