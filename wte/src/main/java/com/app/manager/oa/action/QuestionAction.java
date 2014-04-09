package com.app.manager.oa.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.app.common.base.action.BaseEaAction;
import com.app.ea.model.Organize;
import com.app.manager.oa.model.Question;

@Component("questionAction")
@SuppressWarnings("rawtypes")
public class QuestionAction extends BaseEaAction {
private static Logger log = LoggerFactory.getLogger(QuestionAction.class);
	private static String hsql_all = "from Question";
    public String get_list_sql(){
    	return hsql_all+" where topicid='"+getSessionValue("question_top_id") + "'";
    }
	public String menu_question() throws Exception {
		putSessionValue("question_top_id", getpara("id"));
		this.getPageData(get_list_sql());
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}

	public String create() throws Exception {
		Question question = new Question();
		question.setName("");
		question.setTopicid(getSessionValue("question_top_id").toString());
		baseDao.create(question);
		getPageData(get_list_sql());
		List countList = baseDao.find(get_list_sql());
		int maxPage = countList.size() % pagination.getMaxSize() > 0 ? countList
				.size() / pagination.getMaxSize() + 1
				: countList.size() / pagination.getMaxSize();
		pagination.setCurrentPage(maxPage);
		List questionList = baseDao.page(get_list_sql(), pagination);
		rhs.put("dataList", questionList);
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
		rhs.put("info", "�ı�˳��ɹ�!");
		getPageData(hsql_all);
		return "success";
	}
	public String delete() throws Exception {
		String id = getpara("id");
		Question questiondata = new Question();
		questiondata.setId(Long.parseLong(id));
		baseDao.delete(questiondata);
		getPageData(hsql_all);
		rhs.put("info_type", "success");
		rhs.put("info", "delete success!");
		return "success";
	}
	


	public String update() throws Exception {
		common_update(hsql_all);
		return "success";
	}   
	
     //�޸�ÿҳ��ʾ�ĸ���
	public String change_page_number() throws Exception {
		putSessionValue("maxSize", getpara("maxSize"));
		getPageData(hsql_all);
		rhs.put("info_type", "success");
		rhs.put("info", "");
		return "success";
	}
     //��ҳ
	public String ajax_page_data() throws Exception {
		getPageData(hsql_all);
		rhs.put("info_type", "success");
		rhs.put("info", "success!");
		return "success";
	}

	public String admin() throws Exception {
		List organizeRootList = infEa.getOrganizeRootNods();
		Organize organize=(Organize)infEa.getOrganizeByAlias("tech");
		
		rhs.put("organizeRootList", organize.getChildOrganizes());
		
		return "success";
	}

}
