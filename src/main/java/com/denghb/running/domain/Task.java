package com.denghb.running.domain;

import com.denghb.dbhelper.annotation.Column;
import com.denghb.dbhelper.annotation.Id;
import com.denghb.dbhelper.annotation.Table;

/**
 * 任务
 * DDL
 * 
 <pre>
CREATE TABLE `task` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接',
  `sec` int(11) NOT NULL COMMENT '轮询间隔秒',
  `last_status` int(11) NOT NULL DEFAULT '0' COMMENT '最近状态',
  `is_run` int(11) DEFAULT '1' COMMENT '是否运行',
  `run_time` int(11) DEFAULT '0' COMMENT '运行毫秒',
  `error_size` int(11) NOT NULL DEFAULT '200' COMMENT '错误次数',
  `email_size` int(11) DEFAULT '0' COMMENT '发邮件次数，0>=不发',
  `email_address` varchar(200) DEFAULT NULL COMMENT '邮件地址多个,隔开',
  `created_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1314 DEFAULT CHARSET=utf8 COMMENT='任务'
 <pre>
 * @author DbHelper
 * @generateTime Fri Dec 16 20:35:09 CST 2016
 */
@Table(name="task",database="running")
public class Task implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	/**  */
	@Id@Column(name="id")
	private Long id;
	
	/** 描述 */
	@Column(name="desc")
	private String desc;
	
	/** 链接 */
	@Column(name="url")
	private String url;
	
	/** 轮询间隔秒 */
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
	
	/** 错误次数 */
	@Column(name="error_size")
	private Integer errorSize;
	
	/** 发邮件次数，0>=不发 */
	@Column(name="email_size")
	private Integer emailSize;
	
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
	

	public Long getId(){
		return id;
	}

	public void setId(Long id){
		this.id = id;
	}

	public String getDesc(){
		return desc;
	}

	public void setDesc(String desc){
		this.desc = desc;
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

	public Integer getErrorSize(){
		return errorSize;
	}

	public void setErrorSize(Integer errorSize){
		this.errorSize = errorSize;
	}

	public Integer getEmailSize(){
		return emailSize;
	}

	public void setEmailSize(Integer emailSize){
		this.emailSize = emailSize;
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
		StringBuffer str = new StringBuffer("Task [");
		str.append(",id=");
		str.append(id);
		str.append(",desc=");
		str.append(desc);
		str.append(",url=");
		str.append(url);
		str.append(",sec=");
		str.append(sec);
		str.append(",lastStatus=");
		str.append(lastStatus);
		str.append(",isRun=");
		str.append(isRun);
		str.append(",runTime=");
		str.append(runTime);
		str.append(",errorSize=");
		str.append(errorSize);
		str.append(",emailSize=");
		str.append(emailSize);
		str.append(",emailAddress=");
		str.append(emailAddress);
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