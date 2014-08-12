package com.app.exam.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.app.common.base.action.BaseEaAction;
import com.app.common.spring.ssh.action.BaseAction;
import com.app.common.spring.ssh.action.BaseBusinessAction;
import com.app.common.spring.ssh.model.BaseModel;
import com.app.exam.model.Knowledge;

import org.apache.commons.beanutils.BeanUtils;

@Component("knowledgeAction")
public class KnowledgeAction extends BaseEaAction {
	private final Logger log = LoggerFactory.getLogger(KnowledgeAction.class);
	public String menu_knowledge() throws Exception {
		rhs.put("knowledgeRootList", common_get_tree_root("Knowledge"));
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}

	public String create() throws Exception {
		String id = getpara("id");
		if ("root".equals(id)) {
			Knowledge knowledge = new Knowledge();
			knowledge.setName("");
			baseDao.create(knowledge);
		} else {
			Knowledge parent_org = (Knowledge) baseDao.loadById("Knowledge",
					Long.parseLong(id));
			Knowledge subknowledge = new Knowledge();
			subknowledge.setName("");
			subknowledge.setParentModel(parent_org);
			baseDao.create(subknowledge);
		}
		rhs.put("knowledgeRootList", common_get_tree_root(getpara("beanname")));
		rhs.put("info_type", "success");
		rhs.put("info", " Add new node!");
		return "success";
	}	
	
	public String update() throws Exception {
		try {
			String id = getpara("id");
			String beanname = getpara("beanname");
			String column = getpara("column");
			String columnValue = java.net.URLDecoder.decode(getpara("columnValue"), "UTF-8");
			if(columnValue.length() >= 255){
				columnValue = columnValue.substring(0, 255);//防止过长
			}
			if("".equals(columnValue.trim()) || columnValue.trim().length() == 0){
				rhs.put("result", "The "+column+" should not be empty!");
				rhs.put("flag", true);
				return "success";
			}
			BaseModel baseModel = (BaseModel) baseDao.loadById(beanname,
					Long.parseLong(id));
			try {
				BeanUtils.setProperty(baseModel, column, columnValue);
			} catch (Exception e) {
				log.error("change propertise error: " + column + "=" + columnValue);
				e.printStackTrace();
			}
			baseDao.update(baseModel);
		} catch (Exception e) {
			rhs.put("info_type", "error");
			rhs.put("info", " Update failed!");
			return "success";
		}
		rhs.put("knowledgeRootList", common_get_tree_root(getpara("beanname")));
		rhs.put("info_type", "success");
		rhs.put("info", "Update successfully!");
		rhs.put("flag", false);
		return "success";
	}

	public String delete() throws Exception {
		String id = getpara("id");
		Knowledge knowledge = (Knowledge) baseDao.loadById(getpara("beanname"), Long.valueOf(id));
		boolean find = false;
		if(knowledge.getItems().size() > 0){
			find = true;
			rhs.put("result", "The Category has questions, can not delete it!");
		}else{
			common_del_tree_node();
			rhs.put("info_type", "success");
			rhs.put("info", " Delete successfully!");
		}
		rhs.put("flag", find);
		rhs.put("knowledgeRootList", common_get_tree_root(getpara("beanname")));
		return "success";
	}
	
	public String change_rank() throws Exception {
		common_change_rank(); 
		rhs.put("knowledgeRootList", common_get_tree_root(getpara("beanname")));
		rhs.put("info_type", "success");
		rhs.put("info", "Change Successfully!");
		return "success";
	}
	public String change_level() throws Exception {
		common_change_level();
		rhs.put("knowledgeRootList", common_get_tree_root(getpara("beanname")));
		rhs.put("info_type", "success");
		rhs.put("info", "Change Successfully!");
		return "success";
	}
}