package code.java.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import code.java.dao.App6groupDao;

@Service
public class App6groupService {
	@Autowired
	private App6groupDao app6groupDao;
	/**
	 * 获取App6groups数据
	 */
	public Map getApp6group(String date) {
		if (date == null) {
			return null;
		}
		return app6groupDao.findByParams(date);
	}
}
