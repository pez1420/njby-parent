package com.njby.service;

import java.util.List;

import com.njby.entity.EquipmentImage;
import com.njby.service.BaseService;
import com.njby.utils.Page;
import com.njby.utils.Pageable;
import com.njby.entity.Equipment;
import com.njby.entity.search.SearchEquipment;

/**
 * @pez1420 pez1420(pez1420@163.com)
 * @date 2015-10-11
 */
public interface EquipmentService extends BaseService<Equipment, String>{

	/**
	 *
	 * @param pageable
	 *
	 * @param searchEquipment
     *
	 * @return
     */
	public abstract Page<Equipment> findPage(Pageable pageable,
											 SearchEquipment searchEquipment);

	/**
	 *
	 * @param count
	 *
	 * @return
     */
	public abstract List<Equipment> findList(Integer count);

	/**
	 * 找到所有设备图片
	 *
	 * @param equipment
	 *
	 * @return
     */
	public abstract  List<EquipmentImage> findAllEquipmentImage(Equipment equipment);

}