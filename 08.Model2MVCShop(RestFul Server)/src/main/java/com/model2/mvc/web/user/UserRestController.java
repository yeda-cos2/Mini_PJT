package com.model2.mvc.web.user;

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
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	// setter Method 구현 않음

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public UserRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "json/getUser/{userId}", method = RequestMethod.GET)
	public User getUser(@PathVariable String userId) throws Exception {

		System.out.println("/user/json/getUser : GET");

		// Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping(value = "json/addUser", method = RequestMethod.POST)
	public User addUser(@RequestBody User user) throws Exception {

		System.out.println("/user/addUser : POST");
		// Business Logic

		System.out.println(user.getUserId());
		userService.addUser(user);

		return userService.getUser(user.getUserId());
	}

	@RequestMapping(value = "json/updateUser", method = RequestMethod.POST)
	public User updateUser(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/updateUser : POST");

		// Business Logic

		System.out.println(user.getUserId());
		System.out.println(user);
		userService.updateUser(user);

		System.out.println("끝");
		return userService.getUser(user.getUserId());
	}

	@RequestMapping(value = "json/checkDuplication", method = RequestMethod.POST)
	public Map checkDuplication(@RequestBody User user) throws Exception {

		System.out.println("/user/json/checkDuplication : POST");
		// Business Logic
		boolean result = userService.checkDuplication(user.getUserId());
		Map map = new HashMap();
		map.put("result", result);
		map.put("userId", user.getUserId());

		return map;
	}

	@RequestMapping(value = "json/listUser", method = RequestMethod.POST)
	public Map listUser(@RequestBody Search search) throws Exception {

		System.out.println("/user/json/listUser : POST");
		// Business Logic
		System.out.println(pageUnit);
		System.out.println(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

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

	@RequestMapping(value = "json/login", method = RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/json/login : POST");
		// Business Logic
		System.out.println("::" + user);
		User dbUser = userService.getUser(user.getUserId());

		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}

		return dbUser;
	}
}