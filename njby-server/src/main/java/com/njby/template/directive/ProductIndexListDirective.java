package com.njby.template.directive;

import com.njby.entity.Product;
import com.njby.service.ProductService;
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
public class ProductIndexListDirective extends  BaseDirective {
    @Resource
    private ProductService productService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        //返回一定数量的产品
        Integer count = this.getCount(params);
        List<Product> products = this.productService.findList(count);
        if (products == null) {
            products = new ArrayList<Product>();
        }
        this.render("products", products, env, body);
    }
}
