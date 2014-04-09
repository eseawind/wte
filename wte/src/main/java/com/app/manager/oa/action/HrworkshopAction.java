package com.app.manager.oa.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.app.common.base.action.BaseEaAction;
import com.app.common.spring.ssh.page.Pagination;
import com.app.manager.oa.model.Hrworkshop;
import com.utils.time.TimeUtil;

@Component("hrworkshopAction")
@SuppressWarnings("rawtypes")
public class HrworkshopAction extends BaseEaAction {
	private static Logger log = LoggerFactory.getLogger(HrworkshopAction.class);
	protected HashMap rhs = new HashMap();
	public Hrworkshop hrworkshop = new Hrworkshop();
	protected Pagination pagination;


	public String menu_hrworkshop() throws Exception {
		getPageData();
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}

	public String create() throws Exception {
		Hrworkshop hrworkshop = new Hrworkshop();
		hrworkshop.setName("");
		hrworkshop.setBeginDate(TimeUtil.getTimeStr("yyyy-MM-dd"));
		hrworkshop.setInputname(getCurrentAccount());
		baseDao.create(hrworkshop);
		getPageData();
		rhs.put("info_type", "success");
		rhs.put("info", "create success!");
		return "success";
	}

	public String delete() throws Exception {
		String id = getpara("id");
		Hrworkshop hrworkshopdata = new Hrworkshop();
		hrworkshopdata.setId(Long.parseLong(id));
		baseDao.delete(hrworkshopdata);
		getPageData();
		rhs.put("info_type", "success");
		rhs.put("info", "delete success!");
		return "success";
	}

	public String update() throws Exception {
		String id = getpara("id");
		String column = ServletActionContext.getRequest()
				.getParameter("column");
		String columnValue = getpara("columnValue");
		if (column.equals("maxSize")) {
			int pageNum = Integer.parseInt(columnValue);
			if (pageNum != pagination.getMaxSize() && pageNum > 0) {
				pagination.setMaxSize(pageNum);
			}
		} else {
			Hrworkshop hrworkshop = (Hrworkshop) baseDao.loadById("Hrworkshop",
					Long.parseLong(id));
			BeanUtils.setProperty(hrworkshop, column, columnValue);
			baseDao.update(hrworkshop);
		}
		getPageData();
		rhs.put("info_type", "success");
		rhs.put("info", "update success!");
		return "success";
	}

	@SuppressWarnings("unchecked")
	public void getPageData() throws Exception {
		String pageId = ServletActionContext.getRequest()
				.getParameter("pageId");
		if (pageId == null || "".equals(pageId)) {
			pageId = (String) ServletActionContext.getRequest().getSession()
					.getAttribute("pageId");
			if (pageId == null || "".equals(pageId))
				pageId = "1";
		}
		ServletActionContext.getRequest().getSession()
				.setAttribute("pageId", pageId);
		pagination.setCurrentPage(Integer.parseInt(pageId));
		pagination.setMaxSize(1000);
		rhs.put("maxSize", 1000);
		List hrworkshopList = baseDao.page("from Hrworkshop", pagination);
		rhs.put("dataList", hrworkshopList);
		List countList = baseDao.find("from Hrworkshop");
		// rhs.put("maxSize", pagination.getMaxSize());

		rhs.put("count", countList.size());
		rhs.put("maxPage",
				countList.size() % pagination.getMaxSize() > 0 ? countList
						.size() / pagination.getMaxSize() + 1 : countList
						.size() / pagination.getMaxSize());
		rhs.put("currentPage", Integer.parseInt(pageId));
	}

	/**/
	public String report() throws Exception {
		rhs.put("year", getpara("year"));
		List hrworkshopList = baseDao
				.find("from Hrworkshop  w where w.beginDate like '"
						+ getpara("year") + "%'");
		rhs.put("dataUtil", new TimeUtil());
		Integer weeknumofcurrentyear = TimeUtil.getMaxWeekNumOfYear(2012);
		rhs.put("currentweek", TimeUtil.getWeekOfYear(new Date()));
		rhs.put("weeknumofcurrentyear", weeknumofcurrentyear);

		rhs.put("dataList", hrworkshopList);
		HashMap workshopHashMap = new HashMap();
		for (Iterator iterator = hrworkshopList.iterator(); iterator.hasNext();) {
			Hrworkshop hrworkshop = (Hrworkshop) iterator.next();
			workshopHashMap.put(hrworkshop.getTeacherName(), null);
		}
		rhs.put("workshopHashMap", workshopHashMap);
		return "success";
	}

	public String view() throws Exception {
		// User who = (User) infEa.getUserbyAccount(getpara("account"));
		// Map sessionMap = ActionContext.getContext().getSession();
		// sessionMap.put("userlogined", who);
		List hrworkshopList = baseDao.find("from Hrworkshop");
		rhs.put("dataList", hrworkshopList);
		return "success";
	}

	public String ajax_page_data() throws Exception {
		getPageData();
		return "success";
	}

	@Resource(name = "pagination")
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public HashMap getRhs() {
		return rhs;
	}

	public void setRhs(HashMap rhs) {
		this.rhs = rhs;
	}

}
