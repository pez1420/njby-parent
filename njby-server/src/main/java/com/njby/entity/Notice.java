package com.njby.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.google.gson.annotations.Expose;
import com.system.ananotation.EntityInfo;
import com.system.ananotation.Meaning;

@EntityInfo("通告")
public class Notice extends BaseEntity{
	private static final long serialVersionUID = -5512666136675837530L;
	
	@Meaning("标题")
	@Expose
	private String title;
	@Meaning("内容")
	@Expose
	private String content;
	@Meaning("作者")
	@Expose
	private String author;
	
	//seo优化
	@Expose
	private String seoTitle;
	@Expose
	private String seoKeywords;
	@Expose
	private String seoDescription;
	
	@Meaning("是否发布")
	@Expose
	private Boolean isPublication;
	
	@Meaning("点击数")
	@Expose
	private Integer hits;

	@NotNull(message = "title may be null!")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@NotNull(message = "content may be null!")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSeoTitle() {
		return seoTitle;
	}

	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle;
	}

	public String getSeoKeywords() {
		return seoKeywords;
	}

	public void setSeoKeywords(String seoKeywords) {
		this.seoKeywords = seoKeywords;
	}

	public String getSeoDescription() {
		return seoDescription;
	}

	public void setSeoDescription(String seoDescription) {
		this.seoDescription = seoDescription;
	}

	public Boolean getIsPublication() {
		return isPublication;
	}

	public void setIsPublication(Boolean isPublication) {
		this.isPublication = isPublication;
	}

	public Integer getHits() {
		return hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}
	
	
}
