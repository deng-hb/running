package com.denghb.running.domain;

import com.denghb.dbhelper.annotation.Column;
import com.denghb.dbhelper.annotation.Id;
import com.denghb.dbhelper.annotation.Table;

/**
 * 任务纪录
 * DDL
 * 
 <pre>
CREATE TABLE `history` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(11) DEFAULT NULL,
  `task_url` varchar(200) DEFAULT NULL COMMENT '任务地址',
  `code` int(11) DEFAULT NULL COMMENT '返回状态码',
  `response_brief` varchar(100) DEFAULT NULL COMMENT '返回缩略信息',
  `response` text COMMENT '返回字符（最多5000）',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='任务纪录'
 <pre>
 * @author DbHelper
 * @generateTime Fri Dec 16 20:35:09 CST 2016
 */
@Table(name="history",database="running")
public class History implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	/**  */
	@Id@Column(name="id")
	private Long id;
	
	/**  */
	@Column(name="task_id")
	private Long taskId;
	
	/** 任务地址 */
	@Column(name="task_url")
	private String taskUrl;
	
	/** 返回状态码 */
	@Column(name="code")
	private Integer code;
	
	/** 返回缩略信息 */
	@Column(name="response_brief")
	private String responseBrief;
	
	/** 返回字符（最多5000） */
	@Column(name="response")
	private String response;
	
	/** 开始时间 */
	@Column(name="start_time")
	private java.util.Date startTime;
	
	/** 结束时间 */
	@Column(name="end_time")
	private java.util.Date endTime;
	
	/** 创建人 */
	@Column(name="created_by")
	private Integer createdBy;
	
	/** 创建时间 */
	@Column(name="created_time")
	private java.util.Date createdTime;
	
	/** 更新人 */
	@Column(name="updated_by")
	private Integer updatedBy;
	
	/** 更新时间 */
	@Column(name="updated_time")
	private java.util.Date updatedTime;
	
	/** 删除标记 */
	@Column(name="deleted")
	private Integer deleted;
	
	/** 版本 */
	@Column(name="version")
	private Integer version;
	

	public Long getId(){
		return id;
	}

	public void setId(Long id){
		this.id = id;
	}

	public Long getTaskId(){
		return taskId;
	}

	public void setTaskId(Long taskId){
		this.taskId = taskId;
	}

	public String getTaskUrl(){
		return taskUrl;
	}

	public void setTaskUrl(String taskUrl){
		this.taskUrl = taskUrl;
	}

	public Integer getCode(){
		return code;
	}

	public void setCode(Integer code){
		this.code = code;
	}

	public String getResponseBrief(){
		return responseBrief;
	}

	public void setResponseBrief(String responseBrief){
		this.responseBrief = responseBrief;
	}

	public String getResponse(){
		return response;
	}

	public void setResponse(String response){
		this.response = response;
	}

	public java.util.Date getStartTime(){
		return startTime;
	}

	public void setStartTime(java.util.Date startTime){
		this.startTime = startTime;
	}

	public java.util.Date getEndTime(){
		return endTime;
	}

	public void setEndTime(java.util.Date endTime){
		this.endTime = endTime;
	}

	public Integer getCreatedBy(){
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy){
		this.createdBy = createdBy;
	}

	public java.util.Date getCreatedTime(){
		return createdTime;
	}

	public void setCreatedTime(java.util.Date createdTime){
		this.createdTime = createdTime;
	}

	public Integer getUpdatedBy(){
		return updatedBy;
	}

	public void setUpdatedBy(Integer updatedBy){
		this.updatedBy = updatedBy;
	}

	public java.util.Date getUpdatedTime(){
		return updatedTime;
	}

	public void setUpdatedTime(java.util.Date updatedTime){
		this.updatedTime = updatedTime;
	}

	public Integer getDeleted(){
		return deleted;
	}

	public void setDeleted(Integer deleted){
		this.deleted = deleted;
	}

	public Integer getVersion(){
		return version;
	}

	public void setVersion(Integer version){
		this.version = version;
	}

	@Override
	public String toString(){
		StringBuffer str = new StringBuffer("History [");
		str.append(",id=");
		str.append(id);
		str.append(",taskId=");
		str.append(taskId);
		str.append(",taskUrl=");
		str.append(taskUrl);
		str.append(",code=");
		str.append(code);
		str.append(",responseBrief=");
		str.append(responseBrief);
		str.append(",response=");
		str.append(response);
		str.append(",startTime=");
		str.append(startTime);
		str.append(",endTime=");
		str.append(endTime);
		str.append(",createdBy=");
		str.append(createdBy);
		str.append(",createdTime=");
		str.append(createdTime);
		str.append(",updatedBy=");
		str.append(updatedBy);
		str.append(",updatedTime=");
		str.append(updatedTime);
		str.append(",deleted=");
		str.append(deleted);
		str.append(",version=");
		str.append(version);
		str.append("]");
	
		return str.toString();
	}
}