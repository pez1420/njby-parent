package com.njby.controller.admin;

import com.njby.service.CacheService;
import com.njby.utils.SettingUtils;
import com.system.Setting;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.annotation.Resource;

@Controller("adminSettingController")
@RequestMapping({ "/admin/setting" })
public class SettingController extends  BaseAdminController {

    private static final Logger logger = Logger.getLogger(SettingController.class);

    @Resource(name = "cacheServiceImpl")
    private CacheService cacheService;

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(ModelMap model) {
        model.addAttribute("setting", SettingUtils.get());
        return "/admin/system_set/setting/edit";
    }

    @RequestMapping(value={"/update"}, method={RequestMethod.POST})
    public String update(Setting setting, RedirectAttributes redirectAttributes){
        Setting orgSetting = SettingUtils.get();
        if (StringUtils.isNotEmpty(setting.getSiteName())) {
            orgSetting.setSiteName(setting.getSiteName());
        }
        if (StringUtils.isNotEmpty(setting.getSiteUrl())) {
            orgSetting.setSiteUrl(setting.getSiteUrl());
        }
        if (StringUtils.isNotEmpty(setting.getAddress())) {
            orgSetting.setAddress(setting.getAddress());
        }
        if (StringUtils.isNotEmpty(setting.getPhone())) {
            orgSetting.setPhone(setting.getPhone());
        }
        if (StringUtils.isNotEmpty(setting.getZipCode())) {
            orgSetting.setZipCode(setting.getZipCode());
        }
        if (StringUtils.isNotEmpty(setting.getEmail())) {
            orgSetting.setEmail(setting.getEmail());
        }

        //更新系统设置内容
        SettingUtils.set(orgSetting);
        //清楚缓存
        cacheService.clear();
        addFlashAttribute(redirectAttributes, success);
        return "redirect:edit.jhtml";
    }
}
