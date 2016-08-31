package com.njby.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.njby.entity.ProductType;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njby.dao.ProductDao;
import com.njby.entity.Product;
import com.njby.entity.ProductImage;
import com.njby.entity.search.SearchProduct;
import com.njby.service.ProductService;
import com.njby.utils.Page;
import com.njby.utils.Pageable;


@Service
public class ProductServiceImpl extends BaseServiceImpl<Product, String> 
	implements ProductService{
	
	@Resource
	private ProductDao productDao;
	
	@Resource
	public void setBaseDao(ProductDao productDao) {
		super.setBaseDao(productDao);
	}

	@Transactional
	public void save(Product product) {
		//先保存图片productImage
		//再保存product
		super.save(product);
		List<ProductImage> productImages = product.getProductImages();
		if (productImages != null && !productImages.isEmpty()) {
			for (ProductImage productImage : productImages)
				this.productDao.saveProductImage(productImage);
		}
	}

	@Transactional
	public void update(Product product) {
		super.update(product);
		//删除已经不存在的图片
		String[] productImageIds = product.getProductImageIds();
		if (ArrayUtils.isNotEmpty(productImageIds))
			this.productDao.deleteProductImageByNotInIds(product.getId(), productImageIds);

		//保存图片
		List<ProductImage> productImages = product.getProductImages();
		if (productImages != null && !productImages.isEmpty()) {
			for (ProductImage productImage : productImages)
				this.productDao.saveProductImage(productImage);
		}


	}

	@Transactional(readOnly=true)
	public Page<Product> findPage(Pageable pageable, SearchProduct searchProduct) {
		//分页并计算出总页数 
		List<Product> products = productDao.findPage(pageable, searchProduct);
		Page<Product> page = new Page<Product>(products, pageable);
		return page;
	}

	@Transactional(readOnly=true)
	public boolean snExists(String sn) {
		return this.productDao.snExists(sn) > 0L;
	}
	
	@Transactional(readOnly=true)
	public boolean snUnique(String previousSn, String currentSn) {
	    if (StringUtils.equalsIgnoreCase(previousSn, currentSn)) {
	        return true;
	    }

	    return !this.snExists(currentSn);
	}

	@Transactional(readOnly=true)
	public List<Product> findList(Integer count) {
		return this.productDao.findList(null, null, null, 0, count);
	}

	@Transactional(readOnly=true)
	public List<Product> findList(ProductType productType, Integer first, Integer count) {
		return this.productDao.findList(productType, null, null, 0, count);
	}

	@Transactional(readOnly=true)
	public List<Product> findList(ProductType productType, Date beginDate, Date endDate, Integer first, Integer count) {
		return this.productDao.findList(productType, beginDate, endDate, first, count);
	}

	@Transactional(readOnly=true)
	public List<ProductImage> findAllProductImage(Product product) {
		return this.productDao.findAllProductImage(product);
	}
}
