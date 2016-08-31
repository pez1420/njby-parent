<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>编辑广告</title>

    <link href="${base}/resources/css/admin/style.css" rel="stylesheet">
    <link href="${base}/resources/css/admin/style-responsive.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/scojs.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/sco.message.css" rel="stylesheet">
    <link href="${base}/uilib/bootstrap-datetimepicker-0.0.11/css/bootstrap-datetimepicker.min.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${base}/resources/html5shiv.js"></script>
    <script src="${base}/resources/respond.min.js"></script>
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
                    <li>编辑广告</li>
                </ul>
            </div>
        </div>


        <!-- 主题表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading">
                        	基本信息
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" id="inputForm" action="update.jhtml" method="post" role="form" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${ad.id}" />
                            <input type="hidden" id="conditionAdPositionId" value="${ad.adPosition.id}" />
                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">标题</label>

                                <div class="col-md-8 col-sm-8">
                                    <input class="form-control" name="title" value="${ad.title}" type="text" placeholder="标题">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">类型</label>

                                <div class="col-md-8 col-sm-8">
                                    <select class="form-control input-sm" id="adType" name="adType">
                                        <option value="0" [#if ad.adType == 0] selected=true [/#if]>文本</option>
                                        <option value="1" [#if ad.adType == 1] selected=true [/#if]>图片</option>
                                        <option value="2" [#if ad.adType == 2] selected=true [/#if]>flash</option>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">广告位</label>

                                <div class="col-md-8 col-sm-8">
                                    <select class="form-control input-sm" id="adPositionId" name="adPositionId">
                                    </select>
                                </div>
                            </div>

                            <div class="form-group hidden path">
                                <label class="col-md-2 col-sm-2 control-label">已存在图片</label>

                                <div class="col-md-8 col-sm-8">
                                   [#-- <input class="form-control" id="path" name="path" value = "${ad.path}" type="text" placeholder="图片路径">--]
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>查看</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><a class="btn btn-primary"  href="${base}${ad.path}" target= _blank>查看</a></td>

                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="form-group hidden path">
                                <label class="col-md-2 col-sm-2 control-label">图片选择</label>

                                <div class="col-md-8 col-sm-8">
                                    <input class="form-control" name="imagePath" id="imagePath" type="file">
                                </div>
                            </div>

                            <div class="form-group content">
                                <label class="col-md-2 col-sm-2 control-label">内容</label>

                                <div class="col-md-8 col-sm-8">
[#--									 <textarea id="content" name="content"
                                               style="width: 100%; height: 100px; padding: 0px;">${ad.content}</textarea>--]
                                    <textarea id="editor" name="content" class="editor" style="width: 100%;">${ad.content}
                                    </textarea>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">开始日期</label>

                                <div class="col-md-8 col-sm-8">
                                    <input class="form-control input-sm begin-date" name="beginDate" [#if ad.beginDate??] value="${ad.beginDate?string("yyyy-MM-dd")}" [/#if] type="text">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">结束日期</label>

                                <div class="col-md-8 col-sm-8">
                                    <input class="form-control input-sm end-date" name="endDate" [#if ad.endDate??] value="${ad.endDate?string("yyyy-MM-dd")}"[/#if] type="text">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">链接地址</label>

                                <div class="col-md-8 col-sm-8">
                                    <input class="form-control" name="url" id="url" value="${ad.url}" type="text" placeholder="链接地址">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">排序</label>

                                <div class="col-md-8 col-sm-8">
                                    <input class="form-control" name="orders" type="text" value="${ad.orders}" placeholder="排序">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <a class="btn btn-danger" type="button" href="list.jhtml">返回</a>
                                    <button class="btn btn-primary" type="submit">保存</button>
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

<script src="${base}/uilib/bootstrap-datetimepicker-0.0.11/js/bootstrap-datetimepicker.min.js"></script>
<script src="${base}/uilib/bootstrap-datetimepicker-0.0.11/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${base}/uilib/kindeditor4/kindeditor-all-min.js"></script>


<script>
    $(document).ready(function () {
        var $inputForm = $("#inputForm");
        var $adType = $("#adType");
        var $adPositionId = $("#adPositionId");
        var $divPath = $("div.path");
        //var $path = $("#path");
        var $divContent = $("div.content");
        var $url = $("#url");

        //根据下拉框设置或者隐藏表单
        var adTypeVal = $adType.find("option:selected").val();
        if (adTypeVal == "1") {
            $divPath.removeClass("hidden");
            $divContent.addClass("hidden");
        } else if (adTypeVal == "0") {
            $divContent.removeClass("hidden");
            $divPath.addClass("hidden");
        }

        //删除当前行
        $(".btn-orignal-del").off("click").on("click", function(){
            $(this).parent().parent().remove();
        });

        $adType.off("change").on("change", function () {
            //文本
            if ($(this).val() == "0") {
                $divContent.removeClass("hidden");
                $divPath.addClass("hidden");
                //$path.prop("disabled", true);
            } else if ($(this).val() == "1") { //图片
                $divContent.addClass("hidden");
                $divPath.removeClass("hidden");
                //$path.prop("disabled", false);
            }
        });

        //填充广告位
        $.post("ad_positions.jhtml", {}, function (resp, status) {
            if (resp != null && resp.type == "success") {
                var content = $.parseJSON(resp.content);
                $adPositionId.empty();
                for (var i = 0; i < content.length; i++) {
                	var $option = $("<option></option>");
                	if ($("#conditionAdPositionId").val() == content[i].id) 
	                    $option = $("<option selected='true'></option>");
                    
                    $adPositionId.append($option.text("[" + content[i].name
	                            + " " + content[i].width
	                            + "x" + content[i].height + "]").val(content[i].id));
                }
            }
        }, "json");

        var format = "yyyy-mm-dd";
        $(".begin-date").datetimepicker({
            format: format,
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: true
        });

        $(".end-date").datetimepicker({
            format: format,
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: true
        });


        $inputForm.validate({
            rules: {
                title: "required",
                adPositionId: "required",
                path: "required",
                orders: {
                    required: true,
                    digit: true
                }
            },
            submitHandler: function (form) {
                //跳出验证对话框
                bootbox.confirm({
                    //size: 'small',
                    message: "您确定操作吗?",
                    buttons: {
                        cancel: {
                            label: "取消",
                            className: "btn-default"
                        },
                        confirm: {
                            label: "确定",
                            className: "btn-primary"
                        }
                    },
                    callback: function (result) {
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