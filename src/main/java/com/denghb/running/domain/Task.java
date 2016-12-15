package com.denghb.running.domain;

import com.denghb.dbhelper.annotation.Column;
import com.denghb.dbhelper.annotation.Id;
import com.denghb.dbhelper.annotation.Table;

/**
 * 任务
 * DDL
 * <pre>CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接',
  `sec` int(11) NOT NULL COMMENT '间隔秒',
  `last_status` int(11) NOT NULL COMMENT '最近状态',
  `is_run` int(11) DEFAULT '1' COMMENT '是否运行',
  `run_time` int(11) DEFAULT '0' COMMENT '运行毫秒',
  `desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `is_email` int(11) DEFAULT '0' COMMENT '是否发邮件',
  `email_address` varchar(200) DEFAULT NULL COMMENT '邮件地址多个,隔开',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='任务'<pre>
 * @author DbHelper
 * @generateTime Thu Dec 15 23:11:35 CST 2016
 */
@Table(name="task",database="running")
public class Task implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	/**  */
	@Id@Column(name="id")
	private Integer id;
	
	/** 链接 */
	@Column(name="url")
	private String url;
	
	/** 间隔秒 */
	@Column(name="sec")
	private Integer sec;
	
	/** 最近状态 */
	@Column(name="last_status")
	private Integer lastStatus;
	
	/** 是否运行 */
	@Column(name="is_run")
	private Integer isRun;
	
	/** 运行毫秒 */
	@Column(name="run_time")
	private Integer runTime;
	
	/** 描述 */
	@Column(name="desc")
	private String desc;
	
	/** 是否发邮件 */
	@Column(name="is_email")
	private Integer isEmail;
	
	/** 邮件地址多个,隔开 */
	@Column(name="email_address")
	private String emailAddress;
	
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
	

	public Integer getId(){
		return id;
	}

	public void setId(Integer id){
		this.id = id;
	}

	public String getUrl(){
		return url;
	}

	public void setUrl(String url){
		this.url = url;
	}

	public Integer getSec(){
		return sec;
	}

	public void setSec(Integer sec){
		this.sec = sec;
	}

	public Integer getLastStatus(){
		return lastStatus;
	}

	public void setLastStatus(Integer lastStatus){
		this.lastStatus = lastStatus;
	}

	public Integer getIsRun(){
		return isRun;
	}

	public void setIsRun(Integer isRun){
		this.isRun = isRun;
	}

	public Integer getRunTime(){
		return runTime;
	}

	public void setRunTime(Integer runTime){
		this.runTime = runTime;
	}

	public String getDesc(){
		return desc;
	}

	public void setDesc(String desc){
		this.desc = desc;
	}

	public Integer getIsEmail(){
		return isEmail;
	}

	public void setIsEmail(Integer isEmail){
		this.isEmail = isEmail;
	}

	public String getEmailAddress(){
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress){
		this.emailAddress = emailAddress;
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
		StringBuffer stringBuffer = new StringBuffer("Task [");
		stringBuffer.append("id=");
		stringBuffer.append(id);
		stringBuffer.append(",");
		stringBuffer.append("url=");
		stringBuffer.append(url);
		stringBuffer.append(",");
		stringBuffer.append("sec=");
		stringBuffer.append(sec);
		stringBuffer.append(",");
		stringBuffer.append("lastStatus=");
		stringBuffer.append(lastStatus);
		stringBuffer.append(",");
		stringBuffer.append("isRun=");
		stringBuffer.append(isRun);
		stringBuffer.append(",");
		stringBuffer.append("runTime=");
		stringBuffer.append(runTime);
		stringBuffer.append(",");
		stringBuffer.append("desc=");
		stringBuffer.append(desc);
		stringBuffer.append(",");
		stringBuffer.append("isEmail=");
		stringBuffer.append(isEmail);
		stringBuffer.append(",");
		stringBuffer.append("emailAddress=");
		stringBuffer.append(emailAddress);
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