package code.java.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import code.java.service.AppStatisticsService;
import code.java.util.ParamUtil;

@Controller
public class StatisticsController {
	@Autowired
	private AppStatisticsService appStatisticsService;
	@RequestMapping(value="/statistics")
	public String statistics(HttpServletRequest request, HttpServletResponse reponse) {
		return "statistics";
	}
	@ResponseBody
	@RequestMapping(value="/getAppStatistics")
	public JSONObject getAppStatistics(HttpServletRequest request, HttpServletResponse reponse) {
		String date = ParamUtil.getStringParameter(request, "date", "");
		Map map = null;
		if(date.equals("")) {
			map = appStatisticsService.getAppStatistics("2016-07-15");
		}else {
			map = appStatisticsService.getAppStatistics(date);
		}
		JSONObject jsonObject = JSONObject.fromObject(map);
		return jsonObject;
	}
}
