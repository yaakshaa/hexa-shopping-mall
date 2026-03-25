package com.itwill.shop.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderDelete")
@SuppressWarnings("serial")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("----------------doget 호출------------------");
		int orderNo=Integer.parseInt(request.getParameter("ordersNo"));
		
		try {
			OrderService orderService = new OrderService();
			boolean saveCheck= orderService.cancelOrder(orderNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("orderDetailList.jsp?orderNo="+orderNo+"&status=delete");
	}

}

