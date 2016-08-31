package com.njby.entity;


import com.google.gson.annotations.Expose;
import com.google.gson.internal.ObjectConstructor;
import com.njby.utils.FreemarkerUtils;
import com.system.ananotation.EntityInfo;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@EntityInfo("产品")
public class Product extends BaseEntity{
	private static final long serialVersionUID = -1174555358912287863L;

	private static  String staticPath;
	@Expose
	private String sn; //编号
	@Expose
	private String name; //名称
	@Expose
	private String price; //价格
	@Expose
	private String introduction; //产品介绍
	@Expose
	private String remark; //产品备注
	@Expose
	private Boolean isMarketable; //是否上架
	@Expose
	private Integer stock; //库存量
	@Expose
	private String keyword; //搜索关键词
	@Expose
	private String seoTitle; //页面标题
	@Expose
	private String seoKeywords; //页面关键词
	@Expose
	private String seoDescription; //页面描述
	
	//图片路径
	private String image;
	
	private ProductType productType; //产品类型
	private List<ProductImage> productImages = new ArrayList<ProductImage>();
	private MultipartFile imageFile;
	private MultipartFile[] files;

	private String[] productImageIds;

	static {
		try
		{
			File file = new ClassPathResource("/system.xml").getFile();
			Document document = new SAXReader().read(file);
			Element element = (Element)document.selectSingleNode("/system/template[@id='productDetail']");
			staticPath = element.attributeValue("staticPath");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getSn() {
		return sn;
	}
	
	public void setSn(String sn) {
		this.sn = sn;
	}
	
	@NotNull
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Boolean getIsMarketable() {
		return isMarketable;
	}
	
	public void setIsMarketable(Boolean isMarketable) {
		this.isMarketable = isMarketable;
	}
	
	public Integer getStock() {
		return stock;
	}
	
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getSeoTitle() {
		return seoTitle;
	}
	
	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle;
	}
	
	public String getSeoKeywords() {
		return seoKeywords;
	}
	
	public void setSeoKeywords(String seoKeywords) {
		this.seoKeywords = seoKeywords;
	}
	
	public String getSeoDescription() {
		return seoDescription;
	}
	
	public void setSeoDescription(String seoDescription) {
		this.seoDescription = seoDescription;
	}

	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}



	public List<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}

	@Transient
	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	
	
	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}

	@Transient
	public String[] getProductImageIds() {
		return productImageIds;
	}

	public void setProductImageIds(String[] productImageIds) {
		this.productImageIds = productImageIds;
	}

	@Transient
	public String getPath() {
		if (getId() != null)
			return "/upload/" + this.getImage();
		
		return null;
	}

	@Transient
	public String getStaticPath() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", getId());
		map.put("createDate", getCreateDate());
		map.put("modifyDate", getModifyDate());
		map.put("sn", getSn());
		map.put("name", getName());
		map.put("seoTitle", getSeoTitle());
		map.put("seoKeywords", getSeoKeywords());
		map.put("seoDescription", getSeoDescription());
		return FreemarkerUtils.process(staticPath, map);
	}


}
