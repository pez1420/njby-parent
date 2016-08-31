package com.njby.dao;

import java.util.Date;
import java.util.List;

import com.njby.entity.ProductType;
import org.apache.ibatis.annotations.Param;

import com.njby.entity.Product;
import com.njby.entity.ProductImage;
import com.njby.entity.search.SearchProduct;
import com.njby.utils.Pageable;

public interface ProductDao extends BaseDao<Product, String> {
	
	/**
	 * 产品分类分页
	 * 
	 * @param pageable
	 * 			分页
	 * @param searchProduct
	 * 			搜索条件
	 * @return
	 */
	public abstract List<Product> findPage(@Param("pageable") Pageable pageable,
										   @Param("search") SearchProduct searchProduct);
	
	/**
	 * 检查sn序列号是否存在
	 * 
	 * @param sn
	 * 		序列号
	 * 
	 * @return  是否存在
	 */
	public abstract long snExists(String sn);
	
	
	/**
	 * 产品列表
	 *
	 * @param count
	 * 
	 * @return
	 */
	public abstract  List<Product> findList(@Param("productType")ProductType productType,
											@Param("beginDate")Date beginDate,
											@Param("endDate")Date endDate,
											@Param("first") Integer first,
											@Param("count") Integer count);
	
	/***
	 * 保存产品图片
	 * 
	 * @param productImage
	 */
	public abstract void saveProductImage(ProductImage productImage);

	/**
	 * 找到产品对应的所有图片
	 *
	 * @param product
	 *
	 * @return
     */
	public abstract List<ProductImage> findAllProductImage(Product product);

	/**
	 * 删除不存在于ids数组中的所有产品图片
	 *
	 * @param ids
     */
	public abstract  void deleteProductImageByNotInIds(@Param("productId") String productId, @Param("array")String []ids);

}
