<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<br/>
<form action="display-discount" method="post">
    <label>Product Description:</label>
    <input type="text" name="description" required/><br/><br/>

    <label>List Price:</label>
    <input type="number" name="price" step="1000" min="0" required/><br/><br/>

    <label>Discount Percent:</label>
    <input type="number" name="percent" step="1" required/><br/><br/>

    <input type="submit" value="Calculate Discount"/>
</form>
</body>
</html>