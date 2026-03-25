package com.itwill.shop.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderItemDelete")
@SuppressWarnings("serial")  
public class OrderServlet2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("----------------doget 호출------------------");
		String ordersNoStr = request.getParameter("ordersNo");
		String oiNoStr = request.getParameter("oiNo");

		if (ordersNoStr != null && oiNoStr != null) {
			int ordersNo = Integer.parseInt(ordersNoStr);
			int oiNo = Integer.parseInt(oiNoStr);

			try {
				OrderService orderService = new OrderService();
				boolean saveCheck = orderService.deleteOrderItem(ordersNo, oiNo);
			} catch (Exception e) {
				e.printStackTrace();
			}

			response.sendRedirect("orderDetailList.jsp?orderNo=" + ordersNo);
		} else {
			System.out.println("ordersNo 또는 oiNo가 null입니다!");
		}
	}
}