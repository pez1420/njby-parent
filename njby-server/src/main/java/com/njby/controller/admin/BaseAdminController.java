package com.njby.controller.admin;

import java.util.Date;
import java.util.Set;

import javax.annotation.Resource;
import javax.validation.Validator;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njby.template.directive.FlashMessageDirective;
import com.njby.utils.Message;
import com.njby.utils.SpringUtils;
import com.system.DateEditor;

public class BaseAdminController {
	protected static final Message error = Message.error("admin.message.error",
			new Object[0]);
	protected static final Message success = Message.success(
			"admin.message.success", new Object[0]);

	//@Resource(name = "validator")
	//private Validator validator;

	// http://baggioback.iteye.com/blog/1753469
	@InitBinder
	protected void dataBinder(WebDataBinder webDataBinder) {
		// 一个用于修剪(trim)String类型的属性编辑器，具有将一个空字符串转化为null值的选项。
		// 默认没有注册,必须由用户在需要的时候自行注册
		webDataBinder.registerCustomEditor(String.class,
				new StringTrimmerEditor(true));
		webDataBinder.registerCustomEditor(Date.class, new DateEditor(true));
	}

/*	protected boolean validate(Object object, Class<?>[] clazzes) {
		Set set = this.validator.validate(object, clazzes);
		if (set.isEmpty())
			return true;
		RequestAttributes requestAttributes = RequestContextHolder
				.currentRequestAttributes();
		requestAttributes
				.setAttribute("constraintViolations", set, 0);
		return false;
	}

	protected boolean validate(Class<?> clazz, String paramString,
			Object paramObject, Class<?>[] clazzes) {
		Set localSet = this.validator.validateValue(clazz, paramString,
				paramObject, clazzes);
		if (localSet.isEmpty())
			return true;
		RequestAttributes localRequestAttributes = RequestContextHolder
				.currentRequestAttributes();
		localRequestAttributes
				.setAttribute("constraintViolations", localSet, 0);
		return false;
	}*/

	protected String getMessage(String code, Object... args) {
		return SpringUtils.getMessage(code, args);
	}

	// 方法中给他添加属性，添加的属性可以在跳转后的页面获取到
	protected void addFlashAttribute(RedirectAttributes redirectAttributes,
			Message message) {
		if ((redirectAttributes != null) && (message != null)) {
			// 使用addFlashAttribute,参数不会出现在url地址栏中
			redirectAttributes
					.addFlashAttribute(
							FlashMessageDirective.FLASH_MESSAGE_ATTRIBUTE_NAME,
							message);
		}
	}
}
