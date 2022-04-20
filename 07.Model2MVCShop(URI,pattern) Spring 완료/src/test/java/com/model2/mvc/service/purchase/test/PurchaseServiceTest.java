package com.model2.mvc.service.purchase.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;


/*
 *	FileName :  PurchaseServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	//@Test
	public void testAddPurchase() throws Exception {
		
		Purchase purchase = new Purchase();
		
		Product product=new Product();
		product.setProdNo(10001);
		purchase.setPurchaseProd(product);
		System.out.println(product);
		User user=new User();
		user.setUserId("user44");
		purchase.setBuyer(user);
		System.out.println(purchase.getBuyer());
		purchase.setPaymentOption("1");
		purchase.setReceiverName("������");
		purchase.setReceiverPhone("010-222-2222");
		purchase.setDivyAddr("����");
		purchase.setDivyRequest("�����ּ�");
		purchase.setTranCode("100");
		purchase.setDivyDate("2022-04-30");
		
		purchaseService.addPurchase(purchase);

	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		Purchase purchase = purchaseService.getPurchase(10019);

		//==> console Ȯ��
		System.out.println(purchase);
		
		//==> API Ȯ��
		Assert.assertEquals("����", purchase.getDivyAddr());
//		Assert.assertEquals("1", purchase.getPaymentOption());
		Assert.assertEquals("������", purchase.getReceiverName());
		Assert.assertEquals("010-222-2222", purchase.getReceiverPhone());
		Assert.assertEquals("100", purchase.getTranCode());
		Assert.assertEquals("�����ּ�", purchase.getDivyRequest());

		Assert.assertNotNull(purchaseService.getPurchase(10010));
//		Assert.assertNotNull(purchaseService.getPurchase(10000));
	}
	
	//@Test
	 public void testUpdatePurchase() throws Exception{
		 
		Purchase purchase = purchaseService.getPurchase(10019);
		Assert.assertNotNull(purchase);
		
		Assert.assertEquals("����", purchase.getDivyAddr());
		Assert.assertEquals("������", purchase.getReceiverName());
		Assert.assertEquals("010-222-2222", purchase.getReceiverPhone());
		Assert.assertEquals("100", purchase.getTranCode());
		Assert.assertEquals("�����ּ�", purchase.getDivyRequest());

		purchase.setReceiverName("�̻��");
		purchase.setReceiverPhone("000-111-222");
		purchase.setDivyAddr("��Ʈķ��");
		purchase.setDivyRequest("�����ȿ�");
		purchase.setDivyDate("2022-04-11");
		
		purchaseService.updatePurchase(purchase);
		
		Purchase rpurchase = purchaseService.getPurchase(10019);
		Assert.assertNotNull(purchase);
		
		//==> console Ȯ��
		System.out.println(purchase);
			
		//==> API Ȯ��
		Assert.assertEquals("��Ʈķ��", purchase.getDivyAddr());
		Assert.assertEquals("�̻��", purchase.getReceiverName());
		Assert.assertEquals("000-111-222", purchase.getReceiverPhone());
		Assert.assertEquals("100", purchase.getTranCode());
		Assert.assertEquals("�����ȿ�", purchase.getDivyRequest());
	 }
	 
	
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	@Test
	 public void testGetPurchaseListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, "admin");
	 	System.out.println("�ȳ�����"+map);
	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword("");
//	 	map = purchaseService.getPurchaseList(search,"user44");
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
//	 	System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
	 }
	 
	
}