package com.app.manager.demo;

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
import com.app.exam.model.Template;
@Component("impExam")
public class ImpExam extends ParentDemo implements InfDemo{
	private final Logger log = LoggerFactory.getLogger(ImpExam.class);
	public void initData() throws Exception {
		if(baseDao.find(" from User ").size()==0){
			//if(true){
		log.debug("初始化数据");
		User admin = create_user("admin", "Admin", "1324567890","admin@qq.com", "");
		User user_1 = create_user("test", "Test", "18688385892","", "");
		User user_xixi = create_user("xixi", "Xixi", "323232","", "");
		User user_hujun = create_user("hujun", "Hujun", "323232","", "");	
		User user_liuhua = create_user("liuhua", "Liuhua", "234455","", "");
		User user_limi= create_user("limi", "Limi", "234455","", "");
		
		User user_wangfei = create_user("wangfei", "Wangfei", "323232","", "");
		User user_hanchun= create_user("huchun", "Huchun", "234455","", "");
		User user_lili = create_user("lili", "Lili", "234455","", "");		
		User user_zhangli = create_user("zhangli", "Zhangli", "234455","", "");		
		Organize o1 = create_organize("部门架构", "department", null);
		Organize o11 = create_sub_organize(o1,"xx企业", "xx", null);		
		Organize o111 = create_sub_organize(o11,"生产部", "product",null );
		Organize o112 = create_sub_organize(o11,"客服", "surpport",null );
		
		Rolegroup r1 = create_rolegroup("部门", "rolegroup-department");
		Rolegroup rolegoupr_ceo = create_sub_rolegroup(r1, "CEO", "CEO");
		Rolegroup r10 = create_sub_rolegroup(rolegoupr_ceo, "部门经理", "department-manager");
		Rolegroup r14 = create_sub_rolegroup(r10, "员工", "member");
		
		Role role_product_ceo=createRole(o11.getId().toString(), rolegoupr_ceo.getId().toString());
		Role role_product_manager=createRole(o111.getId().toString(), r10.getId().toString());
		Role role_product_member=createRole(o111.getId().toString(), r14.getId().toString());

		Role role_surpport_manager=createRole(o112.getId().toString(), r10.getId().toString());
		Role role_surpport_member=createRole(o112.getId().toString(), r14.getId().toString());
		
		
		role_product_manager.setParentModel(role_product_ceo);
		role_surpport_manager.setParentModel(role_product_ceo);
		role_product_member.setParentModel(role_product_manager);
		role_surpport_member.setParentModel(role_surpport_manager);
		
	
		role_product_ceo.getUsers().add(user_xixi);
		role_product_manager.getUsers().add(user_hujun);
		role_product_member.getUsers().add(user_liuhua);
		role_product_member.getUsers().add(user_limi);
		
		role_surpport_manager.getUsers().add(user_wangfei);
		role_surpport_member.getUsers().add(user_hanchun);
		role_surpport_member.getUsers().add(user_lili);
		role_surpport_member.getUsers().add(user_zhangli);
		Rolegroup r2 = create_rolegroup("项目", "rolegroup-project");
		Rolegroup r21 = create_sub_rolegroup(r2, "项目经理", "project-manager");
		Rolegroup r211 = create_sub_rolegroup(r21, "领域主管", "group-leader");
		Rolegroup r2111 = create_sub_rolegroup(r211, "组长", "team-leder");
		Rolegroup r21111 = create_sub_rolegroup(r2111, "成员", "team-member");
		Rolegroup r211111 = create_sub_rolegroup(r2111, "第三方成员", "helper");		
		
		
		
		
		Systempara sp1 = create_systempara("user-status", "用户状态");
		Systempara sp11 = create_sub_systempara(sp1, "normal", "在职");
		Systempara sp12 = create_sub_systempara(sp1, "levea", "离职");
		
	
		Resource r0 = create_resource("系统管理", "system-admin", null);
		Resource r01 = create_sub_resource(r0, "组织架构管理","organize-admin","ea_organize_menu_organize.do");
		Resource r02 = create_sub_resource(r0, "岗位管理","positon-admin","ea_rolegroup_menu_rolegroup.do");
		Resource r03 = create_sub_resource(r0, "职位管理","role-admin","ea_ea_menu_relation.do");
		Resource r04 = create_sub_resource(r0, "人员管理","user-admin","ea_user_list.do");
		Resource r05 = create_sub_resource(r0, "权限管理","resource-admin","ea_resource_menu_resource.do");
		Resource r06 = create_sub_resource(r0, "邮件服务器设置 ","smtp_menu_smtp_init", "ea_smtp_menu_smtp_init.do");
		Resource r07 = create_sub_resource(r0, "系统参数 ","smtp_menu_smtp_init", "ea_systempara_menu_systempara.do");	
		
		admin.getResources().add(r0);
		admin.getResources().add(r01);
		admin.getResources().add(r02);
		admin.getResources().add(r03);
		admin.getResources().add(r04);
		admin.getResources().add(r05);
		admin.getResources().add(r06);
		admin.getResources().add(r07);
		
		
		
		//add exam information
		Set<Knowledge> knowledges1 = new HashSet<Knowledge>();
		Set<Knowledge> knowledges2 = new HashSet<Knowledge>();
		Set<Knowledge> knowledges3 = new HashSet<Knowledge>();
		Set<Knowledge> knowledges4 = new HashSet<Knowledge>();
		//知识领域
		Knowledge kl1 = new Knowledge();
		kl1.setName("language");
		kl1.setAlias("语言");
		
		Knowledge kl11 = new Knowledge();
		kl11.setName("C");
		kl11.setParentModel(kl1);
		knowledges1.add(kl11);
		
		Knowledge kl12 = new Knowledge();
		kl12.setName("Java");
		kl12.setParentModel(kl1);
		knowledges2.add(kl12);
		
		Knowledge kl13 = new Knowledge();
		kl13.setName("Shell");
		kl13.setParentModel(kl1);
		knowledges3.add(kl13);
		
		Knowledge kl2 = new Knowledge();
		kl2.setName("business");
		kl2.setAlias("业务");
		
		Knowledge kl21 = new Knowledge();
		kl21.setName("SIM");
		kl21.setParentModel(kl2);
		knowledges4.add(kl21);
		
		Knowledge kl22 = new Knowledge();
		kl22.setName("GPRS");
		kl22.setParentModel(kl2);

		
		//题目
		Item item1 = new Item();
		item1.setContent("Java test question demo 1");
		item1.setType(1);
		item1.setRefkey("3");
		item1.setMark("25");
		item1.setKnowledge(knowledges1);
		
		Item item2 = new Item();
		item2.setContent("Java test question demo 2");
		item2.setType(1);
		item2.setRefkey("2");
		item2.setMark("25");
		item2.setKnowledge(knowledges2);
		
		Item item3 = new Item();
		item3.setContent("Java test question demo 3");
		item3.setType(1);
		item3.setRefkey("3");
		item3.setMark("25");
		item3.setKnowledge(knowledges3);
		
		Item item4 = new Item();
		item4.setContent("Java test question demo 4");
		item4.setType(1);
		item4.setRefkey("1");
		item4.setMark("25");
		item4.setKnowledge(knowledges4);
		
		
		//选项
		Choiceitem choiceitem1 = new Choiceitem();
		Choiceitem choiceitem2 = new Choiceitem();
		Choiceitem choiceitem3 = new Choiceitem();
		Choiceitem choiceitem4 = new Choiceitem();
		choiceitem1.setRefid(1);
		choiceitem1.setValue("Option 1");
		choiceitem2.setRefid(2);
		choiceitem2.setValue("Option 2");
		choiceitem3.setRefid(3);
		choiceitem3.setValue("Option 3");
		choiceitem4.setRefid(4);
		choiceitem4.setValue("Option 4");
		choiceitem1.setItem(item1);
		choiceitem2.setItem(item1);
		choiceitem3.setItem(item1);
		choiceitem4.setItem(item1);
		
		Choiceitem choiceitem5 = new Choiceitem();
		Choiceitem choiceitem6 = new Choiceitem();
		Choiceitem choiceitem7 = new Choiceitem();
		Choiceitem choiceitem8 = new Choiceitem();
		choiceitem5.setRefid(1);
		choiceitem5.setValue("Option 1");
		choiceitem6.setRefid(2);
		choiceitem6.setValue("Option 2");
		choiceitem7.setRefid(3);
		choiceitem7.setValue("Option 3");
		choiceitem8.setRefid(4);
		choiceitem8.setValue("Option 4");
		choiceitem5.setItem(item2);
		choiceitem6.setItem(item2);
		choiceitem7.setItem(item2);
		choiceitem8.setItem(item2);
		
		Choiceitem choiceitem9 = new Choiceitem();
		Choiceitem choiceitem10 = new Choiceitem();
		Choiceitem choiceitem11 = new Choiceitem();
		Choiceitem choiceitem12 = new Choiceitem();
		choiceitem9.setRefid(1);
		choiceitem9.setValue("Option 1");
		choiceitem10.setRefid(2);
		choiceitem10.setValue("Option 2");
		choiceitem11.setRefid(3);
		choiceitem11.setValue("Option 3");
		choiceitem12.setRefid(4);
		choiceitem12.setValue("Option 4");
		choiceitem9.setItem(item3);
		choiceitem10.setItem(item3);
		choiceitem11.setItem(item3);
		choiceitem12.setItem(item3);
		
		Choiceitem choiceitem13 = new Choiceitem();
		Choiceitem choiceitem14 = new Choiceitem();
		Choiceitem choiceitem15 = new Choiceitem();
		Choiceitem choiceitem16 = new Choiceitem();
		choiceitem13.setRefid(1);
		choiceitem13.setValue("Option 1");
		choiceitem14.setRefid(2);
		choiceitem14.setValue("Option 2");
		choiceitem15.setRefid(3);
		choiceitem15.setValue("Option 3");
		choiceitem16.setRefid(4);
		choiceitem16.setValue("Option 4");
		choiceitem13.setItem(item4);
		choiceitem14.setItem(item4);
		choiceitem15.setItem(item4);
		choiceitem16.setItem(item4);
		
		baseDao.create(kl1);
		baseDao.create(kl2);
		baseDao.create(kl11);
		baseDao.create(kl12);
		baseDao.create(kl13);
		baseDao.create(kl21);
		baseDao.create(kl22);
		
		baseDao.create(item1);
		baseDao.create(item2);
		baseDao.create(item3);
		baseDao.create(item4);
		
		baseDao.create(choiceitem1);
		baseDao.create(choiceitem2);
		baseDao.create(choiceitem3);
		baseDao.create(choiceitem4);
		baseDao.create(choiceitem5);
		baseDao.create(choiceitem6);
		baseDao.create(choiceitem7);
		baseDao.create(choiceitem8);
		baseDao.create(choiceitem9);
		baseDao.create(choiceitem10);
		baseDao.create(choiceitem11);
		baseDao.create(choiceitem12);
		baseDao.create(choiceitem13);
		baseDao.create(choiceitem14);
		baseDao.create(choiceitem15);
		baseDao.create(choiceitem16);
		
		Template template = new Template();
		int p = 0,j = 0,k = 0,l = 0;
		int totalmark = 0;
		
		Set<Item> items = new HashSet<Item>();
		items.add(item1);
		items.add(item2);
		items.add(item3);
		items.add(item4);
		
		template.setItems(items);
		template.setRmdsinglechoice(0);
		template.setRmdmultichoice(0);
		template.setRmdblank(0);
		template.setRmdessay(0);
		for (Item item : items) {
			totalmark += Integer.valueOf(item.getMark());
			switch(item.getType()){
			case 1:
				p++;
				break;
			case 2:
				j++;
				break;
			case 3:
				k++;
				break;
			case 4:
				l++;
				break;
			}
		}
		template.setSinglechoice(p);
		template.setMultichoice(j);
		template.setBlank(k);
		template.setEssay(l);
		template.setTitle("Auto Template_" + new Date().toLocaleString());
		baseDao.create(template);
		Paper paper = new Paper();
		paper.setName("Auto Paper_" + new Date().toLocaleString());
		paper.setTemplate(template);
		paper.setTotalmark(totalmark);
		baseDao.create(paper);
		
		
		//end
		
		baseDao.update(admin);
	    
		
		}
	}
}
