package com.app.manager.oa.model;

import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Task;

public class ActivitiTask {
	public Task task;
	public String handleTaskUrl;
	public ProcessDefinition processDefinition;
	public String initiator;
	public String busi_desc;
	public String user_name;

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public String getHandleTaskUrl() {
		return handleTaskUrl;
	}

	public void setHandleTaskUrl(String handleTaskUrl) {
		this.handleTaskUrl = handleTaskUrl;
	}

	public ProcessDefinition getProcessDefinition() {
		return processDefinition;
	}

	public void setProcessDefinition(ProcessDefinition processDefinition) {
		this.processDefinition = processDefinition;
	}

	public String getInitiator() {
		return initiator;
	}

	public void setInitiator(String initiator) {
		this.initiator = initiator;
	}

	public String getBusi_desc() {
		return busi_desc;
	}

	public void setBusi_desc(String busi_desc) {
		this.busi_desc = busi_desc;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

}
