package com.model2.mvc.view.product;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.domain.Product;

public class GetProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		System.out.println("Get.java����, prodNo �Ѱܹ޾ҳ�: " + prodNo);

		ProductService service = new ProductServiceImpl();
		Product product = service.getProduct(prodNo);
		System.out.println("productVO ����:" + product);

		request.setAttribute("product", product);
		System.out.println("menu: " + request.getParameter("menu"));

		Cookie[] cookies = request.getCookies();

		if (cookies == null) {
			Cookie newCookie = new Cookie("history", prodNo + ",");
			response.addCookie(newCookie);

			System.out.println("NULL�� �� ����� ��Ű��" + newCookie.getValue());
		}

		String cv = "/" + prodNo;

		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];

				System.out.println("history ��Ű���� : " + cookie.getName());

				Cookie newCookie = new Cookie("history", request.getParameter("prodNo"));
				response.addCookie(newCookie);

				if (cookie.getName().equals("history")) {

					String str = cookie.getValue() + cv;

					Cookie newCookie02 = new Cookie("history", str);
					response.addCookie(newCookie02);

					System.out.println("Not NULL�� �� ����� ��Ű��" + cookie.getValue());
					System.out.println("Not NULL�� �� ����� ��Ű��" + str);
				}
			}
		}

		return "forward:/product/getProduct.jsp?menu=" + request.getParameter("menu");
	}
}