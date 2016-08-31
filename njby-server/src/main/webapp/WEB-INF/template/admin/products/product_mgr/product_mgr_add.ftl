<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>产品管理</title>

    <link href="${base}/resources/css/admin/style.css" rel="stylesheet">
    <link href="${base}/resources/css/admin/style-responsive.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/scojs.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/sco.message.css" rel="stylesheet">
    <link href="${base}/uilib/fileinput/css/fileinput.min.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/uilib/jquery-ui-1.11.4/jquery-ui.theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/uilib/jquery-ui-1.11.4/jquery-ui.min.js" rel="stylesheet" type="text/css"/>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${base}/resource/html5shiv.js"></script>
    <script src="${base}/resource/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="frame-content">
    <!--.container-fluid 类用于 100% 宽度，占据全部视口（viewport）的容器-->
    <div class="container-fluid">
        <!-- 页面导航栏 -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><a href="../../../common/overview.jhtml"><i class="fa fa-home"></i> 首页</a></li>
                    <li><a href="#">添加产品</a></li>
                </ul>
            </div>
        </div>


        <!-- 主题表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading ">
                            	产品基本信息
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" id="inputForm" action="save.jhtml" method="post"  role="form"
                              enctype="multipart/form-data">

                            <div id="tabs">
                                <ul>
                                    <li><a href="#fragment-1"><span>产品信息</span></a></li>
                                    <li><a href="#fragment-2"><span>SEO优化</span></a></li>
                                    <li><a href="#fragment-3"><span>产品图片</span></a></li>
                                </ul>
                                <div id="fragment-1">
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">产品分类</label>

                                        <div class="col-md-8 col-sm-8">
                                            <select class="form-control" name="productTypeId">
                                            [#list productTypeTree as productType]
                                                <option value="${productType.id}">
                                                    [#if productType.grade != 0]
                                                        [#list 1..productType.grade as i]
                                                            &nbsp;&nbsp;
                                                        [/#list]
                                                    [/#if]
                                                ${productType.name}
                                                </option>
                                            [/#list]
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">名称</label>

                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="name" placeholder="名称">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">产品介绍</label>
                                        <div class="col-md-8 col-sm-8">
                                            <textarea class="form-control editor" id="editor" name="introduction" style="width:100%;"></textarea>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">销售价</label>
                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="price" placeholder="销售价">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">库存</label>
                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="stock" placeholder="库存">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">备注</label>

                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="remark" placeholder="备注">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">设置</label>

                                        <div class="col-md-8 col-sm-8">
                                            <input type="checkbox" name="isMarketable" value="true" checked="checked"> 是否上架
                                            <input type="hidden" name="_isMarketable" value="false">
                                        </div>
                                    </div>

                                </div>
                                <div id="fragment-2">

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">搜索关键词</label>

                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="keyword" placeholder="搜索关键词">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">页面标题</label>

                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="seoTitle" placeholder="页面标题">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">页面关键词</label>

                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="seoKeywords" placeholder="页面关键词">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">页面描述</label>

                                        <div class="col-md-8 col-sm-8">
                                            <input class="form-control" type="text" name="seoDescription" placeholder="页面描述">
                                        </div>
                                    </div>
                                </div>
                                <div id="fragment-3">
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">产品图片</label>

                                        <div class="col-md-10 col-sm-10">
                                            <input id="file-1" name="files" type="file"  class="file" multiple="true" data-min-file-count="2"
                                                   data-show-upload="false" data-allowed-file-extensions='["jpg", "png", "gif"]' data-upload-url="#">
                                            <br>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 30px"></div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <a class="btn btn-danger" type="button" href="list.jhtml">返回</a>
                                    <button type="submit" class="btn btn-primary">确定</button>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${base}/resources/jquery-2.1.0.min.js"></script>
<script src="${base}/resources/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${base}/resources/jquery-migrate-1.2.1.min.js"></script>
<script src="${base}/uilib/bootstrap-3/js/bootstrap.min.js"></script>
<script src="${base}/resources/modernizr.min.js"></script>

<script src="${base}/resources/admin/input.js"></script>
<script src="${base}/resources/jquery.validate.min.js"></script>
<script src="${base}/resources/bootbox.min.js"></script>
<script src="${base}/uilib/sco-master/js/sco.message.js"></script>
<script src="${base}/uilib/fileinput/js/fileinput.min.js"></script>
<script src="${base}/uilib/fileinput/js/fileinput_locale_zh.js"></script>
<script src="${base}/uilib/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script src="${base}/uilib/kindeditor4/kindeditor-all-min.js"></script>

<script>
	$(document).on('ready', function() {
		[@flash_message /]
        $("#file-1").fileinput({
            language: 'zh', //设置语言
            //uploadUrl: 'www.baidu.com', //上传的地址
            allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
            showUpload: false, //是否显示上传按钮
            //showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            //elErrorContainer: '#errorBlock'
            maxFileCount:5
        });

        $("#tabs").tabs({
            //collapsible: true,
            event: "mouseover"
        });

		var $inputForm = $("#inputForm");
        $inputForm.validate({
                rules: {
                    name: {
                        required: true
                    },
                    productTypeId: {
                        required: true
                    },
                    price: {
                        required : true
                    },
                    introduction : {
                        required : true
                    }
                },
                submitHandler:function(form){
                    //跳出验证对话框
                    bootbox.confirm({
                        //size: 'small',
                        message: "您确定操作吗?",
                        buttons: {
                            cancel: {
                                label: "取消",
                                className: "btn-default"
                            },
                            confirm : {
                                label: "确定",
                                className: "btn-primary"
                            }
                        },
                        callback: function(result){
                            console.log("result :", result);
                            if (result) {
                                console.log("form_serialize:", $inputForm.serialize());
                                form.submit();
                            }
                        }
                    });
                }
        });
    });


    if (typeof KindEditor != 'undefined') {
        KindEditor.ready(function(K){
            var editor = K.create("#editor", {
                height: "300px",
                langType : 'zh-CN',
                items: [
                    "source", "|", "undo", "redo", "|", "preview", "print", "template", "cut", "copy", "paste",
                    "plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright",
                    "justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent", "subscript",
                    "superscript", "clearhtml", "quickformat", "selectall", "|", "fullscreen", "/",
                    "formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold",
                    "italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image",
                    "flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak",
                    "anchor", "link", "unlink"
                ],
                allowUpload : false,
                allowFileManager : false,
            });
        });
    }

</script>

</body>
</html>