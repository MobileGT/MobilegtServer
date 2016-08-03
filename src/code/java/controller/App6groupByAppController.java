package code.java.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import code.java.service.App6groupByAppService;
import code.java.util.ParamUtil;

@Controller
public class App6groupByAppController {
	@Autowired
	private App6groupByAppService app6groupByAppService;

	@RequestMapping(value="/groupByApp")
	public String groupByApp(HttpServletRequest request, HttpServletResponse response, Model model){
		Map<Object, Object> map = app6groupByAppService.getApp6groupByApp("2016-02-29", " 192.168.1.2", "Facebook");
		request.setAttribute("app6groupMap", map);
		return "groupByApp";
	}
	@RequestMapping(value="/getGroupByApp")
	public String getGroupByApp(HttpServletRequest request, HttpServletResponse reponse) {
		String date = ParamUtil.getStringParameter(request, "date", "");
		String sourceIp = ParamUtil.getStringParameter(request, "sourceIp", "");
		String appName = ParamUtil.getStringParameter(request, "appName", "");
		Map<Object, Object> map = app6groupByAppService.getApp6groupByApp(date, sourceIp, appName);
		request.setAttribute("app6groupMap", map);
		return "groupByApp";
	}
}
