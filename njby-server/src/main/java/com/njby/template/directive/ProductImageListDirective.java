package com.njby.template.directive;

import  com.njby.entity.Product;
import com.njby.entity.ProductImage;
import com.njby.service.ProductService;
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

@Component
public class ProductImageListDirective extends BaseDirective{
    @Resource
    private ProductService productService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        String productId = FreemarkerUtils.getParameter("productId", String.class,
                params);
        Product product = this.productService.find(productId);

        List<ProductImage> productImages;
        if (product == null) {
            productImages = new ArrayList<ProductImage>();
        } else {
            productImages = this.productService.findAllProductImage(product);
        }

        render("productImages", productImages, env, body);


    }
}
