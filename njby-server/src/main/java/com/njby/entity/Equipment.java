package com.njby.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.annotations.Expose;


public class Equipment extends BaseEntity{

	private static final long serialVersionUID = 2395071636669536428L;
	@Expose
	private String name;
	@Expose
    private String introduction;
	
	@Expose
	private String keyword; //搜索关键词
	@Expose
	private String seoTitle; //页面标题
	@Expose
	private String seoKeywords; //页面关键词
	@Expose
	private String seoDescription; //页面描述
	
    private String thumbnailImage;

    private String largeImage;

    private List<EquipmentImage> equipmentImages = new ArrayList<EquipmentImage>();
    
    private MultipartFile[] files; //多个文件

	private String equipmentImageIds[];

    
	@NotNull
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

	public String getThumbnailImage() {
		return thumbnailImage;
	}

	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}

	public String getLargeImage() {
		return largeImage;
	}

	public void setLargeImage(String largeImage) {
		this.largeImage = largeImage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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

	public List<EquipmentImage> getEquipmentImages() {
		return equipmentImages;
	}

	public void setEquipmentImages(List<EquipmentImage> equipmentImages) {
		this.equipmentImages = equipmentImages;
	}

	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	
	@Transient
	public String getThumbnailPath() {
		if (getId() != null)
			return "/upload/" +  this.getThumbnailImage();
		
		return null;
	}

	@Transient
	public String getLargePath() {
		if (getId() != null)
			return "/upload/" +  this.getLargeImage();
		
		return null;
	}

	@Transient
	public String[] getEquipmentImageIds() {
		return equipmentImageIds;
	}

	public void setEquipmentImageIds(String[] equipmentImageIds) {
		this.equipmentImageIds = equipmentImageIds;
	}
}