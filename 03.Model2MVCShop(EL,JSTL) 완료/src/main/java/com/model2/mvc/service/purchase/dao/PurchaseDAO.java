package com.model2.mvc.service.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

public class PurchaseDAO {

	public PurchaseDAO() {
		// TODO Auto-generated constructor stub
	}

	public void insertPurchase(Purchase purchase) throws Exception {

		Connection con = DBUtil.getConnection();

		System.out.println(purchase.getDivyRequest());
		System.out.println(purchase.getReceiverPhone());
		String sql = "INSERT INTO transaction VALUES (seq_transaction_tran_no.nextval,?,?,?,?,?,?,?,?,sysdate,?)";
		PreparedStatement stmt = con.prepareStatement(sql);

		stmt.setInt(1, purchase.getPurchaseProd().getProdNo());
		stmt.setString(2, purchase.getBuyer().getUserId());
		stmt.setString(3, purchase.getPaymentOption());
		stmt.setString(4, purchase.getReceiverName());
		stmt.setString(5, purchase.getReceiverPhone());
		stmt.setString(6, purchase.getDivyAddr());
		stmt.setString(7, purchase.getDivyRequest());
		stmt.setString(8, purchase.getTranCode());
		stmt.setString(9, purchase.getDivyDate());

		stmt.executeUpdate();

		stmt.close(); // close
		con.close();
	}

	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		// hashmap��� map���� �������̽� �ڵ�
		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println("DAO����+buyerId"+buyerId);

		Connection con = DBUtil.getConnection();
		
		String sql="";
		if(buyerId.equals("admin")) {
		sql="SELECT * FROM transaction ORDER BY prod_no";;
		}else{
		sql = "SELECT * FROM transaction WHERE buyer_id='"+ buyerId +"' ORDER BY prod_no";
		}
		
		System.out.println("DAO search" + search.getSearchCondition() + search.getSearchKeyword());

		System.out.println("UserDAO::Original SQL :: " + sql);

		// ==> TotalCount GET
		int totalCount = this.getTotalCount(sql);
		System.out.println("UserDAO :: totalCount  :: " + totalCount);

		// ==> CurrentPage �Խù��� �޵��� Query �ٽñ���
		sql = makeCurrentPageSql(sql, search);
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();

		// HashMap<String, Object> map = new HashMap<String, Object>();
		// HashMap: ��ü�� �ڵ�=>list���

		List<Purchase> list = new ArrayList<Purchase>();
		while (rs.next()) {
			
			User user = new User();
			user.setUserId(rs.getString("buyer_id"));

			Product product=new Product();
			product.setProdNo(Integer.parseInt(rs.getString("prod_no")));
			
			Purchase purchase = new Purchase();
			purchase.setBuyer(user);
			purchase.setPurchaseProd(product);
			purchase.setTranNo(rs.getInt("TRAN_NO"));
			purchase.setPaymentOption(rs.getString("PAYMENT_OPTION"));
			purchase.setReceiverName(rs.getString("RECEIVER_NAME"));
			purchase.setReceiverPhone(rs.getString("RECEIVER_PHONE"));
			purchase.setDivyRequest(rs.getString("DLVY_REQUEST"));
			purchase.setTranCode(rs.getString("TRAN_STATUS_CODE"));
			purchase.setOrderDate(rs.getDate("ORDER_DATA"));
			purchase.setDivyDate(rs.getString("DLVY_DATE"));
			purchase.setDivyAddr(rs.getString("DEMAILADDR"));
			
			System.out.println("DAO purchaseVOȮ��:" + purchase);
			list.add(purchase);
			
		}

		// ==> totalCount ���� ����
		map.put("totalCount", new Integer(totalCount));

		// ==> currentPage �� �Խù� ���� ���� List ����
		map.put("list", list);

		rs.close();
		pStmt.close();
		con.close();

		return map;
	}

	public Purchase findPurchase(int prodNo) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "SELECT * FROM transaction WHERE prod_no=?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, prodNo);

		ResultSet rs = stmt.executeQuery();

		Purchase purchase = null;
		while (rs.next()) {
			User user = new User();
			user.setUserId(rs.getString("buyer_id"));
			
			Product product=new Product();
			product.setProdNo(prodNo);
			
			purchase = new Purchase();
			purchase.setBuyer(user);
			purchase.setPurchaseProd(product);
			purchase.setTranNo(rs.getInt("TRAN_NO"));
			purchase.setPaymentOption(rs.getString("PAYMENT_OPTION"));
			purchase.setReceiverName(rs.getString("RECEIVER_NAME"));
			purchase.setReceiverPhone(rs.getString("RECEIVER_PHONE"));
			purchase.setDivyRequest(rs.getString("DLVY_REQUEST"));
			purchase.setTranCode(rs.getString("TRAN_STATUS_CODE"));
			purchase.setOrderDate(rs.getDate("ORDER_DATA"));
			purchase.setDivyDate(rs.getString("DLVY_DATE"));
			purchase.setDivyAddr(rs.getString("DEMAILADDR"));

			System.out.println("DAO Ȯ��::findPurchase purchaseVO" + purchase);
			return purchase;
		}
		rs.close();
		stmt.close();
		con.close(); // �� �� close

		return purchase;
	}

	public void updatePurchase(Purchase purchase) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "UPDATE transaction SET RECEIVER_NAME=?,RECEIVER_PHONE=?,DEMAILADDR=?,DLVY_REQUEST=?,DLVY_DATE=? "
				+ "WHERE prod_no=?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, purchase.getReceiverName());
		stmt.setString(2, purchase.getReceiverPhone());
		stmt.setString(3, purchase.getDivyAddr());
		stmt.setString(4, purchase.getDivyRequest());
		stmt.setString(5, purchase.getDivyDate());
		stmt.setInt(6, purchase.getPurchaseProd().getProdNo());

		stmt.executeUpdate();

		stmt.close();
		con.close();
	}

	public void updateTranCode(Purchase purchase) throws Exception {

		Connection con = DBUtil.getConnection();
		String sql = "UPDATE transaction SET tran_status_code=? WHERE prod_no=? ";
		PreparedStatement stmt = con.prepareStatement(sql);
		
		stmt.setString(1, purchase.getTranCode());
		stmt.setInt(2, purchase.getPurchaseProd().getProdNo());

		stmt.executeUpdate();

		stmt.close();
		con.close();
	}

	// �Խ��� Page ó���� ���� ��ü Row(totalCount) return
	private int getTotalCount(String sql) throws Exception {
		sql = "SELECT COUNT(*) " + "FROM ( " + sql + ") countTable";
		Connection con = DBUtil.getConnection();
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();

		int totalCount = 0;
		if (rs.next()) {
			totalCount = rs.getInt(1);
		}

		pStmt.close();
		con.close();
		rs.close();

		return totalCount;
	}

	// �Խ��� currentPage Row �� return
	private String makeCurrentPageSql(String sql, Search search) {
		System.out.println(search.getCurrentPage() + " " + search.getPageSize());
		sql = "SELECT * " + "FROM (		SELECT inner_table. * ,  ROWNUM AS row_seq " + " 	FROM (	" + sql
				+ " ) inner_table " + "	WHERE ROWNUM <=" + search.getCurrentPage() * search.getPageSize() + " ) "
				+ "WHERE row_seq BETWEEN " + ((search.getCurrentPage() - 1) * search.getPageSize() + 1) + " AND "
				+ search.getCurrentPage() * search.getPageSize();

		System.out.println("PurchaseDAO :: make SQL :: " + sql);

		return sql;
	}
}