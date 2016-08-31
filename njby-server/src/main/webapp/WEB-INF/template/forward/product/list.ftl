<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>南京秦淮区碧源礼品文化经营部</title>
    <link href="${base}/uilib/bootstrap-3/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="${base}/uilib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${base}/resources/css/googleapifont.css" rel="styleshee" type="text/css">
    <link href="${base}/uilib/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" rel="stylesheet"
          type="text/css"/>
    <link href="${base}/uilib/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" rel="stylesheet"
          type="text/css"/>
    <link href="${base}/resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <style>
        .left_sidebar {
            width: 100%;
            margin-bottom: 20px;
        }

        .top-type {
            border: 1px solid rgb(235, 235, 235);
        }

        .top-type h4 {
            font-size: 1.5em;
            color: #ffffff;
            line-height: 1.5em;
            text-shadow: 0 1px 0 #1C6159;
            padding: 10px 20px;
            background: #5EAFA5;
        }

        .single-nav li {
            list-style-type: none;
            border-bottom: 1px dotted #E8E8E8;
        }

        .single-nav li a {
            text-decoration: none; /*去掉下划线*/
            text-transform: capitalize; /*首字母大写*/
            font-size: 1.0em; /*字体大小*/
            color: #555555;
            padding: 10px 15px;
            display: block;
        }

        .single-nav li a:hover {
            background: #FCFCFC;
            color: #5EAFA5;
        }

    </style>
</head>
<body>

<!-- 网页头部 -->
[#include "/forward/include/header.ftl"]


<div class="section_header">
    <div class="container">
        <h2><span>产品中心</span>|Services</h2>
    </div>
</div>
<div id="services">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="left_sidebar">
                    [@product_type_root_list]
                        [#list productTypes as productType]
                            <div class="top-type">
                                <h4>${productType.name}</h4>

                                <div class="single-nav">
                                    <ul>
                                        [@product_type_children_list productTypeId = productType.id count = 10]
                                            [#list productTypes as productType]
                                                <li><a href="${base}${productType.path}">${productType.name}</a></li>
                                            [/#list]
                                        [/@product_type_children_list]
                                    </ul>
                                </div>
                            </div>
                        [/#list]
                    [/@product_type_root_list]
                </div>

  [#--          [@product_type_root_list]
                [#list productTypes as productType]
                    <div class="panel-group" id="service-panel">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <a data-toggle="collapse" data-parent="service-panel"
                                       href="#item${productType_index}">
                                        <i class="fa fa-sun-o"></i>&nbsp;${productType.name}
                                    </a>
                                </div>
                            </div>
                            <div id="item${productType_index}" class="panel-collapse collapse in">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <a href="${base}${productType.path}">${productType.name}</a>
                                    </li>
                                    [@product_type_children_list productTypeId = productType.id count = 10]
                                        [#list productTypes as productType]
                                            <li class="list-group-item">
                                                <a href="${base}${productType.path}">
                                                    &nbsp;&nbsp;${productType.name}
                                                </a>
                                            </li>
                                        [/#list]
                                    [/@product_type_children_list]
                                </ul>
                            </div>
                        </div>
                    </div>
                [/#list]
            [/@product_type_root_list]--]
            </div>

            <div class="col-md-9">
            [#if page.content?has_content]
                [#list page.content?chunk(4) as row]
                    <div class="row">
                        [#list row as product]
                            <div class="col-lg-3 service">
                                <h3>${product.name}</h3>

                                <p>${abbreviate(product.introduction, 30, "...")}</p>
                                [@product_image_list productId=product.id]
                                    [#list productImages as productImage]
                                        [#if productImage_index == 0]
                                            <a href="${base}${product.staticPath}">
                                                <img src="${base}${productImage.source}" class="img-responsive" alt=" ">
                                            </a>
                                        [/#if]
                                    [/#list]
                                [/@product_image_list]
                            </div>
                        [/#list]
                    </div>
                [/#list]
            [/#if]

                <form id="listForm" action="${base}${(productType.path)!"/product/list.jhtml"}" method="get">
                    <input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}"/>

                    <div class="row">
                        <!-- 分页信息 -->
                    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
                        [#include "/forward/include/pagination.ftl"]
                    [/@pagination]
                        <!-- 分页信息 -->
                    </div>
                </form>


            </div>
        </div>
    </div>
</div>


<!-- Footer -->
[#include "/forward/include/footer.ftl"]


<script src="${base}/resources/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="${base}/resources/less-1.7.5.min.js"></script>
<script type="text/javascript" src="${base}/uilib/bootstrap-3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/list.js"></script>

</body>
</html>