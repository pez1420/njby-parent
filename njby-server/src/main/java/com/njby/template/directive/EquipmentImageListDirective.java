package com.njby.template.directive;

import com.njby.entity.Equipment;
import com.njby.entity.EquipmentImage;
import com.njby.service.EquipmentService;
import com.njby.utils.FreemarkerUtils;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/4/20.
 */
@Component
public class EquipmentImageListDirective extends  BaseDirective {

    @Resource
    private EquipmentService equipmentService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        String equipmentId = FreemarkerUtils.getParameter("equipmentId", String.class,
                params);
        Equipment equipment = this.equipmentService.find(equipmentId);
        List<EquipmentImage> equipmentImages;// = this.equipmentService.findAllEquipmentImage(equipment);
        if (equipment == null) {
            equipmentImages = new ArrayList<EquipmentImage>();
        } else {
            equipmentImages = this.equipmentService.findAllEquipmentImage(equipment);
        }

        render("equipmentImages", equipmentImages, env, body);
    }
}
