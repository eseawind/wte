package com.app.manager.oa.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.task.Task;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.app.common.activiti.api.InfActiviti;
import com.app.common.activiti.model.BusinessWithProcessModel;
import com.app.common.activiti.model.TaskLog;
import com.app.common.base.action.BaseEaAction;
import com.app.ea.model.User;
import com.app.manager.oa.model.Wo;
import com.utils.time.TimeUtil;

@Component("woAction")
@Scope("prototype")
@SuppressWarnings("unchecked")
public class WoAction extends BaseEaAction {
	public TaskLog model = new TaskLog();
	private static Logger log = LoggerFactory.getLogger(WoAction.class);
	//get smtp information
	private static String hsql_all = "from Smtp";
	
	private InfActiviti infActiviti;
	public Wo woobject = new Wo();
	
    public String get_list_sql(){
    	return "from Wo where projectId='"+ getCurrentProjectId() + "'";
    }

	public String list() throws Exception {
		String sql = getSearchSql(get_list_sql());
		
		/* add by Pan Linglian start */
		String parm = getpara("orderBy");
		if (parm != null && !"".equals(parm)) {
			sql = sql + " and completeDate is null order by " + parm;
			rhs.put("orderBy", parm);
		}
		/* add by Pan Linglian end */
		
		getPageData(sql);

		/* edit by Pan Linglian start */
		List woList = (List)rhs.get("dataList");
		if(woList != null) {
			Date from = new Date();
			for (int i = 0; i < woList.size(); i++) {
				Wo wo = (Wo)woList.get(i);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date to = df.parse(wo.getEndTime());
					long days = (to.getTime() - from.getTime()) / (24 * 60 * 60 * 1000);
					if (days < 3)
						wo.setAlarm("warning");
				} catch (Exception e) {}
				
				if (wo.getStartTime() != null&&wo.getStartTime().length()>10 && !"".equals(wo.getStartTime()))
					wo.setStartTime(wo.getStartTime().substring(0, 10));
				if (wo.getEndTime() != null && !"".equals(wo.getEndTime()))
					wo.setEndTime(wo.getEndTime().substring(0, 10));
			}
			
			List processWoList = woToProcessWo(woList);
			rhs.put("dataList", processWoList);
		}
		/* edit by Pan Linglian end */
		return "list";
	}
	
	//add by hb for export wo list -start 2014/03/10
	public String export() throws Exception{
		String sql = getSearchSql(get_list_sql());
		String begintime = getpara("begintime");
		String endtime = getpara("endtime");
		
		sql = sql + " and startTime BETWEEN '" + begintime + "' AND '" + endtime + "'";
		getPageData(sql);
		
		
		List woList = (List)rhs.get("dataList");
		
		
		List processWoList = woToProcessWo(woList);
		
		SimpleDateFormat sdf = new SimpleDateFormat("MMM",Locale.US);
		rhs.put("reportMonth", sdf.format(new Date()));
		
		rhs.put("dataList", processWoList);
		return "success";
	}
	//-end
	
	public String load() throws Exception {
		if (!getpara("id").equals("")) {
			Wo wo = (Wo) baseDao.loadById("Wo", Long.parseLong(getpara("id")));
			rhs.put("wo", wo);
		} else {
			// modify by chenzhijian -s
			
			woobject = new Wo();
			/* add by Pan Linglian start */
			String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			woobject.setReceiveTime(currentDate);
			woobject.setStartTime(currentDate);
			/* add by Pan Linglian end */
			woobject.setProjectId(getCurrentProjectId());
			baseDao.create(woobject);
			rhs.put("wo", woobject);
			// modify by chenzhijian -e
		}
		
		if(getpara("readonly").equals("true"))
			rhs.put("readonly", "disabled='disabled'");
		
		return "success";
	}

	public String save() throws Exception {
		if (woobject.getId() == null || woobject.getId().toString().equals("")) {
			woobject.setProjectId(getCurrentProjectId());
			baseDao.create(woobject);
		} else {
			baseDao.update(woobject);
		}
		return list();
	}

	public String delete() throws Exception {
		String id = getpara("id");
		Wo wodata = new Wo();
		wodata.setId(Long.parseLong(id));
		baseDao.delete(wodata);
		return list();
	}

	// process code -start
	public String complete_task() throws Exception{
		log.debug("complete_task()");
		
		Wo wo = (Wo)baseDao.loadById("Wo", woobject.getId());
		String taskId = getpara("taskId");
		String flag = getpara("flag");
		String codeFix = getpara("codeFix");
		String systemCompletion = getpara("systemCompletion");
		/* add by Pan Linglian start */
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if ("1".equals(systemCompletion))
			wo.setCompleteDate(df.format(new Date()));
		/* add by Pan Linglian end */
		baseDao.update(wo);
		Map<String, Object> map = new HashMap<String, Object>();
		if(!flag.equals(""))
			map.put("flag", flag);
		if(!codeFix.equals(""))
			map.put("flag", codeFix);
		if(!systemCompletion.equals(""))
			map.put("flag", systemCompletion);
		//add by hb for log complete information and send mail to initiator 2014/03/13 start
		Task t = infActiviti.getTaskById(taskId);
		//set the responsibility person for the task. using variable "firstAssignee"
		if("usertask1".equals(t.getTaskDefinitionKey())){
			map.put("firstAssignee", ServletActionContext.getRequest().getParameter("assignee"));
		}
		User user = (User) getSessionValue("userlogined");
		model = new TaskLog();
		model.setLog("我已经完成 " + t.getName() + " !");
		model.setTaskId(t.getId());
		model.setTaskName(t.getName());
		model.setProcessInstanceId(t.getProcessInstanceId());
		model.setCreateTime(TimeUtil.getTimeStr("yyyy-MM-dd HH:mm:ss"));
		model.setUserAccount(user.getAccount());
		model.setUserName(user.getName());
		baseDao.create(model);
		
		//send mail
		String initiator = (String) infActiviti.getVariableByTaskId(taskId, "initiator");
		User initiatorUser = (User) baseDao.loadByFieldValue(User.class, "account", initiator);
		String mail = "";
		if(initiatorUser.getEmail() != null && !"".equals(initiatorUser.getEmail())){
			mail += initiatorUser.getEmail();
		}
		if(initiatorUser.getEmail2() != null && !"".equals(initiatorUser.getEmail2())){
			mail =";" + initiatorUser.getEmail2() + ";";
		}
		//"Hello " + initiatorUser.getName() + ": <br/>&nbsp;&nbsp;" + 
		String content = ((User) getSessionValue("userlogined")).getName()
				+ " has completed the task: <font color='red'>" + t.getName() + "</font>!<br/><br/>"
				+ " The work order information as below:<br/><br/>" + "Request ID:"
				+ wo.getRequestid() + "&nbsp;&nbsp;&nbsp;&nbsp;" + " Title: "
				+ wo.getTitle() + " <br/>Description: " + wo.getRequestDesc()
				+ "<br/>";
		
		infEa.sendMailTheadBySmtpList(" Task completed! ", content, 
				mail, "", "", null);
		//end
		
		// modify by chenzhijian 
		infActiviti.completeTaskForBusinessAction(ServletActionContext.getRequest(), taskId,woobject.getId().toString(), map);
	
		//lingli add email notify, 这里求下一个会出错
		/*
		List<Map<String, String>> nextTasks = infActiviti.getNextTasks(taskId);
		for(Map<String, String> m : nextTasks){
		    User user=(User)infEa.getUserbyAccount(getpara(m.get("taskAssigneeName")));
            String info="["+infActiviti.getTaskById(taskId).getAssignee()+"] 完成了 [工单:"+wo.getTitle()+"]"+"的[" +infActiviti.getTaskById(taskId).getName()+"]"
            		;
           SendMailTheadBySmtpList.sendmail((ArrayList) baseDao.find("from Smtp"),info, info + TimeUtil.getTimeStr("yyyy-MM-dd hh:mm:ss"),user.getEmail(), null);
      
            
		}
			  */	
		rhs.put("resultMessage", "成功完成任务。");
		return "complete_task";
	}
	
	// add by chenzhijian 20130510
	private List woToProcessWo(List list){
		List retList = new ArrayList();
		if(list != null){
			for(int i = 0; i < list.size(); i++){
				Wo wo = (Wo)list.get(i);
				BusinessWithProcessModel<Wo> processWo = new BusinessWithProcessModel<Wo>(wo);
				retList.add(processWo);
			}
		}
		return retList;
	}
	// process code -end
	
	public Wo getWoobject() {
		return woobject;
	}

	public void setWoobject(Wo woobject) {
		this.woobject = woobject;
	}

	@Resource(name = "impActiviti")
	public void setInfActiviti(InfActiviti infActiviti) {
		this.infActiviti = infActiviti;
	}
}
