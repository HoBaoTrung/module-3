<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Converter</title>
</head>
<body>
<%
    float rate = Float.parseFloat(request.getParameter("rate"));
    float usd = Float.parseFloat(request.getParameter("usd"));

    float vnd = rate * usd;

%>
<c:set scope="request" var="rate" value="<%=rate%>" />
<c:set scope="request" var="usd" value="<%=usd%>" />
<c:set scope="request" var="vnd" value="<%=vnd%>" />
<h1>Rate:
    <fmt:setLocale value="vi_VN" />
    <fmt:formatNumber value="${rate}" type="currency" currencyCode="VND" />
</h1>
<h1>USD:
    <fmt:setLocale value="en_US" />
    <fmt:formatNumber value="${usd}" type="currency" currencyCode="USD" />
</h1>
<h1>VND:
    <fmt:setLocale value="vi_VN" />
    <fmt:formatNumber value="${vnd}" type="currency" currencyCode="VND" /></h1>
</body>
</html>