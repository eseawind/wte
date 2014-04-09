package com.app.manager.oa.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.app.common.spring.ssh.model.BaseModel;


@Entity
@Table(name = "oa_teatpaperdetail")
public class Testpaperdetail extends BaseModel {
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long sortNob = 0l;
	private String topicid;  //主题id
	private String number;  //试题个数
	Testpaper Testpaper ;
		
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	private String name;

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public Long getSortNob() {
		return sortNob;
	}

	public void setSortNob(Long sortNob) {
		this.sortNob = sortNob;
	}
  
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "Testpaper_id", nullable = true)
	public Testpaper getTestpaper() {
		return Testpaper;
	}

	public void setTestpaper(Testpaper Testpaper) {
		this.Testpaper = Testpaper;
	}

	public String getTopicid() {
		return topicid;
	}

	public void setTopicid(String topicid) {
		this.topicid = topicid;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	
	
}