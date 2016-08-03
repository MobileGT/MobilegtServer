package code.java.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import code.java.dao.App6groupByAppDao;

@Service
public class App6groupByAppService {
	@Autowired
	private App6groupByAppDao app6groupByAppDao;
	/**
	 * 获取App6groupByApp数据
	 */
	public Map<Object, Object> getApp6groupByApp(String date, String sourceIp, String appName) {
		return app6groupByAppDao.findByAppName(date, sourceIp, appName);
	}
}
