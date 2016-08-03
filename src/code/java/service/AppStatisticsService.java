package code.java.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import code.java.dao.AppStatisticsDao;

@Service
public class AppStatisticsService {
	@Autowired
	private AppStatisticsDao appStatisticsDao;
	public Map getAppStatistics(String date) {
		return appStatisticsDao.getAppStatistics(date);
	}
}
