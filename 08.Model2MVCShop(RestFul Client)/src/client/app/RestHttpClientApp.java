package client.app;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Search;
import com.model2.mvc.service.domain.User;

public class RestHttpClientApp {

	// main Method
	public static void main(String[] args) throws Exception {

		////////////////////////////////////////////////////////////////////////////////////////////
		// �ּ��� �ϳ��� ó���ذ��� �ǽ�
		////////////////////////////////////////////////////////////////////////////////////////////

//		System.out.println("\n====================================\n");
//		RestHttpClientApp.getUserTest_JsonSimple();
//		RestHttpClientApp.getUserTest_Codehaus();

//		RestHttpClientApp.addUserTest_JsonSimple();
//		RestHttpClientApp.addUserTest_Codehaus();

//		RestHttpClientApp.updateUserTest_JsonSimple();
//		RestHttpClientApp.updateUserTest_Codehaus();

//		RestHttpClientApp.listUserTest_JsonSimple();
//		RestHttpClientApp.listUserTest_Codehaus();

//		RestHttpClientApp.LoginTest_JsonSimple();
//		RestHttpClientApp.LoginTest_Codehaus();		

//		RestHttpClientApp.checkDuplicationTest_JsonSimple();
//		RestHttpClientApp.checkDuplicationTest_Codehaus();		

//		System.out.println("\n====================================\n");

//		RestHttpClientApp.addProductTest_JsonSimple();
//		RestHttpClientApp.addProductTest_Codehaus();

//		RestHttpClientApp.getProductTest_JsonSimple();
//		RestHttpClientApp.getProductTest_Codehaus();

//		RestHttpClientApp.updateProductTest_JsonSimple();
//		RestHttpClientApp.updateProductTest_Codehaus();

//		RestHttpClientApp.listProductTest_JsonSimple();
//		RestHttpClientApp.listProductTest_Codehaus();

//		System.out.println("\n====================================\n");

//		RestHttpClientApp.addPurchaseTest_JsonSimple();
//		RestHttpClientApp.addPurchaseTest_Codehaus();

//		RestHttpClientApp.getPurchaseTest_JsonSimple();
//		RestHttpClientApp.getPurchaseTest_Codehaus();

//		RestHttpClientApp.updatePurchaseTest_JsonSimple();
//		RestHttpClientApp.updatePurchaseTest_Codehaus();

//		RestHttpClientApp.listPurchaseTest_JsonSimple();
//		RestHttpClientApp.listPurchaseTest_Codehaus();

//		RestHttpClientApp.listSaleTest_JsonSimple();
//		RestHttpClientApp.listSaleTest_Codehaus();

//		RestHttpClientApp.updateTranCodeTest_JsonSimple();
		RestHttpClientApp.updateTranCodeTest_Codehaus();
	}

//================================================================//
	// 1.1 Http Protocol GET Request : JsonSimple 3rd party lib ���
	public static void getUserTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/getUser/user09";

		// HttpGet : Http Protocol �� GET ��� Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol ���� Message �߻�ȭ
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	// 1.2 Http Protocol GET Request : JsonSimple + codehaus 3rd party lib ���
	public static void getUserTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/getUser/admin";

		// HttpGet : Http Protocol �� GET ��� Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol ���� Message �߻�ȭ
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonobj);
		System.out.println("Br" + br);

		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.toString(), User.class);
		System.out.println(user);
	}

//================================================================//	
	public static void addUserTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/addUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("userId", "user25");
		json.put("password", "1234");
		json.put("userName", "ȫ�浿");

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	// 1.2 Http Protocol GET Request : JsonSimple + codehaus 3rd party lib ���
	public static void addUserTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/addUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 3 : codehaus ���]
		User user01 = new User();
		user01.setUserId("user100");
		user01.setUserName("�����");
		user01.setPassword("1111");
		user01.setPhone("111-2222-3333");

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(user01);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.toString(), User.class);
		System.out.println(user);
	}

	// ================================================================//
	public static void updateUserTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/updateUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("userId", "user50");
		json.put("password", "1111");
		json.put("userName", "������");
		json.put("addr", "������");
		json.put("phone", "010-3028-7625");
		json.put("email", "11@daum.net");

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	public static void updateUserTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/updateUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 3 : codehaus ���]
		User user01 = new User();
		user01.setUserId("admin");
		user01.setUserName("aaa");
		user01.setAddr("����");
		user01.setEmail("aaa");
		user01.setPhone("010-222-555");

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(user01);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		// System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
//		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
//		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(serverData, User.class);
		System.out.println(user);
	}

	public static void checkDuplicationTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/checkDuplication";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 1 : String ���]
//			String data =  "{\"userId\":\"admin\",\"password\":\"1234\"}";
//			HttpEntity httpEntity01 = new StringEntity(data,"utf-8");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("userId", "user50");
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}

//================================================================//
	// 2.1 Http Protocol POST Request : FromData ���� / JsonSimple 3rd party lib ���
	public static void LoginTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/login";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 1 : String ���]
//			String data =  "{\"userId\":\"admin\",\"password\":\"1234\"}";
//			HttpEntity httpEntity01 = new StringEntity(data,"utf-8");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("userId", "admin");
		json.put("password", "1234");
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

	}

	// 2.2 Http Protocol POST ��� Request : FromData����
	// ==> JsonSimple + codehaus 3rd party lib ���
	public static void LoginTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/login";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

//		//[ ��� 1 : String ���]
//		String data =  "{\"userId\":\"admin\",\"password\":\"1234\"}";
//		HttpEntity httpEntity01 = new StringEntity(data,"utf-8");

//		//[ ��� 2 : JSONObject ���]
//		JSONObject json = new JSONObject();
//		json.put("userId", "admin");
//		json.put("password", "1234");
//		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		// [ ��� 3 : codehaus ���]
		User user01 = new User();
		user01.setUserId("admin");
		user01.setPassword("1234");
		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(user01);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		// System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		// String serverData = br.readLine();
		// System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.toString(), User.class);
		System.out.println(user);
	}

	public static void listUserTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/listUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("currentPage", 1);

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj.get("list"));
	}

	public static void listUserTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/listUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Search search = new Search();
		search.setCurrentPage(1);

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ

		String jsonValue = objectMapper01.writeValueAsString(search);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		System.out.println("��");
		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonobj.get("list"));

//		ObjectMapper objectMapper = new ObjectMapper();
//		 User user = objectMapper.readValue(jsonobj.toString(), User.class);
//		 System.out.println(user);
	}

	public static void addProductTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/addProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("prodName", "������");
		json.put("prodDetail", "����");
		json.put("fileName", "����.jpg");
		json.put("price", 10000);
		json.put("total", 5);
		json.put("manuDate", "2022-04-22");

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}

	public static void addProductTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/addProduct";

		// HttpGet : Http Protocol �� GET ��� Request
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Product product1 = new Product();
		product1.setProdName("���콺");
		product1.setProdDetail("���콺�Դϴ�");
		product1.setFileName("���콺.jpg");
		product1.setPrice(5000);
		product1.setManuDate("2000-08-09");

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(product1);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.get("product").toString(), Product.class);
		System.out.println(product);
	}

	public static void getProductTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/getProduct/10000";
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		System.out.println(product);
	}

	public static void getProductTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/getProduct/10000";

		// HttpGet : Http Protocol �� GET ��� Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol ���� Message �߻�ȭ
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		System.out.println(product);
	}

	public static void updateProductTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/updateProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("prodNo", 10012);
		json.put("prodName", "��");
		json.put("prodDetail", "������");
		json.put("manuDate", "2022-04-24");
		json.put("fileName", "010.jpg");
		json.put("price", 400);

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	public static void updateProductTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/updateProduct";

		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 3 : codehaus ���]
		Product product1 = new Product();
		product1.setProdNo(10011);
		product1.setProdName("�����");
		product1.setProdDetail("����");
		product1.setManuDate("1996-02-02");
		product1.setFileName("url.jpg");
		product1.setPrice(1);

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(product1);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		// System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		System.out.println(product);

	}

	public static void listProductTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/listProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("currentPage", 1);

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj.get("list"));
	}

	public static void listProductTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/listProduct";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Search search = new Search();
		search.setCurrentPage(1);

		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj.get("list"));

	}

	public static void addPurchaseTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/addPurchase";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Map map1=new HashMap();
		map1.put("prodNo", 10000);
		
		Map map2=new HashMap();
		map2.put("userId", "user08");
		
		
		JSONObject json = new JSONObject();
		json.put("paymentOption", "2");
		json.put("receiverName", "mun");
		json.put("receiverPhone", "111-5222-555");
		json.put("divyAddr", "aa");
		json.put("divyRequest", "bb");
		json.put("divyDate", "2022-04-22");
		json.put("purchaseCount", 1);
		json.put("buyer", map2);
		json.put("purchaseProd", map1);
		
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

	}

	public static void addPurchaseTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/addPurchase";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 3 : codehaus ���]
		Product product = new Product();
		product.setProdNo(10000);

		User user = new User();
		user.setUserId("user09");

		Purchase purchase = new Purchase();
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setDivyRequest("�ּ���");
		purchase.setDivyAddr("������");
		// purchase.setDivyDate("2022-02-54");
		purchase.setDivyDate("");
		purchase.setPaymentOption("1");
		purchase.setPurchaseCount(1);
		purchase.setReceiverName("SCOTT");
		// purchase.setReceiverPhone("010-2774-5859");
		purchase.setReceiverPhone("");

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(purchase);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

//		 ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}
	
	public static void getPurchaseTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/getPurchase/10000";
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		
	}

	public static void getPurchaseTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/getPurchase/10000";

		// HttpGet : Http Protocol �� GET ��� Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol ���� Message �߻�ȭ
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Purchase purchase = objectMapper.readValue(jsonobj.toString(), Purchase.class);
		System.out.println(purchase);
	}
	
	public static void updatePurchaseTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updatePurchase";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("tranNo", 10000);
		json.put("receiverName", "ũ��Ű");
		json.put("receiverPhone", "010-2222-8888");
		json.put("divyAddr", "��Ʈ");
		json.put("divyRequest", "������");
		json.put("divyDate", "2022-01-22");
		json.put("purchaseCount", 1);

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	public static void updatePurchaseTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updatePurchase";

		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 3 : codehaus ���]
		Purchase purchase1=new Purchase();
		purchase1.setReceiverName("���ݸ�");
		purchase1.setDivyAddr("��ȭ");
		purchase1.setDivyDate("2022-04-26");
		purchase1.setPurchaseCount(1);
		purchase1.setTranNo(10000);
		purchase1.setReceiverPhone("010-3028-7777");
		purchase1.setDivyRequest("������");

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(purchase1);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		// System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Purchase purchase = objectMapper.readValue(jsonobj.toString(), Purchase.class);
		System.out.println(purchase);

	}

	public static void listPurchaseTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/listPurchase/user09";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("currentPage", 1);

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj.get("list"));
	}

	public static void listPurchaseTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/listPurchase/user09";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Search search = new Search();
		search.setCurrentPage(1);
		

		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj.get("list"));

	}
	
	public static void listSaleTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/listSale/user09";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("currentPage", 1);

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj.get("list"));
	}

	public static void listSaleTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/listSale/user09";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		Search search = new Search();
		search.setCurrentPage(1);
		

		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> API Ȯ�� : Stream ��ü�� ���� ����
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj.get("list"));

	}
	
	public static void updateTranCodeTest_JsonSimple() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updateTranCode";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 2 : JSONObject ���]
		JSONObject json = new JSONObject();
		json.put("tranNo", 10000);
		

		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> �����б�(JSON Value Ȯ��)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	public static void updateTranCodeTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol �� client �߻�ȭ
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/purchase/json/updateTranCode";

		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ ��� 3 : codehaus ���]
		Purchase purchase1=new Purchase();
		purchase1.setTranNo(10001);

		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value �� ��ȯ
		String jsonValue = objectMapper01.writeValueAsString(purchase1);

		System.out.println(jsonValue);

		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> �ٸ� ������� serverData ó��
		// System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Purchase purchase = objectMapper.readValue(jsonobj.toString(), Purchase.class);
		System.out.println(purchase);

	}
}