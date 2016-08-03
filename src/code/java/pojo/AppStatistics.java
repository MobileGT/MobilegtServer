package code.java.pojo;

import static javax.persistence.GenerationType.IDENTITY;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "appstatistics")
public class AppStatistics implements java.io.Serializable {

	private Long statisticsId;
	private String date;
	private String protocol;
	private String sourceIp;
	private String destinationIp;
	private String sourcePort;
	private String destinationPort;
	private String appName;
	private String version;
	private Long totalNum;
	private Long totalSize;
	private Long minSize;
	private BigDecimal aveSize;
	private Long maxSize;
	private Long meanSize;
	private BigDecimal minTime;
	private BigDecimal aveTime;
	private BigDecimal meanTime;
	private BigDecimal duration;
	private Long urgentNum;
	private Long pushNum;
	private BigDecimal loadNum;

	public AppStatistics() {
	}

	public AppStatistics(Long statisticsId, String date, String protocol, String sourceIp, String
			destinationIp, String sourcePort, String destinationPort, String appName, String
			version, Long totalNum, Long totalSize, Long minSize, BigDecimal aveSize, Long
			maxSize, Long meanSize, BigDecimal minTime, BigDecimal aveTime, BigDecimal
			meanTime, BigDecimal duration, Long urgentNum, Long pushNum, BigDecimal loadNum) {
		this.statisticsId = statisticsId;
		this.date = date;
		this.protocol = protocol;
		this.sourceIp = sourceIp;
		this.destinationIp = destinationIp;
		this.sourcePort = sourcePort;
		this.destinationPort = destinationPort;
		this.appName = appName;
		this.version = version;
		this.totalNum = totalNum;
		this.totalSize = totalSize;
		this.minSize = minSize;
		this.aveSize = aveSize;
		this.maxSize = maxSize;
		this.meanSize = meanSize;
		this.minTime = minTime;
		this.aveTime = aveTime;
		this.meanTime = meanTime;
		this.duration = duration;
		this.urgentNum = urgentNum;
		this.pushNum = pushNum;
		this.loadNum = loadNum;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "statisticsId", unique = true, nullable = false)
	public Long getStatisticsId() {
		return statisticsId;
	}

	public void setStatisticsId(Long statisticsId) {
		this.statisticsId = statisticsId;
	}

	@Column(name = "date", length = 10)
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "protocol", length = 10)
	public String getProtocol() {
		return protocol;
	}

	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	@Column(name = "sourceIp", length = 30)
	public String getSourceIp() {
		return sourceIp;
	}

	public void setSourceIp(String sourceIp) {
		this.sourceIp = sourceIp;
	}

	@Column(name = "destinationIp", length = 30)
	public String getDestinationIp() {
		return destinationIp;
	}

	public void setDestinationIp(String destinationIp) {
		this.destinationIp = destinationIp;
	}
	@Column(name = "sourcePort", length = 10)
	public String getSourcePort() {
		return sourcePort;
	}

	public void setSourcePort(String sourcePort) {
		this.sourcePort = sourcePort;
	}
	
	@Column(name = "destinationPort", length = 10)
	public String getDestinationPort() {
		return destinationPort;
	}

	public void setDestinationPort(String destinationPort) {
		this.destinationPort = destinationPort;
	}

	@Column(name = "appName", length = 50)
	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	@Column(name = "version", length = 50)
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	@Column(name = "totalNum", length = 10)
	public Long getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(Long totalNum) {
		this.totalNum = totalNum;
	}

	@Column(name = "totalSize", length = 10)
	public Long getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(Long totalSize) {
		this.totalSize = totalSize;
	}

	@Column(name = "minSize", length = 10)
	public Long getMinSize() {
		return minSize;
	}

	public void setMinSize(Long minSize) {
		this.minSize = minSize;
	}

	@Column(name = "aveSize", precision = 16)
	public BigDecimal getAveSize() {
		return aveSize;
	}

	public void setAveSize(BigDecimal aveSize) {
		this.aveSize = aveSize;
	}

	@Column(name = "maxSize", length = 10)
	public Long getMaxSize() {
		return maxSize;
	}

	public void setMaxSize(Long maxSize) {
		this.maxSize = maxSize;
	}

	@Column(name = "meanSize", precision = 16)
	public Long getMeanSize() {
		return meanSize;
	}

	public void setMeanSize(Long meanSize) {
		this.meanSize = meanSize;
	}

	@Column(name = "minTime", precision = 16)
	public BigDecimal getMinTime() {
		return minTime;
	}

	public void setMinTime(BigDecimal minTime) {
		this.minTime = minTime;
	}

	@Column(name = "aveTime", precision = 16)
	public BigDecimal getAveTime() {
		return aveTime;
	}

	public void setAveTime(BigDecimal aveTime) {
		this.aveTime = aveTime;
	}

	@Column(name = "meanTime", precision = 16)
	public BigDecimal getMeanTime() {
		return meanTime;
	}

	public void setMeanTime(BigDecimal meanTime) {
		this.meanTime = meanTime;
	}

	@Column(name = "duration", precision = 16)
	public BigDecimal getDuration() {
		return duration;
	}

	public void setDuration(BigDecimal duration) {
		this.duration = duration;
	}

	@Column(name = "urgentNum", length = 10)
	public Long getUrgentNum() {
		return urgentNum;
	}

	public void setUrgentNum(Long urgentNum) {
		this.urgentNum = urgentNum;
	}

	@Column(name = "pushNum", length = 10)
	public Long getPushNum() {
		return pushNum;
	}

	public void setPushNum(Long pushNum) {
		this.pushNum = pushNum;
	}

	@Column(name = "loadNum", precision = 16)
	public BigDecimal getLoadNum() {
		return loadNum;
	}

	public void setLoadNum(BigDecimal loadNum) {
		this.loadNum = loadNum;
	}

}
