package org.example.calculator;

import sun.rmi.server.Dispatcher;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "resultServlet", value = "/result")
public class CalculatorServlet extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        float firstNum = Float.parseFloat(request.getParameter("firstNum"));
        float secondNum = Float.parseFloat(request.getParameter("secondNum"));
        String operatorParam = request.getParameter("operator");
        try {
            Operator operator = Operator.valueOf(operatorParam); // ví dụ: "ADD", "SUBTRACT"
            float result = operator.apply(firstNum, secondNum);
            request.setAttribute("firstNum", firstNum);
            request.setAttribute("secondNum", secondNum);
            request.setAttribute("operator", operator); // bạn có thể dùng operator.getSymbol() ở JSP nếu cần
            request.setAttribute("result", result);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (IllegalArgumentException | ArithmeticException e) {
            response.getWriter().println("Lỗi: " + e.getMessage());
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}