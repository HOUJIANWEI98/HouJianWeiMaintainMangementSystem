package com.controller;


import javax.servlet.http.HttpSession;

import com.pojo.PunchClock;
import com.pojo.User;
import com.service.AhualyService;
import com.util.common.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Calendar;

/**
 * 
 * @author ahualy
 * 2019年3月23日 下午8:08:47
 * 如果请求路径中的参数token值和登录 时候生成的不一致时，应该报错，不给结果
 */


@Controller
public class CommonController {

	@Autowired
	@Qualifier("AhualyService")

	private AhualyService ahualyservice;//接口实现类对象

	@RequestMapping(value="/index")
	 public String index(String token,HttpSession session,String lang){
		String blank = "index";
		if(session.getAttribute("token")!=null&&session.getAttribute("token").equals(token)
				&&session.getAttribute("lang")!=null&&session.getAttribute("lang").equals(lang)) {
			return blank;
		}else {
			return "error";
		}
	}
	@RequestMapping(value="/welcome")
	 public String welcome(HttpSession session){
		// 做一个查询，查询该用户的打卡状态。
		User user = (User) session.getAttribute(Constants.USER_SESSION);
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);
		PunchClock punchClock = ahualyservice.getPunchClockByDateAndUserId(date,user.getId());
		if (punchClock!=null){
			session.setAttribute("sgin_status",punchClock.getSgin_status());
			session.setAttribute("offwork_status",punchClock.getOffwork_status());
		}
		String blank = "welcome";
		return blank;
	}
	@RequestMapping(value="/loginForm")
	 public String loginForm(){
		String blank = "loginForm";
		return blank;
	}
}
