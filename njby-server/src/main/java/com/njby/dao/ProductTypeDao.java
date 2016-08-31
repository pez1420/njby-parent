package com.njby.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.njby.entity.ProductType;
import com.njby.entity.search.SearchProductType;
import com.njby.utils.Pageable;

public interface ProductTypeDao extends BaseDao<ProductType, String>{
	
	/***
	 * 返回分页结果
	 * 
	 * @param pageable
	 * 			分页对象
	 * @param searchProductType
	 * 			搜索条件
	 * @return
	 */
	public abstract List<ProductType> findPage(@Param("pageable") Pageable pageable,
											   @Param("search") SearchProductType searchProductType);

	/***
	 * 
	 * @param count
	 * @return
	 */
	public abstract List<ProductType> findRoots(Integer count);

	/***
	 * 
	 * 返回父节点列表
	 * 
	 * @param ids
	 * 			所有父亲节点ID列表
	 * @param count
	 * 			所需的父亲节点数目
	 * @return
	 */
	public abstract List<ProductType> findParents(
			@Param("ids") List<String> ids, @Param("count") Integer count);

	/***
	 * 
	 * 给定当前父类型和所需孩子数目,返回孩子类型列表
	 * 
	 * @param parent
	 * @param count
	 * @return
	 */
	public abstract List<ProductType> findChildrens(
			@Param("parent") ProductType parent, @Param("count") Integer count);
	
	
	/***
	 * 统计该类型产品数量
	 * 
	 * @param id
	 * @return
	 */
	public abstract long countProducts(String id);
	
}
