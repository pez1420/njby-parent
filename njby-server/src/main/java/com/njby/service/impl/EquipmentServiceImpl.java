package com.njby.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.njby.entity.EquipmentImage;
import com.njby.entity.ProductImage;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njby.entity.Equipment;
import com.njby.entity.Equipment;
import com.njby.entity.search.SearchEquipment;
import com.njby.service.impl.BaseServiceImpl;
import com.njby.service.EquipmentService;
import com.njby.utils.Page;
import com.njby.utils.Pageable;
import com.njby.dao.EquipmentDao;

/**
 * @pez1420 pez1420(pez1420@163.com)
 * @date 2015-10-11
 */
@Service
public class EquipmentServiceImpl extends BaseServiceImpl<Equipment, String> implements EquipmentService{

    @Resource
    private EquipmentDao equipmentDao;

    @Resource
    public void setBaseDao(EquipmentDao equipmentDao){
        super.setBaseDao(equipmentDao);
    }

	@Transactional(readOnly=false)
	public void save(Equipment equipment) {
		super.save(equipment);
		List<EquipmentImage> equipmentImages = equipment.getEquipmentImages();
		if (equipmentImages != null && !equipmentImages.isEmpty()) {
			for (EquipmentImage equipmentImage : equipmentImages) {
				;this.equipmentDao.saveEquipmentImage(equipmentImage);
			}
		}
	}

	@Transactional(readOnly=false)
	public void update(Equipment equipment) {
		super.update(equipment);
		String[] equipmentImageIds = equipment.getEquipmentImageIds();

		if (ArrayUtils.isNotEmpty(equipmentImageIds))
			this.equipmentDao.deleteEquipmentImageByNotInIds(equipment.getId(), equipmentImageIds);

		//保存图片
		List<EquipmentImage> equipmentImages = equipment.getEquipmentImages();
		if (equipmentImages != null && !equipmentImages.isEmpty()) {
			for (EquipmentImage equipmentImage : equipmentImages)
				this.equipmentDao.saveEquipmentImage(equipmentImage);
		}
	}

	@Transactional(readOnly=true)
	public Page<Equipment> findPage(Pageable pageable,
			SearchEquipment searchEquipment) {
		// 分页并计算出总页数
		List<Equipment> equipments = equipmentDao.findPage(pageable, searchEquipment);
		Page<Equipment> page = new Page<Equipment>(equipments, pageable);
		return page;
	}

	 @Transactional(readOnly=true)
	public List<Equipment> findList(Integer count) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional(readOnly=true)
	public List<EquipmentImage> findAllEquipmentImage(Equipment equipment) {
		return this.equipmentDao.findAllEquipmentImage(equipment);
	}

	@Transactional
	public void remove(String... ids) {
		if (ids != null && ids.length != 0) {
			for (String id : ids) {
				//先删除图片
				this.equipmentDao.deleteEquipmentImageByEquipmentId(id);
				//再删除记录
				super.remove(id);
			}
		}
	}

}