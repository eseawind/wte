package com.app.manager.oa.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.app.common.base.action.BaseEaAction;
import com.app.common.spring.ssh.model.BaseModel;
import com.app.ea.model.Organize;
import com.app.ea.model.User;

@Component("oaAction")
@Scope("prototype")
public class OaAction extends BaseEaAction {
	private final Logger log = LoggerFactory.getLogger(OaAction.class);
	private String fileFileName;
	public User user = new User();
	private File file;

	public String execute() {
		return "main";
	}

	public String create_user_role_relation() {
		infEa.putUserToRole(getpara("userId"), getpara("roleId"));
		return "success";
	}

	public String regedit() throws Exception {
		 User u = null;
		    if(!(getpara("id").equals("")))
		    	 u = (User) infEa.getbaseDao().loadById("User", Long.parseLong(getpara("id")));
		    if(!(getpara("account").equals("")))
		    	 u = (User)  infEa.getUserbyAccount(getpara("account"));
			if(u==null)	
		     u = (User) infEa.getUserbyAccount(getCurrentAccount());
			
	    List<Organize> organizelist = infEa
				.getOrganizeByOrganizegroupAlias("tech");
		rhs.put("organizelist", organizelist);
		rhs.put("user", u);
		return "success";

	}

	public String user_deploy() throws Exception {
		User who = (User) infEa.getUserbyAccount(getpara("account"));
		rhs.put("techlist", infEa.getOrganizeByOrganizegroupAlias("tech"));
		
		rhs.put("projectlist", infEa.getOrganizeByOrganizegroupAlias("project"));
		rhs.put("user_roles", who.getRoles());
		rhs.put("user", who);

		return "success";
	}
	
	
	public String regeditSave() throws Exception {
		User who = (User) infEa.getUserbyAccount(user.getAccount());
		String imagefilename = who.getImgfilename();
		user.setRoles(who.getRoles());
		user.setResources(who.getResources());
		try {
			String filepath = System.getProperty("webroot",
					"./src/main/webapp/");
			InputStream is = new FileInputStream(file);
			String fileName = this.getFileFileName();

			imagefilename = who.getAccount()
					+ fileName.substring(fileName.lastIndexOf("."));
			File deskFile = new File(filepath + "file/photo/", imagefilename);
			OutputStream os = new FileOutputStream(deskFile);
			byte[] bytefer = new byte[1024];
			int length = 0;
			while ((length = is.read(bytefer)) != -1) {
				os.write(bytefer, 0, length);
			}
			os.close();
			is.close();

		} catch (Exception e) {
			log.debug(e.toString());
		}

		BeanUtils.copyProperties(who, user);
		who.setImgfilename(imagefilename);
		infEa.updateOjbect(who);
		rhs.put("user", who);
		
	    List<Organize> organizelist = infEa
				.getOrganizeByOrganizegroupAlias("tech");
		rhs.put("organizelist", organizelist);
		putSessionValue("userlogined", user);
		// return "regedit";
		return "success";
	}

	public String regedit_sum() throws Exception {
		List organizeRootList = infEa.getOrganizeRootNods();
		rhs.put("userlist", infEa.getAllUser());
		rhs.put("organizeRootList", organizeRootList);
		return "success";
	}
    

	public String edit_bean_property() throws IllegalAccessException,
			InvocationTargetException, NoSuchMethodException {
		String op = getpara("op");
		String id = getpara("id");
		String objectname = getpara("objectname"); // 对象名'
		String propertyname = getpara("propertyname"); // 对象名'
		String content = getpara("content");
		BaseModel object = (BaseModel) baseDao.loadById(objectname,
				Long.parseLong(id));
		if (op.equals("r")) {
			content = BeanUtils.getProperty(object, propertyname);
		}

		if (op.equals("w")) {
			try {
				BeanUtils.setProperty(object, propertyname, content);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			baseDao.update((BaseModel) object);
		}
		rhs.put("content", content);

		rhs.put("objectname", objectname);
		rhs.put("propertyname", propertyname);
		rhs.put("id", id);
		rhs.put("op", op);
		return "success";
	}

	
	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

}
