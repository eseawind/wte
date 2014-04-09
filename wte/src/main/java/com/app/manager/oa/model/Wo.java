package com.app.manager.oa.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.app.common.activiti.model.ProcessModel;

@Entity
@Table(name = "oa_wo")
public class Wo extends ProcessModel {
	private static final long serialVersionUID = 1L;
	private Long id;

	public String projectId;
	private String title;
	private String requestid;
	private String startTime;
	private String endTime;
	private String requestDesc;
	private String priority;
	private String serviceFunction;
	private String businessType;
	private String manday;
	/* add by Pan Linglian start */
	private String actualManday;
	private String receiveTime;
	private String responseTime;
	private String changeTimes;
	private String reworkTimes;
	private String alarm;
	private String completeDate;
	/* add by Pan Linglian start */
	
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getManday() {
		return manday;
	}

	public void setManday(String manday) {
		this.manday = manday;
	}

	public String getServiceFunction() {
		return serviceFunction;
	}

	public void setServiceFunction(String serviceFunction) {
		this.serviceFunction = serviceFunction;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRequestid() {
		return requestid;
	}

	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getRequestDesc() {
		return requestDesc;
	}

	public void setRequestDesc(String requestDesc) {
		this.requestDesc = requestDesc;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(String receiveTime) {
		this.receiveTime = receiveTime;
	}

	public String getResponseTime() {
		return responseTime;
	}

	public void setResponseTime(String responseTime) {
		this.responseTime = responseTime;
	}

	public String getChangeTimes() {
		return changeTimes;
	}

	public void setChangeTimes(String changeTimes) {
		this.changeTimes = changeTimes;
	}

	public String getReworkTimes() {
		return reworkTimes;
	}

	public void setReworkTimes(String reworkTimes) {
		this.reworkTimes = reworkTimes;
	}

	public String getAlarm() {
		return alarm;
	}

	public String getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}

	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}

	public String getActualManday() {
		return actualManday;
	}

	public void setActualManday(String actualManday) {
		this.actualManday = actualManday;
	}

	// for process
	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
}