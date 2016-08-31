<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>南京秦淮区碧源礼品文化经营部</title>
    <link href="${base}/uilib/bootstrap-3/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="${base}/uilib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type='text/css'>
    <link href="${base}/resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/uilib/fancyzoom/css/fancyzoom.css" rel="stylesheet" type="text/css" media="all"/>

    <style>
        .main_details {
            margin-bottom: 50px
            background: #ffffff;
        }
        .wrap{
            margin:0 auto;
            width:90%;
        }
        .main{
            padding: 2%;/*上右下左的值都一样  %规定基于父元素的宽度的百分比的内边距 */
        }
        .left_content{
            width: 72.3333%;
            float: left;
        }
        .left_sidebar{
            width: 22.3333%;
            float: left;
            margin-left: 4.33333%;
        }
        .span1_of_1{
            float: left;
            width: 52.3333%;
        }
        .span1_of_1_des{
            float: right;
            width: 44.3333%;
            margin-left: 3.333%;
        }

        .product-view {
        }
        .product-image img{
            width : 100%;
            height: 90%;
        }

        /*产品介绍tab*/
        .product_tab {
            position: relative;
            margin: 40px auto;
        }

        .product_tab li {
            width:30%;
            font-size: 1.5em;
        }

        .product_tab > ul li a:hover {
            background: #FCFCFC;
            color: #5EAFA5;
        }

        .product_img_many {
            margin-top:15px;
        }


        /* 商品属性 */
        .desc1 {
            display: block;
            float: right;
        }
        .desc1 h3{
            text-shadow: 0 1px 0 #ffffff;
            color:#555555;
            font-size:2em;
            margin-bottom: 10px;
        }
        .desc1 h5{
            margin-top: 2%;
            font-size: 1.6em;
            color: #5EAFA5;
            line-height: 1.5em;
            text-shadow: 0 1px 0 #ffffff;
        }
        .desc1 h5 a{
            margin-left:5px;
            color:#555555;
            text-transform:capitalize;
            font-size: 14px;
        }
        .desc1 h5 a:hover{
            color: #5EAFA5;
        }
        .desc1 p{
            font-size: 1.0em;
            color: #555555;
            line-height: 1.8em;
        }

        .available {
            margin-top: 10px;
            padding: 15px 0;
            border-top: 1px solid #EEEEEE;
            border-bottom: 1px solid #EEEEEE;
        }
        .available h4{
            font-size: 1.1em;
            color: #777;
            margin-bottom: 20px;
            text-transform: uppercase;
            text-shadow: 0 1px 0 #ffffff;
        }
        .available li {
            display: inline;
            font-size: 0.8125em;
            padding: 1.5% 2%;
            color: #555555;
        }

        .available span a{
            padding-top: 35px;
            display: block;
            color: #555555;
            font-size: 1em;
            text-transform: uppercase;
            text-decoration: underline;
            margin-right: 10px;
        }
        .available span a:hover{
            text-decoration: none;
        }

        /* 热销商品 */
        .sellers{
            border: 1px solid rgb(235, 235, 235);
        }
        .sellers h4{
            font-size: 2em;
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
            font-size: 1.0em;  /*字体大小*/
            color: #555555;
            padding: 15px 20px;
            display: block;
        }
        .single-nav li a:hover {
            background: #FCFCFC;
            color: #5EAFA5;
        }

        .empty-pos {
            margin-top: 20px;
        }
        .clear{
            clear:both;/*在左右两侧均不允许浮动元素。*/
        }

    </style>
</head>
<body>

<!-- 网页头部 -->
[#include "/forward/include/header.ftl"]

<div class="main_details">
    <div class="container-fluid">
        <div class="wrap">
            <div class="main">
                <div class="left_content">
                    <div class="span1_of_1">
                        <div class="product-view">
                            <div class="product-image">
                                <img src="${base}/resources/images/bnr1.jpg" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="span1_of_1_des">
                        <div class="desc1">
                            <h3>${product.name} </h3>
                            <p>${abbreviate(product.introduction, 20, "...")}</p>
                            [#--<h5>${product.price} --][#--<a href="#">click for offer</a>--][#--</h5>--]
[#--                            <div class="available">
                                <h4>商品参数 :</h4>
                                <ul>
                                    <li>编号:${product.sn}</li>
                                    <li>颜色:红色</li>
                                    <li>尺寸:20</li>
                                    <li>数量:20</li>

                                </ul>
                                <div class="clear"></div>
                            </div>--]

                        </div>
                    </div>

                    <div class="clear">
                    </div>
                    <div class="product_tab">
                        <ul class="nav nav-tabs" id="product_tab">
                            <li class="active"><a href="#product_tab_1">商品简介</a></li>
                            <li><a href="#product_tab_2">商品展示</a></li>
                            <li><a href="#product_tab_3">客户案例</a></li>
                        </ul>
                        <div class="tab-content">

                            <div class="tab-pane active" id="product_tab_1">
                                <br/>
                                <p>${product.introduction}</p>
                            </div>
                            <div class="tab-pane" id="product_tab_2">
                                <div class="product_img_many">
                                    [@product_image_list productId=product.id]
                                        [#list productImages as productImage]
                                            <a href="${base}${productImage.source}">
                                                <img src="${base}${productImage.realThumbnail}" width="161" height="123" border="0" alt=""
                                                     id="img-mwsf-14" class="photo">
                                            </a>
                                        [/#list]
                                    [/@product_image_list]
                                </div>
                            </div>

                            <div class="tab-pane" id="product_tab_3">...</div>
                        </div>
                    </div>
                </div>
                <div class="left_sidebar">
                    <div class="sellers">
                        <h4>热销商品</h4>
                        <div class="single-nav">
                            <ul>
                                <li><a href="#">胶版纸</a></li>
                                <li><a href="#">铜版纸</a></li>
                                <li><a href="#">可变信息纸</a></li>
                                <li><a href="#">镭射纸</a></li>
                                <li><a href="#">荧光纸</a></li>
                                <li><a href="#">铝箔纸</a></li>
                                <li><a href="#">镀金纸</a></li>
                                <li><a href="#">易碎（防伪）纸</a></li>
                                <li><a href="#">镀银纸</a></li>
                                <li><a href="#">夹心铜版纸</a></li>
                                <li><a href="#">珠光纸</a></li>

                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="empty-pos">

</div>

<!-- Footer -->
[#include "/forward/include/footer.ftl"]


<script src="${base}/resources/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="${base}/resources/less-1.7.5.min.js"></script>
<script type="text/javascript" src="${base}/uilib/bootstrap-3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/uilib/fancyzoom/js/jquery.fancyzoom.min.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#product_tab > li > a').click(function (e) {
            e.preventDefault();//阻止a链接的跳转行为
            $(this).tab('show');
        });

        $(".product_img_many > a").fancyZoom();
    });

</script>

</body>
</html>