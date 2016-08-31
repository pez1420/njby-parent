package com.njby.service;

import com.njby.entity.EquipmentImage;

public interface EquipmentImageService {
	
	/***
	 * 生产图片的缩略图
	 * @param equipmentImage
	 */
	public void build(EquipmentImage equipmentImage);
	
}
