package com.njby.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.njby.entity.ProductType;
import com.njby.entity.search.SearchProductType;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

public interface ProductTypeService extends BaseService<ProductType, String> {
	
	/**
	 * 根据搜索条件返回分页商品类型列表
	 * 
	 * @param pageable
	 * 			分页对象
	 * 
	 * @param searchProductType
	 * 			搜索条件
	 * 
	 * @return
	 */
	public abstract Page<ProductType> findPage(@Param("pageable") Pageable pageable,
											   @Param("search") SearchProductType searchProductType);
	
	/***
	 * 寻找parent为空的所有商品类型
	 * 
	 * @param count
	 * 		商品数量
	 * 
	 * @return
	 */
	public abstract List<ProductType> findRoots(Integer count);
	
	/***
	 * 找到当前节点的所有父节点
	 * 
	 * @param ids
	 * 
	 * @param count
	 * 
	 * @return
	 */
	public abstract List<ProductType> findParents(List<String> ids, Integer count);
	
	/***
	 * 
	 * @param productType
	 * @param count
	 * @return
	 */
	public abstract List<ProductType> findParents(ProductType productType, Integer count);
	
	/**
	 * 
	 * @param parent
	 * @param count
	 * @return
	 */
	public abstract List<ProductType> findChildrens(ProductType parent, Integer count);
	
	/**
	 * 
	 * @param parent
	 * @return
	 */
	public abstract List<ProductType> findChildrens(ProductType parent);
	
	/***
	 * 返回整颗树的数据，其实就是返回所有类型数据
	 * 
	 * @return
	 */
	public abstract List<ProductType> findTree();

	/***
	 * 统计该类类型产品对应的孩子数量
	 * 
	 * @param id
	 * @return
	 */
	public abstract long countProducts(String id);
}
