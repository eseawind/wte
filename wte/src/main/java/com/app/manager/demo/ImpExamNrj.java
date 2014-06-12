package com.app.manager.demo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.app.common.spring.ssh.dao.BaseDao;
import com.app.common.spring.ssh.model.BaseModel;
import com.app.ea.api.ImpEa;
import com.app.ea.api.InfEa;
import com.app.ea.demo.InfDemo;
import com.app.ea.demo.ParentDemo;
import com.app.ea.model.Organize;
import com.app.ea.model.Organizegroup;
import com.app.ea.model.Resource;
import com.app.ea.model.Role;
import com.app.ea.model.Rolegroup;
import com.app.ea.model.Systempara;
import com.app.ea.model.User;
import com.app.exam.model.Choiceitem;
import com.app.exam.model.Item;
import com.app.exam.model.Knowledge;
import com.app.exam.model.Paper;
@Component("impExamNrj")
public class ImpExamNrj extends ParentDemo implements InfDemo{
	private final Logger log = LoggerFactory.getLogger(ImpExamNrj.class);
	public void initData() throws Exception {
		if(baseDao.find(" from User ").size()==0){
			//if(true){
		log.debug("初始化数据");
		User admin = create_user("admin", "Admin", "1324567890","admin@qq.com", "");
		User user_1 = create_user("test", "Test", "18688385892","", "");

		
		//add exam information
		Set<Knowledge> knowledges1 = new HashSet<Knowledge>();
		//知识领域
		Knowledge kl1 = new Knowledge();
		kl1.setName("NRJ");
		kl1.setAlias("NRJ");
		
		baseDao.create(kl1);

		Knowledge kl11 = new Knowledge();
		kl11.setName("IQ(Implementation Quality)");
		kl11.setParentModel(kl1);
		knowledges1.add(kl1);
		
		Knowledge kl12 = new Knowledge();
		kl12.setName(" SCM(Site Control Manager))");
		kl12.setParentModel(kl1);
		knowledges1.add(kl1);		
		
		baseDao.create(kl11);
		baseDao.create(kl12);
		//题目
		Item item1 = new Item();
		item1.setContent("What is definition of \"Power activity\"? (電源作業とは何ですか？)");
		item1.setType(1);
		item1.setRefkey("3");
		item1.setMark("25");
		item1.getKnowledge().add(kl11);
		baseDao.create(item1);

		
		Choiceitem choiceitem1 = new Choiceitem();
		Choiceitem choiceitem2 = new Choiceitem();
		Choiceitem choiceitem3 = new Choiceitem();
		Choiceitem choiceitem4 = new Choiceitem();
		choiceitem1.setRefid(1);
		choiceitem1.setValue("Power cable connection, when there is live power cable in the cabinet ( 電源用活線があるキャビネットにおいて、電源ーブルの接続を行う作業)");
		choiceitem2.setRefid(2);
		choiceitem2.setValue("All of the options are correct (Option全て当てはまる)");
		choiceitem3.setRefid(3);
		choiceitem3.setValue("Power On/Off by mechanical switch or command execution(スイッチもしくはコマンドによる、電源のオン・オフを行う作業)");
		choiceitem4.setRefid(4);
		choiceitem4.setValue("Using outlet inside of equipment’s cabinet for OA equipment (PC, etc.) (OA機器（PC等）のため、キャビネット内のコンセントを使用する作業 )");

		choiceitem1.setItem(item1);
		choiceitem2.setItem(item1);
		choiceitem3.setItem(item1);
		choiceitem4.setItem(item1);
		baseDao.create(choiceitem1);
		baseDao.create(choiceitem2);
		baseDao.create(choiceitem3);
		baseDao.create(choiceitem4);

		baseDao.update(item1);
		
		
		}
	}
}
