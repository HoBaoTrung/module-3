<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tạo sản phẩm mới</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">🆕 Tạo sản phẩm mới</h2>

    <form method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="name" name="name" required />
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Mô tả</label>
            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">Danh mục</label>
            <input type="text" class="form-control" id="category" name="category" />
        </div>

        <div class="mb-3">
            <label for="brand" class="form-label">Thương hiệu</label>
            <input type="text" class="form-control" id="brand" name="brand" />
        </div>

        <div class="row">
            <div class="mb-3 col-md-4">
                <label for="price" class="form-label">Giá (VND)</label>
                <input type="number" step="1000" class="form-control" id="price" name="price" required />
            </div>

            <div class="mb-3 col-md-4">
                <label for="quantity" class="form-label">Số lượng</label>
                <input type="number" class="form-control" id="quantity" name="quantity" required />
            </div>

            <div class="mb-3 col-md-4">
                <label for="unit" class="form-label">Đơn vị</label>
                <input type="text" class="form-control" id="unit" name="unit" />
            </div>
        </div>

        <div class="mb-3">
            <label for="imageUrl" class="form-label">URL hình ảnh</label>
            <input type="text" class="form-control" id="imageUrl" name="imageUrl" />
        </div>

        <div class="mb-3">
            <label class="form-label">Trạng thái</label>
            <select class="form-select" name="available" required>
                <option value="true" selected>Còn hàng</option>
                <option value="false">Hết hàng</option>
            </select>
        </div>

        <div class="d-flex justify-content-between">
            <a href="/products" class="btn btn-secondary">← Quay lại</a>
            <button type="submit" class="btn btn-primary">✅ Tạo sản phẩm</button>
        </div>
    </form>
</div>
</body>
</html>
