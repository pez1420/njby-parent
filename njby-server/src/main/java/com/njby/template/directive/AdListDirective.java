package com.njby.template.directive;


import com.njby.entity.Ad;
import com.njby.entity.AdPosition;
import com.njby.service.AdPositionService;
import com.njby.service.AdService;
import com.njby.utils.FreemarkerUtils;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Component
public class AdListDirective extends BaseDirective{
    private static  final  String PARAM_AD_POSITION = "ad_position_id";
    private static  final  String PARAM_AD_TYPE = "ad_type";

    @Resource
    private AdService adService;
    @Resource
    private AdPositionService adPositionService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        //数量
        Integer count = this.getCount(params);
        //广告位置
        Integer adType = (Integer) FreemarkerUtils.getParameter(PARAM_AD_TYPE, Integer.class, params);
        //广告位置ID
        String adPositionId = (String) FreemarkerUtils.getParameter(PARAM_AD_POSITION,String.class, params);
        //广告位置
        AdPosition adPosition = adPositionService.find(adPositionId);

        List<Ad> ads = this.adService.findList(count, adType, adPosition);

        this.render("ads", ads, env, body);
    }
}
