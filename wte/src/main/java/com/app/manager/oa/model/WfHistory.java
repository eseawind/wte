package com.app.manager.oa.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.app.common.spring.ssh.model.BaseModel;


@Entity
@Table(name = "oa_wfhistory")
public class WfHistory extends BaseModel {
	private Long id;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String initiator;
	public String init_name;
	public String handler;
	public String assignee;
	public String assi_name;
	public Date createdate;
	public String operate;
	public long busi_id;
	public String busi_name;
	public String busi_desc;
	public String process_key;
	public String process_id;
	public String process_desc;

	public String getInitiator() {
		return initiator;
	}

	public void setInitiator(String initiator) {
		this.initiator = initiator;
	}

	public String getHandler() {
		return handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	public String getBusi_desc() {
		return busi_desc;
	}

	public void setBusi_desc(String busi_desc) {
		this.busi_desc = busi_desc;
	}

	public String getProcess_key() {
		return process_key;
	}

	public void setProcess_key(String process_key) {
		this.process_key = process_key;
	}

	public String getProcess_desc() {
		return process_desc;
	}

	public void setProcess_desc(String process_desc) {
		this.process_desc = process_desc;
	}

	public long getBusi_id() {
		return busi_id;
	}

	public void setBusi_id(long busi_id) {
		this.busi_id = busi_id;
	}

	public String getProcess_id() {
		return process_id;
	}

	public void setProcess_id(String process_id) {
		this.process_id = process_id;
	}

	public String getInit_name() {
		return init_name;
	}

	public void setInit_name(String init_name) {
		this.init_name = init_name;
	}

	public String getAssi_name() {
		return assi_name;
	}

	public void setAssi_name(String assi_name) {
		this.assi_name = assi_name;
	}

	public String getBusi_name() {
		return busi_name;
	}

	public void setBusi_name(String busi_name) {
		this.busi_name = busi_name;
	}

}
