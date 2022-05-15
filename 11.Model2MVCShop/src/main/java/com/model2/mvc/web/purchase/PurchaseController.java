package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	///Field
		@Autowired
		@Qualifier("purchaseServiceImpl")
		private PurchaseService purchaseService;
		
		@Autowired
		@Qualifier("productServiceImpl")
		private ProductService productService;
		
		@Autowired
		@Qualifier("reviewServiceImpl")
		private ReviewService reviewService;
		
		//setter Method 구현 않음
			
		public PurchaseController() {
			System.out.println(this.getClass());
		}
		
		//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
		//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		//@RequestMapping("/addPurchaseView.do")
		@RequestMapping( value="addPurchase", method=RequestMethod.GET )
		public ModelAndView addPurchase(@ModelAttribute("product") Product product) throws Exception {

			System.out.println("addPurchase Get");
			
			System.out.println("/purchase/addPurchase : GET");
			Product product1=productService.getProduct(product.getProdNo());
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("product",product1);
			modelAndView.setViewName("forward:/purchase/addPurchaseView.jsp");
			return modelAndView;
		}
		
		//@RequestMapping("/addPurchase.do")
		@RequestMapping( value="addPurchase", method=RequestMethod.POST )
		public ModelAndView addPurchase(  @ModelAttribute("purchase") Purchase purchase,@ModelAttribute("product") Product product
				, HttpServletRequest request) throws Exception {
			
			System.out.println("/purchase/addPurchase : POST");
			//Business Logic
			String a=purchase.getDivyDate().replace("/", "");
			System.out.println("aaa: "+a);
			System.out.println("bbb: "+a.substring(4,8)+a.substring(0,4));
			System.out.println("prodNo="+product.getProdNo());
			
			Product product1=productService.getProduct(product.getProdNo());
			product1.setTotal(product1.getTotal()-purchase.getPurchaseCount());
			if(product1.getFileName()==null){
				product1.setFileName("");
				}
			
			purchase.setPurchaseProd(product1);
			

			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");			
			purchase.setBuyer(user);
			
			//String a=purchase.getDivyDate().replace("/", "");
			System.out.println("여기"+a.substring(4,8)+a.substring(0,4));
			purchase.setDivyDate(a.substring(4,8)+a.substring(0,4));
			
			purchase.setTranCode("100");
			
			System.out.println("purchaseporrr:"+purchase);
			
			purchaseService.addPurchase(purchase);
			productService.updateProduct(product1);
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject(purchase);
			modelAndView.setViewName("forward:/purchase/readPurchase.jsp");
			
			return modelAndView;
		}
		
		//@RequestMapping("/getPurchase.do")
		@RequestMapping( value="getPurchase" )
		public ModelAndView getPurchase( @ModelAttribute("purchase") Purchase purchase,@RequestParam("tranNo") int tranNo) throws Exception {
			
			System.out.println("/purchase/getPurchase : GET, POST");
			//Business Logic
			Purchase purchase1 = purchaseService.getPurchase(tranNo);
			
			// Model 과 View 연결
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject(purchase1);
			
			modelAndView.setViewName("forward:/purchase/getPurchase.jsp");
			
			return modelAndView;
		}
		
		//@RequestMapping("/updatePurchaseView.do")
		@RequestMapping( value="updatePurchase", method=RequestMethod.GET )

		public ModelAndView updatePurchase( @ModelAttribute("purchase") Purchase purchase,@RequestParam("tranNo") int tranNo ) throws Exception{

			System.out.println("/purchase/updatePurchase : GET");
			//Business Logic
			Purchase purchase1 = purchaseService.getPurchase(tranNo);
			// Model 과 View 연결
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject(purchase1);
			modelAndView.setViewName("forward:/purchase/updatePurchaseView.jsp");
			
			
			return modelAndView;
		}
		
		//@RequestMapping("/updatePurchase.do")
		@RequestMapping( value="updatePurchase", method=RequestMethod.POST )

		public ModelAndView updatePurchase( @ModelAttribute("purchase") Purchase purchase) throws Exception{

			System.out.println("/purchase/updatePurchase : POST");
			//Business Logic
			
			System.out.println("테스트:"+purchase);

			purchaseService.updatePurchase(purchase);
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject(purchase);
			modelAndView.setViewName("forward:/purchase/getPurchase");
			
			return modelAndView;
		}
		
		//@RequestMapping("/updateTranCode.do")
		@RequestMapping( value="updateTranCode" )
		public ModelAndView updateTranCode( @ModelAttribute("purchase") Purchase purchase,
				@RequestParam("menu") String menu,
				@RequestParam("tranNo") int tranNo) throws Exception{

			System.out.println("/purchase/updateTranCode : GET,Post");
			//Business Logic
			String tranCode=purchase.getTranCode();
			Purchase purchase1=purchaseService.getPurchase(tranNo);
			
			System.out.println("trancode전:"+tranCode);
			
			
			if(tranCode.equals("100")) {
				tranCode="200";
			}else if(tranCode.equals("200")) {
				tranCode="300";
			}
			
			System.out.println("trancode후:"+tranCode);
			
			purchase1.setTranCode(tranCode);

			purchaseService.updateTranCode(purchase1);
			
		
			System.out.println("음음"+purchase1);
			
			ModelAndView modelAndView=new ModelAndView();
			if(tranCode.equals("000")) {
			Product product2=productService.getProduct(purchase1.getPurchaseProd().getProdNo());	
			product2.setTotal(purchase1.getPurchaseCount()+product2.getTotal());
			if(product2.getFileName()==null) {
			product2.setFileName("");
			}
			productService.updateProduct(product2);
			}
			
			if(tranCode.equals("200")) {
			modelAndView.setViewName("forward:/purchase/listSale");
			}
			else {
			modelAndView.setViewName("forward:/purchase/listPurchase");
			}
			
			return modelAndView;
		}
		
		//@RequestMapping("/listPurchase.do")
		@RequestMapping( value="listPurchase" )

		public ModelAndView listPurchase( @ModelAttribute("search") Search search ,  HttpServletRequest request) throws Exception{
			
			System.out.println("/purchase/listPurchase : GET,Post");
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			
			// Business logic 수행
			Map<String , Object> map=purchaseService.getPurchaseList(search,user.getUserId());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			// Model 과 View 연결
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			
			modelAndView.setViewName("forward:/purchase/listPurchase.jsp");
			
			
			return modelAndView;
		}
		
		//@RequestMapping("/listSale.do")
		@RequestMapping( value="listSale" )

		public ModelAndView listSale( @ModelAttribute("search") Search search ,  HttpServletRequest request) throws Exception{
			
			System.out.println("/purchase/listSale : GET,Post");
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			
			// Business logic 수행
			Map<String , Object> map=purchaseService.getPurchaseList(search,user.getUserId());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			// Model 과 View 연결
			
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			
			modelAndView.setViewName("forward:/purchase/listSale.jsp");
			
			
			return modelAndView;
		}

//		
//		@RequestMapping( value="reviewPurchase" )
//		public void reviewPurchase(@ModelAttribute("review") Review review, @RequestParam("tranNo") int tranNo ) throws Exception{
//
//			System.out.println("/purchase/reviewPurchase : TRANnO"+tranNo);
//			System.out.println(review);
//			
//			ModelAndView modelAndView=new ModelAndView();
//			modelAndView.setViewName("forward:/purchase/listPurchase.jsp");
//
//		//return modelAndView;
//		}
//			
}
