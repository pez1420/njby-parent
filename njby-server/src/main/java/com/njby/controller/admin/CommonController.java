package com.njby.controller.admin;

import com.njby.service.CaptchaService;
import com.njby.utils.SettingUtils;
import com.system.Setting;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;


@Controller("adminCommonController")
@RequestMapping({ "/admin/common" })
public class CommonController implements ServletContextAware {
	@Value("${system.name}")
	private String systemName;

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;

	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@RequestMapping(value = { "/main" }, method = { RequestMethod.GET })
	public String main() {
		return "/admin/common/main";
	}

	@RequestMapping(value = { "/overview" }, method = { RequestMethod.GET })
	public String index(ModelMap model) {
		Setting setting = SettingUtils.get();
		//网站名称
		model.addAttribute("siteName", setting.getSiteName());
		//网站版本
		//model.addAttribute("siteVesion", setting.getSiteName());
		//操作系统类型
		model.addAttribute("osName", System.getProperty("os.name"));
		//系统架构
		model.addAttribute("osArch", System.getProperty("os.arch"));
		//java版本
		model.addAttribute("javaVesion", System.getProperty("java.version"));
		//javaHome值
		model.addAttribute("javaHome", System.getProperty("java.home"));

		return "/admin/common/index";
	}

	@RequestMapping(value = { "/captcha" }, method = { RequestMethod.GET })
	public void image(String captchaId, HttpServletRequest request,
			HttpServletResponse response) {
		if (StringUtils.isEmpty(captchaId)) {
			captchaId = request.getSession().getId();
		}

		String str1 = new StringBuffer().append("yB").append("-").append("der")
				.append("ewoP").reverse().toString();
		String str2 = new StringBuffer().append("ten").append(".")
				.append("maxe").append("ces").reverse().toString();
		response.addHeader(str1, str2);
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0L);
		response.setContentType("image/jpeg");

		ServletOutputStream servletOutputStream = null;
		try {
			servletOutputStream = response.getOutputStream();
			BufferedImage bufferedImage = this.captchaService
					.buildImage(captchaId);
			ImageIO.write(bufferedImage, "jpg", servletOutputStream);
			servletOutputStream.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(servletOutputStream);
		}
	}
}
