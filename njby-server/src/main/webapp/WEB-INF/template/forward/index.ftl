<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>南京秦淮区碧源礼品文化经营部</title>
    <link href="${base}/uilib/bootstrap-3/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="${base}/uilib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${base}/resources/css/googleapifont.css" rel="styleshee" type="text/css">
    <link href="${base}/uilib/fancybox/source/jquery.fancybox.css?v=2.1.5" rel="stylesheet" type="text/css" media="screen" />
    <link href="${base}/uilib/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" rel="stylesheet" type="text/css" />
    <link href="${base}/resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/resources/css/online.css" rel="stylesheet" type="text/css" />
    <script src="${base}/resources/jquery-2.1.0.min.js"></script>

    <style>
        .lunbocontent {
            width: 400px;
            height: 52px;
            overflow: hidden;
        }
        .noticelist {
            width: 400px;
            margin: 0;
        }
        .noticelist > ul {
            margin: 0;
            padding: 0;
        }
        .noticelist > ul > li {
            list-style: none;
            height: 52px;
            line-height: 52px;
            font-size: 16px;
        }
        .noticelist > ul > li > a {
            text-decoration: none;
            color: #777;
        }
        .noticelist > ul > li > a:hover {
            color: #eee;              /*color是文本字体的颜色,background-color是背景的颜色*/
            border-bottom: 1px solid #822a2a;
            background-color: #dd4a49;
        }
    </style>

</head>
<body>
<!-- 网页头部 -->
[#include "/forward/include/header.ftl"]

<!-- 首页幻灯片 -->
<div class="header-banner">
    <script type="text/javascript" src="${base}/uilib/slitslider/js/jquery.slitslider.js"></script>
    <script type="text/javascript" src="${base}/resources/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true
            });
        });
    </script>

    <div class="container">
        <div class="slider">
            <div class="callbacks_container">
                <ul class="rslides" id="slider">
                    [@ad_list count=3 ad_type=1 ad_position_id="fb0580b01b4411e5944774e5432100f2"]
                        [#list ads as ad]
                            <li><img src="${base}${ad.path}" alt="${ad.title}">
                                <div class="caption">
                                    <h1>${ad.title}<span>.</span></h1>
                                    <p></p>
                                    <a href="#" class="btn">More Info</a></div>
                            </li>
                        [/#list]
                    [/@ad_list]
[#--                    <li><img src="${base}/resources/images/bnr1.jpg" alt="">
                        <div class="caption">
                            <h1>Professional Solutions<span>.</span></h1>
                            <p>Lorem ipsum dolor sit amet, mea id noster everti. In eos prima necessitatibus, ad duo
                                iudico facilis voluptatum.</p>
                            <a href="services.html" class="btn">More Info</a></div>
                    </li>
 --]
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- 欢迎部分-->
<div class="section_header">
    <div class="container">
        <div class="row" >
            <div class="col-md-6">

                        <div id="noticecontent" class="lunbocontent">
                            <div id="noticetop" class="noticelist">
                                <ul>
                                
                                	[@notice_list count=5]
						            	[#list notices as notice]
											<li><i class="fa fa-volume-up"></i> <a href="#" target="_blank"> ${notice.title}</a> </li>
						            	[/#list]
					            	[/@notice_list]

                                </ul>
                            </div>
                            <div id="noticebottom" class="noticelist"></div>
                        </div>


            </div>
            <div class="col-md-6">
                <div style="margin-top: 20px">
                    <h3>  <i class="fa fa-phone-square "></i> 025-85290290/13868265920 </h3>
                </div>
            </div>
         </div>
    </div>
</div>
<div id="welcome">
    <div class="container">
        <div class="col-md-6">
        [@ad_list count=1 ad_type=1 ad_position_id="1c523803eb6511e5962a74e5432100f2"]
            [#list ads as ad]
                <img class="img-responsive" src="${base}${ad.path}" alt="${ad.title}">
            [/#list]
        [/@ad_list]


        </div>
        <div class="col-md-6">
            [@ad_list count=1 ad_type=0 ad_position_id="fb1280b01b4411e5944774e5432100f2"]
                [#list ads as ad]
                    <h3>${ad.title}</h3>
                    <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ad.content}</p>

                    <a href="${ad.url}" class="btn">More</a></div>
                [/#list]
            [/@ad_list]

        </div>
    </div>
</div>


<!-- 产品与服务 -->
<div class="section_header">
    <h2><span>产品中心</span>|Services</h2>
</div>
<div id="main-services">
    <div class="container">
        <div class="row">
            [@product_index_list count=4]
                [#list products as product]
                    <div class="col-md-3 centered">
                        [@product_image_list productId=product.id]
                            [#list productImages as productImage]
                                [#if productImage_index == 0]
                                    <div class="box">
                                        <a class="fancybox-buttons" data-fancybox-group="button" href="${base}${productImage.source}">
                                            <img src="${base}${productImage.realThumbnail}" alt="" class="img-rounded img-thumbnail"/>
                                        </a>
                                        <h3>${productImage.name}</h3>
                                        <p>${abbreviate(product.introduction, 30, "...")}</p>
                                        <a href="${base}${product.staticPath}" class="btn">More</a>
                                    </div>
                                [/#if]
                            [/#list]
                        [/@product_image_list]
                    </div>
                [/#list]
            [/@product_index_list]

        </div>
    </div>
</div>

<!-- 我们的客户 -->
<div class="section_header">
    <h2><span>我们的客户</span>|Our Clients</h2>
</div>
<div id="clients">
    [#include "/forward/common/customer.ftl"]
</div>


<!-- Footer -->
[#include "/forward/include/footer.ftl"]

<!-- 右侧悬浮窗-->
<div id="onService_panel">
    <div class="onService_panel_s">
        <div class="online_boxs">
            <div class="boxs_t"><span class="boxs_t_l"></span><span class="boxs_t_m"></span><span class="boxs_t_r"></span></div>
            <div class="boxs_m_l">
                <div class="boxs_m_r">
                    <div class="box_m_m">
                        <div id="onlineList">
                            <em class="online_close" id="onlineClose" title="关闭"></em>
                            <div class="online_open" id="onlineOpen"></div>

                            <div id="online_tel_icon" class="online_icon">
                                <span class="pic"><img src="${base}/resources/images/online/online_tel.png" /></span>
                                <span class="name">电话直呼</span>
                            </div>

                            <div id="online_qq_icon" class="online_icon">
                                <span class="pic"><img src="${base}/resources/images/online/online_qq.png" /></span>
                                <span class="name">在线客服</span>
                            </div>


                            <div id="online_email_icon" class="online_icon">
                                <span class="pic"><a href="mailto:1234567@qq.com"><img src="${base}/resources/images/online/online_email.png" /></a></span>
                                <span class="name">发送邮件</span>
                            </div>

                            <div id="online_address_icon" class="online_icon">
                                <span class="pic"><a href="http://www.17sucai.com/"><img src="${base}/resources/images/online/online_address.png" /></a></span>
                                <span class="name">企业地标</span>
                            </div>

                            <div id="onlineTelTab" class="online_tab">
                                <div class="online_boxs">
                                    <div class="boxs_t"><span class="boxs_t_l"></span><span class="boxs_t_m"></span><span class="boxs_t_r"></span></div>
                                    <div class="boxs_m_l">
                                        <div class="boxs_m_r">
                                            <div class="box_m_m">
                                                <div id="onlineTel" class="online_tab_c">
                                                    <small class="sanjiao"></small>
                                                    <small class="tab_close"></small>
                                                    <dl>
                                                        <dt><strong>联系我们：</strong></dt>
                                                        <dd><strong>联系人：</strong><span>王宝强</span></dd>
                                                        <dd><strong>电话：</strong><span>13000130005</span></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--<div class="boxs_b"><span class="boxs_b_l"></span><span class="boxs_b_m"></span><span class="boxs_b_r"></span></div>-->
                                </div>
                            </div>

                            <div id="onlineQQTab" class="online_tab">
                                <div class="online_boxs">
                                    <div class="boxs_t"><span class="boxs_t_l"></span><span class="boxs_t_m"></span><span class="boxs_t_r"></span></div>
                                    <div class="boxs_m_l">
                                        <div class="boxs_m_r">
                                            <div class="box_m_m">
                                                <div id="onlineQQ" class="online_tab_c">
                                                    <small class="sanjiao"></small>
                                                    <small class="tab_close"></small>
                                                    <dl>
                                                        <dt>经理 </dt>
                                                        <dd> <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=57548991&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1234567:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> </dd>
                                                        <dt>销售 </dt>
                                                        <dd> <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1234567&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1234567:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--<div class="boxs_b"><span class="boxs_b_l"></span><span class="boxs_b_m"></span><span class="boxs_b_r"></span></div>-->
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="boxs_b"><span class="boxs_b_l"></span><span class="boxs_b_m"></span><span class="boxs_b_r"></span></div>
        </div>
    </div>
</div>



<script type="text/javascript" src="${base}/resources/less-1.7.5.min.js"></script>
<script type="text/javascript" src="${base}/uilib/bootstrap-3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/uilib/fancybox/source/jquery.fancybox.js"></script>
<script type="text/javascript" src="${base}/uilib/fancybox/source/helpers/jquery.fancybox-buttons.js"></script>
<!--<script src="${base}/resources/require/require.js"></script>-->

<script type="text/javascript">
    var interval = 2000;//两次滚动之间的时间间隔
    var stepsize = 52;//滚动一次的长度，必须是行高的倍数,这样滚动的时候才不会断行
    var objInterval = null;

    $(document).ready( function(){
        //用上部的内容填充下部
        $("#noticebottom").html($("#noticetop").html());

        //给显示的区域绑定鼠标事件
        $("#noticecontent").bind("mouseover",function(){StopScroll();});
        $("#noticecontent").bind("mouseout",function(){StartScroll();});

        //启动定时器
        StartScroll();
    });

    //启动定时器，开始滚动
    function StartScroll(){
        objInterval = setInterval("verticalloop()", interval);
    }

    //清除定时器，停止滚动
    function StopScroll(){
        window.clearInterval(objInterval);
    }

    //控制滚动
    function verticalloop(){
        //判断是否上部内容全部移出显示区域
        //如果是，从新开始;否则，继续向上移动
        if($("#noticecontent").scrollTop() >= $("#noticetop").outerHeight()){
            $("#noticecontent").scrollTop($("#noticecontent").scrollTop() - $("#noticetop").outerHeight());
        }
        //使用jquery创建滚动时的动画效果
        $("#noticecontent").animate(
                {"scrollTop" : $("#noticecontent").scrollTop() + stepsize  + "px"}, 600, function(){
                    //这里用于显示滚动区域的scrollTop，实际应用中请删除
                    //$("#foot").html("scrollTop:"+$("#noticecontent").scrollTop());
                });
    }
</script>



<script>
    $(function() {
        $('.fancybox-buttons').fancybox({
            openEffect  : 'none',
            closeEffect : 'none',
            prevEffect : 'none',
            nextEffect : 'none',
            closeBtn  : false,

            helpers : {
                title : {
                    type : 'inside'
                },
                buttons	: {}
            },

            afterLoad : function() {
                this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
            }
        });

    });
</script>

<script>

    $("#onlineOpen").mouseover(function () {
        var onService_panel = $("#onService_panel");
        onService_panel.animate({right: 0}, function () {
        });
        $(this).hide();
    });

    $("#onlineClose").click(function () {
        var onService_panel = $("#onService_panel");
        onService_panel.animate({right: -102});
        onService_panel.find(".online_tab").fadeOut(100);
        $("#onlineOpen").show();
    });

    $(".online_icon").click(function () {
        $(".online_tab").fadeOut(100);
        var onclickId = $(this).attr("id");
        var findparent_tab;
        switch (onclickId) {
            case "online_tel_icon":
                findparent_tab = $("#onlineTelTab");
                break;
            case "online_qq_icon":
                findparent_tab = $("#onlineQQTab");
                break;
            case "online_message_icon":
                findparent_tab = $("#onlineMessageTab");
                break;
        }
        findparent_tab.fadeIn(100);
    });

    $("#onService_panel .tab_close").click(function () {
        $(this).parents(".online_tab").hide();
    });

    /* 限制文字字数 */
    function checkLen(obj, maxs) {
        var maxChars = maxs;//最多字符数
        if (obj.value.length > maxChars) {
            obj.value = obj.value.substring(0, maxChars);
        }
        var curr = maxChars - obj.value.length;
        $(obj).parents("dl").find(".text_length b").text(curr.toString());
    }

</script>


</body>
</html>