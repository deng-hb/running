package com.denghb.running.domain;

import com.denghb.dbhelper.annotation.Column;
import com.denghb.dbhelper.annotation.Id;
import com.denghb.dbhelper.annotation.Table;

import java.util.Date;

/**
 * 任务纪录
 * DDL
 * <pre>CREATE TABLE `history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `task_url` varchar(200) DEFAULT NULL COMMENT '任务地址',
  `response_code` int(11) DEFAULT NULL COMMENT '返回状态码',
  `response_text` varchar(5000) DEFAULT NULL COMMENT '返回字符（最多5000）',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务纪录'<pre>
 * @author DbHelper
 * @generateTime Sat Sep 03 20:45:28 CST 2016
 */
@Table(name="history",database="running")
public class History implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	/**  */
	@Id@Column(name="id")
	private Integer id;
	
	/**  */
	@Column(name="task_id")
	private Integer taskId;
	
	/** 任务地址 */
	@Column(name="task_url")
	private String taskUrl;
	
	/** 返回状态码 */
	@Column(name="response_code")
	private Integer responseCode;
	
	/** 返回字符（最多5000） */
	@Column(name="response_text")
	private String responseText;
	
	/** 开始时间 */
	@Column(name="start_time")
	private Date startTime;
	
	/** 结束时间 */
	@Column(name="end_time")
	private Date endTime;
	
	/** 创建人 */
	@Column(name="created_by")
	private Integer createdBy;
	
	/** 创建时间 */
	@Column(name="created_time")
	private Date createdTime;
	
	/** 更新人 */
	@Column(name="updated_by")
	private Integer updatedBy;
	
	/** 更新时间 */
	@Column(name="updated_time")
	private Date updatedTime;
	
	/** 删除标记 */
	@Column(name="deleted")
	private Integer deleted;
	
	/** 版本 */
	@Column(name="version")
	private Integer version;
	

	public Integer getId(){
		return id;
	}

	public void setId(Integer id){
		this.id = id;
	}

	public Integer getTaskId(){
		return taskId;
	}

	public void setTaskId(Integer taskId){
		this.taskId = taskId;
	}

	public String getTaskUrl(){
		return taskUrl;
	}

	public void setTaskUrl(String taskUrl){
		this.taskUrl = taskUrl;
	}

	public Integer getResponseCode(){
		return responseCode;
	}

	public void setResponseCode(Integer responseCode){
		this.responseCode = responseCode;
	}

	public String getResponseText(){
		return responseText;
	}

	public void setResponseText(String responseText){
		this.responseText = responseText;
	}

	public Date getStartTime(){
		return startTime;
	}

	public void setStartTime(Date startTime){
		this.startTime = startTime;
	}

	public Date getEndTime(){
		return endTime;
	}

	public void setEndTime(Date endTime){
		this.endTime = endTime;
	}

	public Integer getCreatedBy(){
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy){
		this.createdBy = createdBy;
	}

	public Date getCreatedTime(){
		return createdTime;
	}

	public void setCreatedTime(Date createdTime){
		this.createdTime = createdTime;
	}

	public Integer getUpdatedBy(){
		return updatedBy;
	}

	public void setUpdatedBy(Integer updatedBy){
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedTime(){
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime){
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
		StringBuffer stringBuffer = new StringBuffer("History [");
		stringBuffer.append("id=");
		stringBuffer.append(id);
		stringBuffer.append(",");
		stringBuffer.append("taskId=");
		stringBuffer.append(taskId);
		stringBuffer.append(",");
		stringBuffer.append("taskUrl=");
		stringBuffer.append(taskUrl);
		stringBuffer.append(",");
		stringBuffer.append("responseCode=");
		stringBuffer.append(responseCode);
		stringBuffer.append(",");
		stringBuffer.append("responseText=");
		stringBuffer.append(responseText);
		stringBuffer.append(",");
		stringBuffer.append("startTime=");
		stringBuffer.append(startTime);
		stringBuffer.append(",");
		stringBuffer.append("endTime=");
		stringBuffer.append(endTime);
		stringBuffer.append(",");
		stringBuffer.append("createdBy=");
		stringBuffer.append(createdBy);
		stringBuffer.append(",");
		stringBuffer.append("createdTime=");
		stringBuffer.append(createdTime);
		stringBuffer.append(",");
		stringBuffer.append("updatedBy=");
		stringBuffer.append(updatedBy);
		stringBuffer.append(",");
		stringBuffer.append("updatedTime=");
		stringBuffer.append(updatedTime);
		stringBuffer.append(",");
		stringBuffer.append("deleted=");
		stringBuffer.append(deleted);
		stringBuffer.append(",");
		stringBuffer.append("version=");
		stringBuffer.append(version);
		stringBuffer.append(",");
		stringBuffer.append("]");
	
		return stringBuffer.toString();
	}
}