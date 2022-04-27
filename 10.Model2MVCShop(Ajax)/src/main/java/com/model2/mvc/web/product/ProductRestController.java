package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	/// Field
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	


	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public ProductRestController() {
		System.out.println(this.getClass());
	}


	@RequestMapping(value = "json/addProduct", method = RequestMethod.POST)
	public Map addProduct(@RequestBody Product product) throws Exception {

		System.out.println("/product/addProduct : POST");
		// Business Logic

		System.out.println("add시작");
		product.setManuDate(product.getManuDate().replace("-", ""));

		productService.addProduct(product);
		System.out.println("add끝");
		
		Map map=new HashMap();
		map.put("product", product);
		
		return map;
	}

	
	@RequestMapping(value = "json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {

		System.out.println("/product/json/getProduct : GET");

		// Business Logic
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value = "json/updateProduct", method = RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception {

		System.out.println("/product/updateProduct : POST");
		
		// Business Logic
		
		System.out.println(product);
		System.out.println("시작"+product.getProdName());
		product.setManuDate(product.getManuDate().replace("-", ""));

		productService.updateProduct(product);
		
		System.out.println("끝"+product.getProdName());
		return productService.getProduct(product.getProdNo());
	}
	
	@RequestMapping(value = "json/listProduct", method = RequestMethod.POST)
	public Map listProduct(@RequestBody Search search) throws Exception {

		System.out.println("/product/json/listProduct : POST");
		// Business Logic
		System.out.println(pageUnit);
		System.out.println(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		
		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		Map map2 = new HashMap();
		map2.put("list", map.get("list"));
		map2.put("resultPage", map);
		map2.put("search", search);
		System.out.println("map" + map);
		return map2;
	}
	
}