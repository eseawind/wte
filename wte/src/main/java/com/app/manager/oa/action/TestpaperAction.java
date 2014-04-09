package com.app.manager.oa.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.app.common.base.action.BaseEaAction;
import com.app.ea.model.Organize;
import com.app.manager.oa.model.Testpaper;
import com.app.manager.oa.model.Testpaperdetail;

@Component("testpaperAction")
@SuppressWarnings("rawtypes")
public class TestpaperAction extends BaseEaAction {
	private static Logger log = LoggerFactory.getLogger(TestpaperAction.class);
	private static String hsql_all = "from Testpaper";

	public String admin() throws Exception {
		Testpaper testpaper = (Testpaper) baseDao.loadById("Testpaper",Long.parseLong(getpara("id")));
		HashMap<String, Object> valueHashmap = new HashMap<String, Object>();
		for (Iterator iterator = testpaper.getTestpaperdetails().iterator(); iterator.hasNext();) {
			Testpaperdetail testpaperdetail = (Testpaperdetail) iterator.next();
			valueHashmap.put(testpaperdetail.getTopicid(), testpaperdetail.getNumber());
		}
		List organizeRootList = infEa.getOrganizeRootNods();
		Organize organize=(Organize)infEa.getOrganizeByAlias("tech");
		rhs.put("organizeRootList", organize.getChildOrganizes());
		rhs.put("value", valueHashmap);
		return "success";
	}

	public String change_topic_number() throws Exception {
	    log.debug("个数"+getpara("number"));
		return admin();
	}
	
	
	public String menu_testpaper() throws Exception {
	    	
		this.getPageData(hsql_all);
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}

	
	
	
	public String create() throws Exception {
		Testpaper testpaper = new Testpaper();
		testpaper.setName("");
		baseDao.create(testpaper);
		getPageData(hsql_all);
		List countList = baseDao.find(hsql_all);
		int maxPage = countList.size() % pagination.getMaxSize() > 0 ? countList
				.size() / pagination.getMaxSize() + 1
				: countList.size() / pagination.getMaxSize();
		pagination.setCurrentPage(maxPage);
		List testpaperList = baseDao.page("from Testpaper", pagination);
		rhs.put("dataList", testpaperList);
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
		getPageData(hsql_all);
		return "success";
	}
	public String delete() throws Exception {
		String id = getpara("id");
		Testpaper testpaperdata = new Testpaper();
		testpaperdata.setId(Long.parseLong(id));
		baseDao.delete(testpaperdata);
		getPageData(hsql_all);
		rhs.put("info_type", "success");
		rhs.put("info", "delete success!");
		return "success";
	}
	


	public String update() throws Exception {
		common_update(hsql_all);
		return "success";
	}   
	
     //修改每页显示的个数
	public String change_page_number() throws Exception {
		putSessionValue("maxSize", getpara("maxSize"));
		getPageData(hsql_all);
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}
     //翻页
	public String ajax_page_data() throws Exception {
		getPageData(hsql_all);
		rhs.put("info_type", "success");
		rhs.put("info", "success!");
		return "success";
	}

}
