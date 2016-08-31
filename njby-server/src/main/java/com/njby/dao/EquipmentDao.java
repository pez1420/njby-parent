package com.njby.dao;

import java.util.List;

import com.njby.entity.EquipmentImage;
import org.apache.ibatis.annotations.Param;

import com.njby.dao.BaseDao;
import com.njby.entity.Equipment;
import com.njby.entity.search.SearchEquipment;
import com.njby.utils.Pageable;

/**
 * @pez1420 pez1420(pez1420@163.com)
 * @date 2015-10-11
 */
public interface EquipmentDao extends BaseDao <Equipment, String> {

	/***
	 * 
	 * @param pageable
	 * @param searchEquipment
	 * @return
	 */
	public abstract List<Equipment> findPage(
			@Param("pageable") Pageable pageable,
			@Param("search") SearchEquipment searchEquipment);
	
	/***
	 * 返回设备列表
	 * 
	 * @param count
	 * @return
	 */
	public abstract List<Equipment> findList(Integer count);



	/***
	 * 保存产品图片
	 *
	 * @param equipmentImage
	 */
	public abstract void saveEquipmentImage(EquipmentImage equipmentImage);

	/**
	 * 找到产品对应的所有图片
	 *
	 * @param equipment
	 *
	 * @return
	 */
	public abstract List<EquipmentImage> findAllEquipmentImage(Equipment equipment);

	/**
	 * 删除不存在于ids数组中的所有产品图片
	 *
	 * @param ids
	 */
	public abstract  void deleteEquipmentImageByNotInIds(@Param("equipmentId") String equipmentId, @Param("array")String []ids);

	/**
	 * 根据设备ID删除对应的所有设备图像
	 *
	 * @param equipmentId
     */
	public abstract  void deleteEquipmentImageByEquipmentId(@Param("equipmentId")String equipmentId);
}