package com.app.manager.oa.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.app.common.base.action.BaseEaAction;
import com.app.manager.oa.model.BugFix;

@Component("bugfixAction")
@Scope("prototype")
public class BugfixAction extends BaseEaAction {
	
	private static Logger log = LoggerFactory.getLogger(BugfixAction.class);
	public BugFix bfobject = new BugFix();

	public String get_list_sql() {
		return "from BugFix where projectId='" + getCurrentProjectId() + "'";
	}

	public String list() throws Exception {
		String sql = getSearchSql(get_list_sql());
		getPageData(sql);
		return "list";
	}
	
	public String load() throws Exception {
		String id = getpara("id");
		if ("".equals(getpara("id"))) {
			rhs.put("bugFix", null);
		} else {
			BugFix bugFix = (BugFix) baseDao.loadById("BugFix", Long.parseLong(id));
			rhs.put("bugFix", bugFix);
		}
		return "success";
	}
	
	public String save() throws Exception {
		if (bfobject.getId() == null || bfobject.getId().toString().equals("")) { // create
			bfobject.setProjectId(getCurrentProjectId());
			baseDao.create(bfobject);
		} else { // edit
			baseDao.update(bfobject);
		}
		return list();
	}
	
	public String delete() throws Exception {
		String id = getpara("id");
		BugFix bfdata = new BugFix();
		bfdata.setId(Long.parseLong(id));
		baseDao.delete(bfdata);
		return list();
	}
	
}
