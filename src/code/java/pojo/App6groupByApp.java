package code.java.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "app6groupbyapp")
public class App6groupByApp implements java.io.Serializable {

	private Long app6groupsId;
	private String date;
	private String datasource;
	private String streams;
	private String sourceIpGroup;
	private String protocolGroup;
	private String sourcePortGroup;
	private String destinationPortGroup;
	private String destinationIpGroup;
	private String appNameGroup;
	private String versionGroup;

	public App6groupByApp() {
	}

	public App6groupByApp(String date, String datasource, String streams,
			String sourceIpGroup, String protocolGroup, String sourcePortGroup,
			String destinationPortGroup, String destinationIpGroup,
			String appNameGroup, String versionGroup) {
		this.date = date;
		this.datasource = datasource;
		this.streams = streams;
		this.sourceIpGroup = sourceIpGroup;
		this.protocolGroup = protocolGroup;
		this.sourcePortGroup = sourcePortGroup;
		this.destinationPortGroup = destinationPortGroup;
		this.destinationIpGroup = destinationIpGroup;
		this.appNameGroup = appNameGroup;
		this.versionGroup = versionGroup;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "app6groupsId", unique = true, nullable = false)
	public Long getApp6groupsId() {
		return this.app6groupsId;
	}

	public void setApp6groupsId(Long app6groupsId) {
		this.app6groupsId = app6groupsId;
	}

	@Column(name = "date", length = 30)
	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "datasource", length = 10)
	public String getDatasource() {
		return this.datasource;
	}

	public void setDatasource(String datasource) {
		this.datasource = datasource;
	}

	@Column(name = "streams")
	public String getStreams() {
		return this.streams;
	}

	public void setStreams(String streams) {
		this.streams = streams;
	}

	@Column(name = "sourceIpGroup", length = 65535)
	public String getSourceIpGroup() {
		return this.sourceIpGroup;
	}

	public void setSourceIpGroup(String sourceIpGroup) {
		this.sourceIpGroup = sourceIpGroup;
	}

	@Column(name = "protocolGroup", length = 65535)
	public String getProtocolGroup() {
		return this.protocolGroup;
	}

	public void setProtocolGroup(String protocolGroup) {
		this.protocolGroup = protocolGroup;
	}

	@Column(name = "sourcePortGroup", length = 65535)
	public String getSourcePortGroup() {
		return this.sourcePortGroup;
	}

	public void setSourcePortGroup(String sourcePortGroup) {
		this.sourcePortGroup = sourcePortGroup;
	}

	@Column(name = "destinationPortGroup", length = 65535)
	public String getDestinationPortGroup() {
		return this.destinationPortGroup;
	}

	public void setDestinationPortGroup(String destinationPortGroup) {
		this.destinationPortGroup = destinationPortGroup;
	}

	@Column(name = "destinationIpGroup", length = 65535)
	public String getDestinationIpGroup() {
		return this.destinationIpGroup;
	}

	public void setDestinationIpGroup(String destinationIpGroup) {
		this.destinationIpGroup = destinationIpGroup;
	}

	@Column(name = "appNameGroup", length = 65535)
	public String getAppNameGroup() {
		return this.appNameGroup;
	}

	public void setAppNameGroup(String appNameGroup) {
		this.appNameGroup = appNameGroup;
	}

	@Column(name = "versionGroup", length = 65535)
	public String getVersionGroup() {
		return this.versionGroup;
	}

	public void setVersionGroup(String versionGroup) {
		this.versionGroup = versionGroup;
	}

}
