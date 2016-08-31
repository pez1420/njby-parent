package com.njby.controller.admin;

import java.util.*;

import javax.annotation.Resource;


import com.njby.entity.Product;
import com.njby.entity.ProductType;
import com.njby.service.ProductTypeService;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njby.service.ProductService;
import com.njby.service.StaticService;

@Controller("adminStaticController")
@RequestMapping({ "/admin/static" })
public class StaticController extends BaseAdminController {
	
	public enum BuildType
	{
	  index,  aboutus, article,  product,  other;
	}
	
	@Resource
	private ProductService productService;
	@Resource
	private ProductTypeService productTypeService;
	@Resource
	private StaticService staticService;
	
	@RequestMapping(value = { "/build" }, method = { RequestMethod.GET })
	public String build(ModelMap model) {
		model.addAttribute("defaultBeginDate",
				DateUtils.addDays(new Date(), -7));
		model.addAttribute("defaultEndDate", new Date());
		model.addAttribute("productTypeTree",
				this.productTypeService.findTree());

		return "/admin/content/static/static";
	}
	
	@RequestMapping(value = { "/build" }, method = { RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> build(String productTypeId,Integer buildType, Date beginDate,
			Date endDate, Integer first, Integer count, ModelMap model) {
		//开始时间
		long st = System.currentTimeMillis();

		Calendar calendar;
		if (beginDate != null) {
			calendar = DateUtils.toCalendar(beginDate);
			calendar.set(11, calendar.getActualMinimum(11));
			calendar.set(12, calendar.getActualMinimum(12));
			calendar.set(13, calendar.getActualMinimum(13));
			beginDate = calendar.getTime();
		}
		if (endDate != null) {
			calendar = DateUtils.toCalendar(endDate);
			calendar.set(11, calendar.getActualMaximum(11));
			calendar.set(12, calendar.getActualMaximum(12));
			calendar.set(13, calendar.getActualMaximum(13));
			endDate = calendar.getTime();
		}

		if ((first == null) || (first.intValue() < 0)) {
			first = Integer.valueOf(0);
		}

		if ((count == null) || (count.intValue() <= 0)) {
			count = Integer.valueOf(50);
		}

		int i = 0;
		boolean bool = true;
		//首页
		if (buildType.intValue() == 0) {
			this.staticService.buildIndex();
			i = 1;
		} else if (buildType.intValue() == 1) {
			this.staticService.buildAboutus();
			i = 1;
		} else if (buildType.intValue() == 2) {
			this.staticService.buildContactus();
			i = 1;
		} else if (buildType.intValue() == 3) { //产品
			//根据传入生产条件生产产品静态页面
			//下一步可以使用多线程线程池实现
			ProductType productType = this.productTypeService.find(productTypeId);
			List<Product> products = this.productService.findList(productType, beginDate, endDate, first, count);
			if (products != null && !products.isEmpty()) {
				for (Product product : products) {
					i += this.staticService.build(product);
				}
				first = Integer.valueOf(first.intValue() + count.intValue());
			}
		} else {
			this.staticService.buildAll();
			i = 3;
		}
		
		//结束时间
		long et = System.currentTimeMillis();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("first", first);
		map.put("buildCount", Integer.valueOf(i));
		map.put("buildTime", Long.valueOf(et - st));
		map.put("isCompleted", Boolean.valueOf(bool));
		
		return map;
	}
}
