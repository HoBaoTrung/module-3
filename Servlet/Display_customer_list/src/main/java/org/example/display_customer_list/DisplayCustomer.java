package org.example.display_customer_list;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "displayCustomer", urlPatterns = "/display-customer")
public class DisplayCustomer extends HttpServlet {
    List<Customer> customers = new ArrayList<Customer>();

    public void init() {
        List<Customer> data = Arrays.asList(
                new Customer("Nguyễn Văn A", "15/05/1990", "123 Đường Láng, Hà Nội", "https://images.squarespace-cdn.com/content/v1/656f4e4dababbd7c042c4946/82bec838-05c8-4d68-b173-2284a6ad4e52/how-to-stop-being-a-people-pleaser"),
                new Customer("Trần Thị B", "20/11/1985", "456 Nguyễn Huệ, TP.HCM", "https://t4.ftcdn.net/jpg/03/96/16/79/360_F_396167959_aAhZiGlJoeXOBHivMvaO0Aloxvhg3eVT.jpg"),
                new Customer("Lê Văn C", "30/01/1995", "789 Hải Phòng, Đà Nẵng", "https://t4.ftcdn.net/jpg/05/23/62/91/360_F_523629123_RpAModBJXgCTPfilfYaCIbPaalFIjbvv.jpg"),
                new Customer("Phạm Thị D", "12/09/1988", "321 Lê Duẩn, Cần Thơ", "https://t3.ftcdn.net/jpg/05/83/94/50/360_F_583945057_KQ9qplYNBcN6Jhro84MBOJ57Yc1BJegL.jpg")
        );
        customers.addAll(data);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       request.setAttribute("customers", customers);

        // 3. Chuyển hướng sang trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}