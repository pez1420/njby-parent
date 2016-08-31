<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>设备更新</title>

    <link href="${base}/resources/css/admin/style.css" rel="stylesheet">
    <link href="${base}/resources/css/admin/style-responsive.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/scojs.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/sco.message.css" rel="stylesheet">
    <link href="${base}/uilib/fileinput/css/fileinput.min.css" rel="stylesheet" type="text/css"/>

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
                    <li><a href="#">编辑产品设备</a></li>
                </ul>
            </div>
        </div>


        <!-- 主题表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading ">
                        设备基本信息
                    </div>
                    <div class="panel-body">
                        <form id="inputForm" action="update.jhtml" method="post" class="form-horizontal" role="form"
                              enctype="multipart/form-data">

                            <input type="hidden" name="id" value="${equipment.id}">

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">名称</label>

                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control" type="text" name="name" value="${equipment.name}" placeholder="名称">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">设备介绍</label>

                                <div class="col-md-6 col-sm-6">
                                    <textarea class="form-control" rows="5" cols="20" name="introduction"
                                              placeholder="设备介绍">${equipment.introduction}
                                    </textarea>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">搜索关键词</label>

                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control" type="text" name="keyword"  value="${equipment.keyword}" placeholder="搜索关键词">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">页面标题</label>

                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control" type="text" name="seoTitle" value="${equipment.seoTitle}" placeholder="页面标题">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">页面关键词</label>

                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control" type="text" name="seoKeywords" value="${equipment.seoKeywords}" placeholder="页面关键词">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">页面描述</label>

                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control" type="text" name="seoDescription" value="${equipment.seoDescription}" placeholder="页面描述">
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">已存在设备图片</label>
                                <div class="col-md-10 col-sm-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>文件</th>
                                                <th>查看</th>
                                                <th>排序</th>
                                                <th>删除</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        [#list equipmentImages as equipmentImage]
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="equipmentImageIds" value="${equipmentImage.id}">
                                                    [#--<input type="file">--]
                                                </td>
                                                <td><a class="btn btn-primary"  href="${base}${equipmentImage.source}" target= _blank>查看</a></td>
                                                <td>1</td>
                                                <td><a  class="btn btn-danger btn-orignal-del">删除</a></td>
                                            </tr>
                                        [/#list]
                                        </tbody>
                                    </table>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">设备图片</label>
                                <div class="col-md-10 col-sm-10">
                                    <input id="equipmentFile" name="files" type="file"  class="file" multiple="true" data-min-file-count="2"
                                           data-show-upload="false" data-allowed-file-extensions='["jpg", "png", "gif"]' data-upload-url="#">
                                    <br>

                                </div>
                            </div>


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

<script>
    $(document).on('ready', function() {
    [@flash_message /]
        $("#equipmentFile").fileinput({
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

        var $inputForm = $("#inputForm");
        $inputForm.validate({
            rules: {
                name: {
                    required: true
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

        $(".btn-orignal-del").off("click").on("click", function(){
            $(this).parent().parent().remove();
        });
    });

</script>

</body>
</html>