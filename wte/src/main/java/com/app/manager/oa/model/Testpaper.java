package com.app.manager.oa.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.app.common.spring.ssh.model.BaseModel;


@Entity
@Table(name = "oa_testpaper")
public class Testpaper extends BaseModel {
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long sortNob = 0l;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	private String name;
	private Set<Testpaperdetail> testpaperdetails = new HashSet<Testpaperdetail>();
	public String getName() {
		return name;
	}
	
	
	
	@OneToMany(mappedBy = "testpaper", cascade = CascadeType.ALL)
	public Set<Testpaperdetail> getTestpaperdetails() {
		return testpaperdetails;
	}
	
	public void setTestpaperdetails(Set<Testpaperdetail> testpaperdetails) {
		this.testpaperdetails = testpaperdetails;
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
}