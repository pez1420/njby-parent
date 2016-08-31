package com.njby.service;

import com.njby.entity.AdPosition;
import com.njby.entity.search.SearchAdPosition;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

public interface AdPositionService extends BaseService<AdPosition, String> {

	/***
	 * 
	 * 返回广告位分页结果
	 * 
	 * @param pageable
	 * 			分页
	 * @param searchAdPosition
	 * 			搜索位置
	 * @return
	 */
	public abstract Page<AdPosition> findPage(Pageable pageable,
											  SearchAdPosition searchAdPosition);


	/***
	 * 返回Json 字符串
	 * 
	 * @return
	 */
	public abstract String findAdPositionsJson();
}
