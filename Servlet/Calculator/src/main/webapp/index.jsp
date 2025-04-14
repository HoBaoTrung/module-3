<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.calculator.Operator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple calculator</h1>

<form method="post" action="/result">
    <label>First operand:</label>
    <input type="text" name="firstNum" required/><br/><br/>
    <%
        request.setAttribute("operators", Operator.values());
    %>
    <label>Operator:</label>
    <select name="operator">
        <c:forEach items="${operators}" var="op">
            <option value="${op.name()}">${op.symbol} (${op.label})</option>
        </c:forEach>
    </select>
    <br/><br/>

    <label>Second operand:</label>
    <input type="text" name="secondNum" required/><br/><br/>

    <input type="submit" value="Calculate"/>
</form>

</body>
</html>