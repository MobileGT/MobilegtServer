package code.java.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import code.java.service.App6groupService;
import code.java.util.ParamUtil;

@Controller
public class App6groupController {
	@Autowired
	private App6groupService app6groupService;
	@RequestMapping(value="/index")
	public String gotoIndex(HttpServletRequest request, HttpServletResponse response, Model model){
		Map<Object, Object> map = app6groupService.getApp6group("2016-07-15 13:00:00");
		request.setAttribute("app6groupMap", map);
		return "getGroups";
	}
	@RequestMapping(value="/getGroups")
	public String getGroups(HttpServletRequest request, HttpServletResponse reponse) {
		String datetime = ParamUtil.getStringParameter(request, "datetime", "");
		Map<Object, Object> map = app6groupService.getApp6group(datetime);
		request.setAttribute("app6groupMap", map);
		return "getGroups";
	}
}
