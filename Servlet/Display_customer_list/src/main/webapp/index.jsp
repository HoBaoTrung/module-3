<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .customer-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
        }
    </style>
</head>
<body>
<a href="/display-customer">
    Hiển thị
</a>

<div class="container mt-5">
    <h1 class="text-center mb-4">Danh sách khách hàng</h1>
    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>Ảnh</th>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
        </tr>
        </thead>
        <tbody>
        <!-- Dữ liệu khách hàng (có thể thay bằng List từ Servlet) -->
        <c:forEach items="${customers}" var="customer">

            <tr>
                <td>
                    <img src="${customer.image}" alt="Ảnh khách hàng" class="customer-img">
                </td>
                <td>${customer.name}</td>
                <td>${customer.birthday}</td>
                <td>${customer.address}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>