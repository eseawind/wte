package com.app.manager.oa.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.app.common.base.action.BaseEaAction;
import com.app.manager.oa.model.Customer;

@Component("customerAction")
@SuppressWarnings("rawtypes")
public class CustomerAction extends BaseEaAction {
	private static Logger log = LoggerFactory.getLogger(CustomerAction.class);
	private static String hsql_all = "from Customer";
	
	private String get_list_sql() {
		return "from Customer where projectId = '" + getCurrentProjectId() + "' ";
	}

	public String menu_customer() throws Exception {
		System.out.println();
		System.out.println("进入了");
		this.getPageData(get_list_sql());
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}

	public String create() throws Exception {
		Customer customer = new Customer();
		customer.setName("");
		customer.setProjectId(getCurrentProjectId());
		baseDao.create(customer);
		getPageData(get_list_sql());
		List countList = baseDao.find(get_list_sql());
		int maxPage = countList.size() % pagination.getMaxSize() > 0 ? countList
				.size() / pagination.getMaxSize() + 1
				: countList.size() / pagination.getMaxSize();
		pagination.setCurrentPage(maxPage);
		List customerList = baseDao.page(get_list_sql(), pagination);
		rhs.put("dataList", customerList);
		rhs.put("maxSize", pagination.getMaxSize());
		rhs.put("count", countList.size());
		rhs.put("maxPage", maxPage);
		rhs.put("currentPage", maxPage);
		rhs.put("info_type", "success");
		rhs.put("info", "create success!");
		return "success";
	}
	public String change_rank() throws Exception {
		common_change_rank(); 
		rhs.put("info_type", "success");
		rhs.put("info", "改变顺序成功!");
		getPageData(get_list_sql());
		return "success";
	}
	public String delete() throws Exception {
		String id = getpara("id");
		Customer customerdata = new Customer();
		customerdata.setId(Long.parseLong(id));
		baseDao.delete(customerdata);
		getPageData(get_list_sql());
		rhs.put("info_type", "success");
		rhs.put("info", "delete success!");
		return "success";
	}
	


	public String update() throws Exception {
		common_update(get_list_sql());
		return "success";
	}   
	
     //修改每页显示的个数
	public String change_page_number() throws Exception {
		putSessionValue("maxSize", getpara("maxSize"));
		getPageData(get_list_sql());
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}
     //翻页
	public String ajax_page_data() throws Exception {
		getPageData(get_list_sql());
		rhs.put("info_type", "success");
		rhs.put("info", "success!");
		return "success";
	}
	
	public String search() throws Exception {
		String name = "%" + getpara("name").toUpperCase() + "%";
		String hsql = get_list_sql() + " and upper(name) like ? ";
		List customerList = baseDao.find(hsql, name);
		rhs.put("customerName", getpara("name"));
		rhs.put("dataList", customerList);
		rhs.put("info_type", "success");
		return "success";
	}
	
	public String list_customer() throws Exception {
		this.getPageData(get_list_sql());
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}

}
