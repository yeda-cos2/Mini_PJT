package com.model2.mvc.web.purchase;

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

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	/// Field
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	


	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public PurchaseRestController() {
		System.out.println(this.getClass());
	}

//
//	@RequestMapping(value = "json/addPurchase/{prodNo}", method = RequestMethod.GET)
//	public Product addPurchase(@PathVariable int prodNo) throws Exception {
//
//		System.out.println("/purchase/addPurchase : GET");
//		// Business Logic
//
//		System.out.println("prodNo="+prodNo);
//		
//		return productService.getProduct(prodNo);
//	}
	
//	@RequestMapping(value = "json/addPurchase", method = RequestMethod.POST)
//	public Map addPurchase(@RequestBody Purchase purchase,@RequestBody User user,@RequestBody Product product) throws Exception {
//
//		System.out.println("/purchase/addPurchase : POST");
//		// Business Logic
//
//		System.out.println("add시작, purchase="+purchase);
//		Product product1=productService.getProduct(purchase.getPurchaseProd().getProdNo());
////		product1.setTotal(product1.getTotal()-purchase.getPurchaseCount());
//
//		User user1=userService.getUser(purchase.getBuyer().getUserId());
//		System.out.println("user:"+user1);
//
//		purchase.setPurchaseProd(product1);
//		purchase.setBuyer(user1);
//		purchase.setTranCode("100");
//		System.out.println("purchase:"+purchase);
//		
//		purchaseService.addPurchase(purchase);
////		productService.updateProduct(product1);
//		
//		System.out.println("add끝");
//		
//		Map map=new HashMap();
//		map.put("purchase", purchase);
//		//map.put("product", product1);
//		
//		return map;
//	}

	
//	@RequestMapping(value = "json/getPurchase/{prodNo}", method = RequestMethod.GET)
//	public Purchase getPurchase(@PathVariable int prodNo) throws Exception {
//
//		System.out.println("/purchase/json/getPurchase : GET");
//
//		// Business Logic
//		return purchaseService.getPurchase(prodNo);
//	}
	
//	@RequestMapping(value = "json/updatePurchase", method = RequestMethod.POST)
//	public Purchase updatePurchase(@RequestBody Purchase purchase) throws Exception {
//
//		System.out.println("/purchase/updatePurchase : POST");
//		
//		// Business Logic
//		
//		System.out.println(purchase);
//		System.out.println("시작"+purchase.getProdName());
//		purchase.setManuDate(purchase.getManuDate().replace("-", ""));
//
//		purchaseService.updatePurchase(purchase);
//		
//		System.out.println("끝"+purchase.getProdName());
//		return purchaseService.getPurchase(purchase.getProdNo());
//	}
//	
//	@RequestMapping(value = "json/listPurchase", method = RequestMethod.POST)
//	public Map listPurchase(@RequestBody Search search) throws Exception {
//
//		System.out.println("/purchase/json/listPurchase : POST");
//		// Business Logic
//		System.out.println(pageUnit);
//		System.out.println(pageSize);
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		Map<String, Object> map = purchaseService.getPurchaseList(search);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		Map map2 = new HashMap();
//		map2.put("list", map.get("list"));
//		map2.put("resultPage", map);
//		map2.put("search", search);
//		System.out.println("map" + map);
//		return map2;
//	}
//	
}