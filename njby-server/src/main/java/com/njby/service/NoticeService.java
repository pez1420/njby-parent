package com.njby.service;

import java.util.List;

import com.njby.entity.Notice;
import com.njby.entity.search.SearchNotice;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

public interface NoticeService extends BaseService<Notice, String> {
	
	/**
	 * 按分页条件和查询参数对返回结果进行分页
	 * @param pageable
	 * 			分页条件
	 * 
	 * @param searchNotice
	 * 			查询参数
	 * 
	 * @return
	 */
	public abstract Page<Notice> findPage(Pageable pageable, SearchNotice searchNotice);
	
	/**
	 * 通告列表数目
	 * 
	 * @param count
	 * 			列表数目
	 * @return
	 */
	public abstract List<Notice> findList(Integer count);
}
