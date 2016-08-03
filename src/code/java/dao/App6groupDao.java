package code.java.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import code.java.pojo.App6group;

@Repository
public class App6groupDao extends BaseDao<App6group, Long> {
	public Map findByParams(String date) {
		String sql = "SELECT date,streams,sourceIpGroup,protocolGroup,sourcePortGroup,destinationIpGroup,destinationPortGroup,appNameGroup,versionGroup"
				+ " FROM app6group"
				+ " WHERE date='%s'";
		String temp = String.format(sql, date);
		Map map= queryMapBySql(temp, 0, 15);
		return map;
	}
}
