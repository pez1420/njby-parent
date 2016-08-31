package com.njby.controller.admin;

import com.njby.entity.Equipment;
import com.njby.entity.EquipmentImage;
import com.njby.entity.search.SearchEquipment;
import com.njby.service.EquipmentService;
import com.njby.service.FileService;
import com.njby.utils.JsonUtil;
import com.njby.utils.Message;
import com.njby.utils.Pageable;
import com.system.FileInfo;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @pez1420 pez1420(pez1420@163.com)
 * @date 2015-10-11
 */

@Controller("adminEquipmentController")
@RequestMapping({"/admin/equipment"})
public class EquipmentController extends BaseAdminController {

    @Resource
    private EquipmentService equipmentService;
    @Resource
    private FileService fileService;

    @RequestMapping(value = {"/list"}, method = {RequestMethod.GET})
    public String list(Pageable pageable, SearchEquipment searchEquipment,
                       ModelMap model) {
        model.addAttribute("page", equipmentService.findPage(pageable, searchEquipment));
        model.addAttribute("search", searchEquipment);
        return "/admin/equipment/equipment/equipment_view";
    }

    @RequestMapping(value = {"/add"}, method = {RequestMethod.GET})
    public String add(ModelMap model) {
        return "/admin/equipment/equipment/equipment_add";
    }


    @RequestMapping(value = {"/save"}, method = {RequestMethod.POST})
    public String save(Equipment equipment, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        MultipartFile[] files = equipment.getFiles();
        if (ArrayUtils.isNotEmpty(files)) {
            //验证文件有效性
            for (MultipartFile file : files) {
                if (file == null || file.isEmpty() || !(this.fileService.isValid(FileInfo.FileType.image, file))) {
                    addFlashAttribute(redirectAttributes, Message.error("admin.upload.invalid", new Object[0]));
                    return "redirect:add.jhtml";
                }
            }
            List<EquipmentImage> equipmentImages = equipment.getEquipmentImages();
            //确保所有上传文件都能上传成功
            for (MultipartFile file : files) {
                String fileName = this.fileService.upload(FileInfo.FileType.image, file);
                if (StringUtils.isNotEmpty(fileName)) {
                    EquipmentImage equipmentImage = new EquipmentImage();
                    equipmentImage.setSource(fileName);
                    equipmentImage.setFile(file);
                    equipmentImage.setEquipment(equipment);
                    equipmentImages.add(equipmentImage);
                } else {
                    addFlashAttribute(redirectAttributes, Message.error("admin.upload.invalid", new Object[0]));
                    return "redirect:add.jhtml";
                }
            }

            //生成经过压缩的图片
            if (equipmentImages != null && !equipmentImages.isEmpty()) {
                for (EquipmentImage equipmentImage : equipmentImages) {
                    //不生成缩略图
                }
            }
        }

        this.equipmentService.save(equipment);

        addFlashAttribute(redirectAttributes, success);
        return "redirect:list.jhtml";
    }


    @RequestMapping(value={"/delete"}, method={RequestMethod.POST})
    @ResponseBody
    public Message delete(String[] ids) {
        if (ids.length >= this.equipmentService.count())
            return Message.error("admin.common.deleteAllNotAllowed", new Object[0]);

        this.equipmentService.remove(ids);
        return success;
    }


    @RequestMapping(value = {"/edit"}, method = {RequestMethod.GET})
    public String edit(String id, ModelMap modelMap) {
        Equipment equipment = this.equipmentService.find(id);
        modelMap.addAttribute("equipment", equipment);
        modelMap.addAttribute("equipmentImages", this.equipmentService.findAllEquipmentImage(equipment));
        return "/admin/equipment/equipment/equipment_edit";
    }

    @RequestMapping(value = {"/update"}, method = {RequestMethod.POST})
    public  String update(Equipment equipment, RedirectAttributes redirectAttributes) {
        MultipartFile[] files = equipment.getFiles();
        //文件列表不能为空且文件不能是上传插件的图片文件(默认名字为空)
        if ( ArrayUtils.isNotEmpty(files) && StringUtils.isNotEmpty(
                ((DiskFileItem)((CommonsMultipartFile)files[0]).getFileItem()).getName())) {
            //验证文件有效性
            for (MultipartFile file : files) {
                if (file == null || file.isEmpty() || !(this.fileService.isValid(FileInfo.FileType.image, file))) {
                    addFlashAttribute(redirectAttributes, Message.error("admin.upload.invalid", new Object[0]));
                    return "redirect:edit.jhtml";
                }
            }
            List<EquipmentImage> equipmentImages = equipment.getEquipmentImages();
            //确保所有上传文件都能上传成功
            for (MultipartFile file: files) {
                String fileName = this.fileService.upload(FileInfo.FileType.image, file);
                if (StringUtils.isNotEmpty(fileName)) {
                    EquipmentImage equipmentImage = new EquipmentImage();
                    equipmentImage.setSource(fileName);
                    equipmentImage.setFile(file);
                    equipmentImage.setEquipment(equipment);
                    equipmentImages.add(equipmentImage);

                } else {
                    addFlashAttribute(redirectAttributes, Message.error("admin.upload.invalid", new Object[0]));
                    return "redirect:add.jhtml";
                }
            }

//            if (equipmentImages != null && !equipmentImages.isEmpty()) {
//                for (EquipmentImage ei : equipmentImages) {
//                    //
//                }
//            }
        }

        this.equipmentService.update(equipment);

        addFlashAttribute(redirectAttributes, success);
        return "redirect:list.jhtml";
    }

    @RequestMapping(value = {"/detail"}, method = {RequestMethod.POST})
    @ResponseBody
    public Message detail(String id) {
        Equipment equipment = equipmentService.find(id);
        String content = JsonUtil.toJson(equipment);
        return Message.success(content);
    }
}