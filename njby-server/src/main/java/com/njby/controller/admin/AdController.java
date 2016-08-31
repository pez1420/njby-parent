package com.njby.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import com.njby.service.FileService;
import com.system.FileInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.njby.entity.Ad;
import com.njby.entity.AdPosition;
import com.njby.entity.search.SearchAd;
import com.njby.service.AdPositionService;
import com.njby.service.AdService;
import com.njby.utils.Message;
import com.njby.utils.Page;
import com.njby.utils.Pageable;

@Controller("adminAdController")
@RequestMapping({ "/admin/ad" })
public class AdController extends BaseAdminController {
	@Resource
	private AdService adService;

	@Resource
	private AdPositionService adPositionService;

	@Resource
	private FileService fileService;

	@RequestMapping(value = { "/add" }, method = { RequestMethod.GET })
	public String add(ModelMap model) {
		return "/admin/content/ad/ad_add";
	}

	@RequestMapping(value = { "/save" }, method = { RequestMethod.POST })
	public String save(String adPositionId, Ad ad, RedirectAttributes redirectAttributes) {
		// 时间检查
		if (ad.getBeginDate() != null && ad.getEndDate() != null
				&& ad.getBeginDate().after(ad.getEndDate())) {
			return "/admin/common/error_404";
		}
		//文本
		if (ad.getAdType() != null
				&& ad.getAdType().intValue() == Ad.AdType.text.ordinal()) {
			ad.setPath(null);
		} else if (ad.getAdType().intValue() == Ad.AdType.image.ordinal()) { //图片
			MultipartFile imagePath = ad.getImagePath();
			//验证图片有效性
			if (imagePath == null || imagePath.isEmpty() || !(this.fileService.isValid(FileInfo.FileType.image, imagePath))) {
				addFlashAttribute(redirectAttributes, Message.error("admin.upload.invalid", new Object[0]));
				return "redirect:add.jhtml";
			}
			//上传图片
			String fileName = this.fileService.upload( FileInfo.FileType.image, imagePath);
			if (StringUtils.isEmpty(fileName)) {
				addFlashAttribute(redirectAttributes, Message.error("admin.upload.invalid", new Object[0]));
				return "redirect:add.jhtml";
			}
			ad.setPath(fileName);
			ad.setContent(null);
		} else {
			ad.setContent(null);
		}

		ad.setAdPosition(this.adPositionService.find(adPositionId));
		this.adService.save(ad);

		addFlashAttribute(redirectAttributes, success);
		return "redirect:list.jhtml";
	}

	@RequestMapping(value = { "/list" }, method = { RequestMethod.GET })
	public String list(Pageable pageable, SearchAd searchAd, ModelMap model) {
		Page<Ad> page = this.adService.findPage(pageable, searchAd);
		model.addAttribute("page", page);
		return "/admin/content/ad/ad_view";
	}

	@RequestMapping(value = { "/edit" }, method = { RequestMethod.GET })
	public String edit(String id, ModelMap model) {
		model.addAttribute("ad", this.adService.findWithAdPostion(id));
		return "/admin/content/ad/ad_edit";
	}

	@RequestMapping(value = { "/update" }, method = { RequestMethod.POST })
	public String update(String adPositionId, Ad ad, RedirectAttributes redirectAttributes) {
		// 时间检查
		if (ad.getBeginDate() != null && ad.getEndDate() != null
				&& ad.getBeginDate().after(ad.getEndDate())) {
			return "/admin/common/error_404";
		}

		if (ad.getAdType() != null
				&& ad.getAdType().intValue() == Ad.AdType.text.ordinal()) {
			ad.setPath(null);
		} else if (ad.getAdType().intValue() == Ad.AdType.image.ordinal()) { //图片
			MultipartFile imagePath = ad.getImagePath();
			//如果上传了图片,则重置图片路径
			if (imagePath != null && !imagePath.isEmpty() && this.fileService.isValid(FileInfo.FileType.image, imagePath)) {
				//上传图片
				String fileName = this.fileService.upload(FileInfo.FileType.image, imagePath);
				if (StringUtils.isEmpty(fileName)) {
					addFlashAttribute(redirectAttributes, Message.error("admin.upload.invalid", new Object[0]));
					return "redirect:edit.jhtml";
				}
				ad.setPath(fileName);
			}
			ad.setContent(null);
		} else {
			ad.setContent(null);
		}

		ad.setAdPosition(this.adPositionService.find(adPositionId));
		this.adService.update(ad);

		addFlashAttribute(redirectAttributes, success);
		return "redirect:list.jhtml";
	}

	@RequestMapping(value = { "/delete" }, method = { RequestMethod.POST })
	@ResponseBody
	public Message delete(String[] ids) {
		if (ids.length >= this.adService.count())
			return Message.error("admin.common.deleteAllNotAllowed",
					new Object[0]);

		this.adService.remove(ids);
		return success;
	}

	@RequestMapping(value = { "/ad_positions" }, method = { RequestMethod.POST })
	@ResponseBody
	public Message getAdPositions() {
		return Message.success(this.adPositionService.findAdPositionsJson());
	}

}
