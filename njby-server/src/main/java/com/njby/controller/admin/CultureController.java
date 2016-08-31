package com.njby.controller.admin;

import javax.annotation.Resource;
import javax.validation.Valid;

import com.njby.entity.Culture;
import com.njby.entity.Notice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njby.utils.JsonUtil;
import com.njby.entity.search.SearchAdmin;
import com.njby.entity.search.SearchCulture;
import com.njby.service.CultureService;
import com.njby.utils.Message;
import com.njby.utils.Pageable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @pez1420 pez1420(pez1420@163.com)
 * @date 2015-10-05
 */
@Controller("adminCultureController")
@RequestMapping({ "/admin/culture" })
public class CultureController extends BaseAdminController {

	@Resource
	private CultureService cultureService;
	
	@RequestMapping(value = { "/list" }, method = { RequestMethod.GET })
	public String list(Pageable pageable, SearchCulture searchCulture,
			ModelMap model) {
		model.addAttribute("page", cultureService.findPage(pageable, searchCulture));
		model.addAttribute("search", searchCulture);
		return "/admin/firm/culture/culture_view";
	}

	@RequestMapping(value = { "/add" }, method = { RequestMethod.GET })
	public String add(ModelMap model) {
		return "/admin/firm/culture/culture_add";
	}

	@RequestMapping(value = { "/save" }, method = { RequestMethod.POST })
	public String save(Culture culture, RedirectAttributes redirectAttributes, ModelMap model) {
		this.cultureService.save(culture);
		addFlashAttribute(redirectAttributes, success);
		return "redirect:list.jhtml";
	}


	@RequestMapping(value = { "/edit" }, method = { RequestMethod.GET })
	public String edit(String id, ModelMap model) {
		model.addAttribute("culture", this.cultureService.find(id));
		return "/admin/firm/culture/culture_edit";
	}

	@RequestMapping(value = { "/update" }, method = { RequestMethod.POST })
	public String update(Culture culture, RedirectAttributes redirectAttributes, ModelMap model) {
		this.cultureService.update(culture);
		addFlashAttribute(redirectAttributes, success);
		return "redirect:list.jhtml";
	}


	@RequestMapping(value={"/delete"}, method={RequestMethod.POST})
	@ResponseBody
	public Message delete(String[] ids) {
		if (ids.length >= this.cultureService.count())
			return Message.error("admin.common.deleteAllNotAllowed", new Object[0]);

		this.cultureService.remove(ids);
		return success;
	}


	@RequestMapping(value = { "/detail" }, method = { RequestMethod.POST })
	@ResponseBody
	public Message detail(String id) {
		String content = JsonUtil.toJson(this.cultureService.find(id));
		return Message.success(content);
	}



}