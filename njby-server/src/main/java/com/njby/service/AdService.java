package com.njby.service;

import com.njby.entity.Ad;
import com.njby.entity.AdPosition;
import com.njby.entity.search.SearchAd;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

import java.util.List;

public interface AdService extends BaseService<Ad, String>{

	/****
	 * 
	 * 
	 * @param pageable
	 * 			分页
	 * @param searchAd
	 * 			搜索条件
	 * @return
	 */
	public abstract Page<Ad> findPage(Pageable pageable, SearchAd searchAd);
	
	
	
	/****
	 * 
	 * @param id
	 * 		广告Id
	 * @return
	 */
	public abstract Ad findWithAdPostion(String id);


	/**
	 *
	 * @param count
	 *
	 * @param adType
	 *
	 * @param adPosition
     * @return
     */
	public abstract List<Ad> findList(Integer count, Integer adType, AdPosition adPosition);

}
