package org.example.product_discount_calculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "displayDiscountServlet", value = "/display-discount")
public class DiscountServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
// Đặt encoding để đọc đúng tiếng Việt từ form
        request.setCharacterEncoding("UTF-8");

        // Đặt content type và encoding để xuất tiếng Việt ra trình duyệt
        response.setContentType("text/html; charset=UTF-8");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double percent = Double.parseDouble(request.getParameter("percent"));

        double discountAmount = price * percent * 0.01;
        double discountPrice = price - discountAmount;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<p><strong>Product Description:</strong> " + description + "</p>");
        writer.println("<p><strong>List Price:</strong>" + price +"</p>");
        writer.println("<p><strong>Discount Percent:</strong> " +percent + "</p>");
        writer.println("<p><strong>Discount Amount:</strong>"+ discountAmount+"</p>");
        writer.println("<p><strong>Discount Price:</strong>"+ discountPrice + "</p>");
        writer.println("</html>");

    }
}