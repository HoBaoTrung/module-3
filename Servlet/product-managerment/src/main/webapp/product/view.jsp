<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }

        .product-container {
            display: flex;
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            max-width: 700px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            max-width: 300px;
            border-radius: 6px;
        }

        .product-info {
            margin-left: 50px;
            margin-top: 20px;
        }

        .product-info h2 {
            margin-bottom: 10px;
        }

        .product-info p {
            margin: 6px 0;
        }

        .label {
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .product-container {
                flex-direction: column;
                text-align: center;
            }

            .product-image {
                margin: 0 auto;
            }

            .product-info {
                text-align: left;
            }
        }
    </style>
</head>
<body>
<div class="product-container">

    <img class="product-image" src="${product.imageUrl}" alt="${product.name}"/>

    <div class="product-info">
        <h2>${product.name}</h2>
        <p><span class="label">Mô tả:</span> ${product.description}</p>
        <p><span class="label">Danh mục:</span> ${product.category}</p>
        <p><span class="label">Thương hiệu:</span> ${product.brand}</p>
        <p><span class="label">Giá:</span>
            <fmt:setLocale value="vi_VN" /> <!-- Đặt locale cho Việt Nam (VND) -->
            <fmt:formatNumber value="${product.price}" type="currency" />
        </p>
        <p><span class="label">Số lượng:</span> ${product.quantity} ${product.unit}</p>
        <p><span class="label">Trạng thái:</span>
            <c:choose>
                <c:when test="${product.available}">Còn hàng</c:when>
                <c:otherwise>Hết hàng</c:otherwise>
            </c:choose>
        </p>
    </div>

</div>
</body>
</html>
