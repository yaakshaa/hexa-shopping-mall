package com.itwill.shop.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderAdd")
@SuppressWarnings("serial")
public class OrderAddServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("----------------dopost 호출------------------");
		
		try {
			HttpSession session = request.getSession();
			String memberId=(String)session.getAttribute("sMemberId");
			OrderService orderService = new OrderService();
			int productNo=Integer.parseInt(request.getParameter("productNo"));
			int qty=Integer.parseInt(request.getParameter("qty"));
			int ordersNo= orderService.saveProductToOrder(productNo,qty,memberId);
			response.sendRedirect("orderDetailList.jsp?orderNo="+ordersNo);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}

