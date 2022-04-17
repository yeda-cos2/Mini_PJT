package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;


//==> ȸ������ Dao CRUD ����
@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	public List<Purchase> getPurchaseList(Search search,String buyerId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buyerId", buyerId);
		map.put("search", search);
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}
	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception{
		sqlSession.update("PurchaseMapper.updateTranCode",purchase);
	}
//
	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount(Search search,String buyerId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buyerId", buyerId);
		map.put("search", search);
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}
}