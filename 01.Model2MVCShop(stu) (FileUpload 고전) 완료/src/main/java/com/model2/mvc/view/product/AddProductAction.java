package com.model2.mvc.view.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;

public class AddProductAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (FileUpload.isMultipartContent(request)) {

			String temDir = "C:\\workspace\\01.Model2MVCShop(stu)\\src\\main\\webapp\\images\\uploadFiles";

			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			fileUpload.setSizeMax(1024 * 1024 * 10);
			fileUpload.setSizeThreshold(1024 * 100);

			if (request.getContentLength() < fileUpload.getSizeMax()) {
				ProductVO productVO = new ProductVO();

				StringTokenizer token = null;

				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size();
				for (int i = 0; i < Size; i++) {
					FileItem fileItem = (FileItem) fileItemList.get(i);
					if (fileItem.isFormField()) {
						if (fileItem.getFieldName().equals("manuDate")) {
							token = new StringTokenizer(fileItem.getString("euc-kr"), "-");
							String manuDate = token.nextToken() + token.nextToken() + token.nextToken();
							System.out.println("manudate������:"+manuDate);
							productVO.setManuDate(manuDate);
						} else if (fileItem.getFieldName().equals("prodName"))
							productVO.setProdName(fileItem.getString("euc-kr"));
						else if (fileItem.getFieldName().equals("prodDetail"))
							productVO.setProdDetail(fileItem.getString("euc-kr"));
						else if (fileItem.getFieldName().equals("price"))
							productVO.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
					} else {
						if (fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							if (idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
							System.out.println("idx"+idx);
							String fileName = fileItem.getName().substring(idx + 1);
							productVO.setFileName(fileName);
							System.out.println("filename"+fileName);
							try {
								File uploadFile = new File(temDir, fileName);
								fileItem.write(uploadFile);
							} catch (IOException e) {
								System.out.println(e);
							}
						} else {
							productVO.setFileName("../../images/empty.GIF");
						}
					}
				}
				ProductServiceImpl service = new ProductServiceImpl();
				System.out.println("��"+productVO);
				service.addProduct(productVO);
				request.setAttribute("productVO", productVO);
				
			} else {
				int overSize = (request.getContentLength() / 1000000);
				System.out.println("<script>alert('������ ũ��� 1MB�����Դϴ�. �ø��� ���� �뷮��" + overSize + "MB�Դϴ�');");
				System.out.println("history.back();</script>");
			}

		} else {
			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�");
		}

		return "forward:/product/readProduct.jsp";
	}
}
