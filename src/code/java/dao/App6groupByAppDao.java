package code.java.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import code.java.pojo.App6groupByApp;

@Repository
public class App6groupByAppDao extends BaseDao<App6groupByApp, Long> {
	public Map<Object, Object> findByAppName(String date, String sourceIp, String appName) {
		String sql = "SELECT date,streams,sourceIpGroup,protocolGroup,sourcePortGroup,destinationIpGroup,destinationPortGroup,appNameGroup,versionGroup"
				+ " FROM app6groupbyapp"
				+ " WHERE SUBSTRING(date,1,10)=SUBSTRING('%s',1,10)"
				+ " AND sourceIpGroup=\"[\'%s\']\""
				+ " AND appNameGroup=\"[\'%s\']\"";
		
		String temp = String.format(sql, date, sourceIp, appName);
		Map map= queryMapBySql(temp, 0, 15);
		return map;
	}
}
