package com.njby.service.impl;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

import com.njby.entity.EquipmentImage;
import com.njby.service.EquipmentImageService;

@Service
public class EquipmentImageServiceImpl implements EquipmentImageService, ServletContextAware {

	private ServletContext servletContext;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		
	}

	@Override
	public void build(EquipmentImage equipmentImage) {
		// TODO Auto-generated method stub

	}
}
