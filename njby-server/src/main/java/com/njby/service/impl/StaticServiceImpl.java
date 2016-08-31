package com.njby.service.impl;


import com.njby.dao.ProductDao;
import com.njby.entity.Product;
import com.njby.service.StaticService;
import com.njby.service.TemplateService;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;

@Service
public class StaticServiceImpl implements StaticService, ServletContextAware{
	
	@Resource
	private FreeMarkerConfigurer freeMarkerConfigurer;
	@Resource
	private TemplateService templateService;
	@Resource
	private ProductDao productDao;	
	
	private ServletContext servletContext;
	
	
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;	
	}

	@Transactional(readOnly = true)
	public int build(String templatePath, String staticPath,
			Map<String, Object> model) {
		
		Assert.hasText(templatePath);
		Assert.hasText(staticPath);
		
		FileOutputStream fileOutputStream = null;
		OutputStreamWriter outputStreamWriter = null;
		BufferedWriter bufferedWriter = null;
		
		try {
			freemarker.template.Template template = this.freeMarkerConfigurer
					.getConfiguration().getTemplate(templatePath);
			File file = new File(this.servletContext.getRealPath(staticPath));
			File parentFile = file.getParentFile();
			if (!parentFile.exists()) {
				parentFile.mkdirs();
			}
			fileOutputStream = new FileOutputStream(file);
			outputStreamWriter = new OutputStreamWriter(
					fileOutputStream, "UTF-8");
			bufferedWriter = new BufferedWriter(outputStreamWriter);
			template.process(model, bufferedWriter);
			bufferedWriter.flush();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(bufferedWriter);
			IOUtils.closeQuietly(outputStreamWriter);
			IOUtils.closeQuietly(fileOutputStream);
		}
		return 0;
	}

	@Transactional(readOnly = true)
	public int build(String templatePath, String staticPath) {
		return build(templatePath, staticPath, null);
	}

	@Transactional(readOnly = true)
	public int buildIndex() {
		com.system.Template template = this.templateService.get("index");
		return build(template.getTemplatePath(),
				template.getStaticPath());
	}

	@Transactional(readOnly = true)
	public int buildAboutus() {
		com.system.Template template = this.templateService.get("aboutus");
		return build(template.getTemplatePath(),
				template.getStaticPath());
	}


	@Transactional(readOnly = true)
	public int buildContactus() {
		com.system.Template template = this.templateService.get("contactus");
		return build(template.getTemplatePath(),
				template.getStaticPath());
	}

	@Transactional(readOnly = true)
	public int build(Product product) {
		Assert.notNull(product);
		//System.out.println(product.getStaticPath());
		delete(product.getStaticPath());
		int i = 0;
		com.system.Template template = this.templateService.get("productDetail");
		if (product.getIsMarketable().booleanValue()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("product",product);
			i += build(template.getTemplatePath(), product.getStaticPath(), map);
		}
		return i;
	}

	@Override
	public int buildSitemap() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int buildOther() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Transactional(readOnly = true)
	public int buildAll() {
		int i = 0;
		this.buildIndex();
		this.buildContactus();
		this.buildAboutus();
		return i;
	}

	@Transactional(readOnly = true)
	public int delete(String staticPath) {
		Assert.hasText(staticPath);
		File file = new File(this.servletContext.getRealPath(staticPath));
		if (file.exists()) {
			file.delete();
			return 1;
		}
		return 0;
	}

	@Override
	public int deleteIndex() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOther() {
		// TODO Auto-generated method stub
		return 0;
	}



}
