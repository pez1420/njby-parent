package com.njby.dao;

import java.util.List;
import java.util.Map;

import com.njby.entity.AdPosition;
import org.apache.ibatis.annotations.Param;

import com.njby.entity.Ad;
import com.njby.entity.search.SearchAd;
import com.njby.utils.Pageable;

public interface AdDao extends BaseDao<Ad, String>{
	/**
	 * 按分页条件和查询参数对返回结果进行分页
	 * 
	 * @param pageable 前端分页数据
	 * @param searchAd 搜索条件 
	 * @return
	 */
	public abstract List<Ad> findPage(@Param("pageable") Pageable pageable,
									  @Param("search") SearchAd searchAd);
	
	
	
	/****
	 * 
	 * @param id
	 * 		广告Id
	 * @return
	 */
	public abstract Ad findWithAdPostion(String id);


	/**
	 * 根据广类型和广告位置以及数量返回广告列表
	 *
	 * @param count
	 *			数量
	 * @param adType
	 *			广告类型
	 * @param adPosition
	 * 			广告位置
	 * @return
	 */
	public abstract List<Ad> findList(@Param("count")Integer count,
									  @Param("adType")Integer adType,
									  @Param("adPosition")AdPosition adPosition);
}
