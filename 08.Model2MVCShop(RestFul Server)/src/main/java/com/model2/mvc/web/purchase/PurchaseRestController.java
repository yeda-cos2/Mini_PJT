package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

//==> ȸ?????? RestController
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


	@RequestMapping(value = "json/addPurchase/{prodNo}", method = RequestMethod.GET)
	public Product addPurchase(@PathVariable int prodNo) throws Exception {

		System.out.println("/purchase/addPurchase : GET");
		// Business Logic
		
		System.out.println("prodNo="+prodNo);
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value = "json/addPurchase")
	public Map addPurchase(@RequestBody Purchase purchase) throws Exception {

		System.out.println("/purchase/addPurchase : POST");
		// Business Logic
		System.out.println("add????, purchase="+purchase);
		Product product1=productService.getProduct(purchase.getPurchaseProd().getProdNo());
		product1.setTotal(product1.getTotal()-purchase.getPurchaseCount());
		System.out.println("????:"+(product1.getTotal()-purchase.getPurchaseCount()));
		
		User user1=userService.getUser(purchase.getBuyer().getUserId());
		System.out.println("user:"+user1);

		purchase.setPurchaseProd(product1);
		purchase.setBuyer(user1);
		purchase.setTranCode("100");
		purchase.setReceiverPhone(purchase.getReceiverPhone().replace("-", ""));
		purchase.setDivyDate(purchase.getDivyDate().replace("-", ""));
		System.out.println("purchase:"+purchase);
		
		purchaseService.addPurchase(purchase);
		System.out.println("?־ȵ?");
		productService.updateProduct(product1);
		
		System.out.println("add??");
		
		Map map=new HashMap();
		map.put("purchase", purchase);
		map.put("product", product1);
		
		return map;
	}

	
	@RequestMapping(value = "json/getPurchase/{tranNo}", method = RequestMethod.GET)
	public Purchase getPurchase(@PathVariable int tranNo) throws Exception {

		System.out.println("/purchase/json/getPurchase : GET");
		System.out.println(tranNo);

		// Business Logic
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value = "json/updatePurchase", method = RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase) throws Exception {

		System.out.println("/purchase/updatePurchase : POST");
		
		// Business Logic
		
		System.out.println(purchase);
		System.out.println("????"+purchase.getReceiverPhone());
		purchase.setReceiverPhone(purchase.getReceiverPhone().replace("-", ""));
		purchase.setDivyDate(purchase.getDivyDate().replace("-", ""));

		purchaseService.updatePurchase(purchase);
		
		System.out.println("??");
		return purchaseService.getPurchase(purchase.getTranNo());
	}
	
	@RequestMapping(value = "json/listPurchase/{buyerId}", method = RequestMethod.POST)
	public Map listPurchase(@RequestBody Search search,@PathVariable String buyerId) throws Exception {

		System.out.println("/purchase/json/listPurchase : POST");
		// Business Logic
		System.out.println(pageUnit);
		System.out.println(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getPurchaseList(search, buyerId);

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
	
	@RequestMapping(value = "json/listSale/{buyerId}", method = RequestMethod.POST)
	public Map listSale(@RequestBody Search search,@PathVariable String buyerId) throws Exception {

		System.out.println("/purchase/json/listSale : POST");
		// Business Logic
		System.out.println(pageUnit);
		System.out.println(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getPurchaseList(search, buyerId);

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
	
	@RequestMapping(value = "json/updateTranCode", method = RequestMethod.POST)
	public Purchase updateTranCode(@RequestBody Purchase purchase) throws Exception {

		System.out.println("/purchase/updatePurchase : POST");
		
		// Business Logic
		Purchase purchase1=purchaseService.getPurchase(purchase.getTranNo());
		System.out.println(purchase1.getTranCode());
		
		if(purchase1.getTranCode().equals("100")) {
			purchase1.setTranCode("200");
		}else if(purchase1.getTranCode().equals("200")) {
			purchase1.setTranCode("300");
		}
		
		System.out.println(purchase1.getTranCode());

		
		purchaseService.updateTranCode(purchase1);

		if(purchase1.getTranCode().equals("000")) {
			Product product2=productService.getProduct(purchase1.getPurchaseProd().getProdNo());	
			product2.setTotal(purchase1.getPurchaseCount()+product2.getTotal());
			productService.updateProduct(product2);
			}
		
		System.out.println("??");
		return purchaseService.getPurchase(purchase1.getTranNo());
	}
}