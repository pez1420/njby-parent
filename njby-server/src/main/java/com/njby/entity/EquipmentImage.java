package com.njby.entity;


import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.system.ananotation.EntityInfo;

@EntityInfo("设备图片")
public class EquipmentImage extends BaseEntity{

	private static final long serialVersionUID = -6875510495694164529L;

	private String title;

    private String source;

    private String thumbnail;

    private Equipment equipment;

	private MultipartFile file;
	
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail == null ? null : thumbnail.trim();
    }

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}

	@Transient
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
    
}