package com.njby.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njby.dao.AdPositionDao;
import com.njby.entity.AdPosition;
import com.njby.entity.search.SearchAdPosition;
import com.njby.service.AdPositionService;
import com.njby.utils.JsonUtil;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

@Service
public class AdPositionServiceImpl extends BaseServiceImpl<AdPosition, String>
		implements AdPositionService {

	private final static String ID = "id";
	private final static String NAME = "name";
	private final static String WIDTH = "width";
	private final static String HEIGHT = "height";
	
	@Resource
	private AdPositionDao adPositionDao;

	@Resource
	public void setBaseDao(AdPositionDao adPositionDao) {
		super.setBaseDao(adPositionDao);
	}

	@Transactional(readOnly = true)
	public Page<AdPosition> findPage(Pageable pageable,
			SearchAdPosition searchAdPosition) {
		// 分页并计算出总页数
		List<AdPosition> adPositions = adPositionDao.findPage(pageable,
				searchAdPosition);
		Page<AdPosition> page = new Page<AdPosition>(adPositions, pageable);
		return page;
	}

	@Transactional(readOnly = true)
	public String findAdPositionsJson() {
		List<LinkedHashMap<String, Object>> adPositions = this.adPositionDao.findAdPositionsMap();

		if (adPositions == null)
			adPositions = new ArrayList<LinkedHashMap<String, Object>>();		
		return JsonUtil.toJson(adPositions);
	}

}
