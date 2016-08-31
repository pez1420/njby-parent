package com.njby.service;

import java.util.Date;
import java.util.List;
import java.util.zip.Inflater;

import com.njby.entity.Product;
import com.njby.entity.ProductImage;
import com.njby.entity.ProductType;
import com.njby.entity.search.SearchProduct;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

public interface ProductService extends BaseService<Product, String>{
	/**
	 *
	 * @param pageable
	 * @param searchProduct
     *
	 * @return
     */
	public abstract Page<Product> findPage(Pageable pageable, SearchProduct searchProduct);

	/**
	 *
	 * @param currentSn
	 *
	 * @return
     */
	public abstract boolean snExists(String currentSn);

	/**
	 *
	 * @param previousSn
	 *
	 * @param currentSn
     *
	 * @return
     */
	public abstract boolean snUnique(String previousSn, String currentSn);

	/**
	 *
	 * @param count
	 *
	 * @return
     */
	public abstract  List<Product> findList(Integer count);

	/**
	 *
	 * @param productType
	 *
	 * @param count
     *
	 * @return
     */
	public abstract  List<Product> findList(ProductType productType, Integer first, Integer count);

	/**
	 *
	 * @param productType
	 *
	 * @param beginDate
	 *
	 * @param endDate
	 *
	 * @param count
     *
	 * @return
     */
	public abstract  List<Product> findList(ProductType productType, Date beginDate, Date endDate, Integer first, Integer count);


	/**
	 * 找到产品对应的所有图片
	 *
	 * @param product
	 *
	 * @return
	 */
	public abstract List<ProductImage> findAllProductImage(Product product);

}
