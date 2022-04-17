package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.util.CommonUtil;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;


public class AddProductAction extends Action {

	@Override
	public String execute(	HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		System.out.println("AddAction.java ����");
		Product product=new Product();
		product.setProdName(request.getParameter("prodName"));
		product.setProdDetail(request.getParameter("prodDetail"));
		product.setManuDate(request.getParameter("manuDate").replace("-", ""));
		System.out.println("todate�׽�Ʈ:"+CommonUtil.toDateStr(request.getParameter("manuDate")));
//		product.setManuDate(CommonUtil.toDateStr(request.getParameter("manuDate")));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setFileName(request.getParameter("fileName"));
		System.out.println("product setȮ��: "+product);
		
		ProductService service=new ProductServiceImpl();
		service.addProduct(product);
		request.setAttribute("product", product);
		
		return "forward:/product/readProduct.jsp";
	}
}