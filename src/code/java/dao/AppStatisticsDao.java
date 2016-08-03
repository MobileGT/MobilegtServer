package code.java.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import code.java.pojo.AppStatistics;

@Repository
public class AppStatisticsDao extends BaseDao<AppStatistics, Long> {
	public Map getAppStatistics(String date) {
		String sql = "SELECT statisticsId, date, protocol, sourceIp, destinationIp, sourcePort, destinationPort, appName,"
				+ " version, totalNum, totalSize, minSize, aveSize, maxSize, meanSize, minTime, aveTime, meanTime, duration,"
				+ " urgentNum, pushNum, loadNum"
				+ " FROM appstatistics"
				+ " WHERE date='%s'";
		String temp = String.format(sql, date);
		Map Map= queryMapBySql(temp,0,200);
		return Map;
	}
}
