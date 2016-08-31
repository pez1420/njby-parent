package com.njby.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.njby.entity.AdPosition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njby.dao.AdDao;
import com.njby.entity.Ad;
import com.njby.entity.search.SearchAd;
import com.njby.service.AdService;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

@Service
public class AdServiceImpl extends BaseServiceImpl<Ad, String> 
	implements AdService{

	@Resource
	private AdDao adDao;
	
	@Resource
	public void setBaseDao(AdDao adDao) {
		super.setBaseDao(adDao);
	}
	
	@Transactional(readOnly=true)
	public Page<Ad> findPage(Pageable pageable, SearchAd searchAd) {
		//分页并计算出总页数 
		List<Ad> ads = adDao.findPage(pageable, searchAd);
		Page<Ad> page = new Page<Ad>(ads, pageable);
		return page;
	}

	@Transactional(readOnly=true)
	public Ad findWithAdPostion(String id) {
		return this.adDao.findWithAdPostion(id);
	}

	@Transactional(readOnly=true)
	public List<Ad> findList(Integer count, Integer adType, AdPosition adPosition) {
		return this.adDao.findList(count, adType, adPosition);
	}


}
