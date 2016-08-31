<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>生成静态页面</title>

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
                    <li><a href=""../../../common/overview.jhtml"><i class="fa fa-home"></i> 首页</a></li>
                    <li>生成静态</li>
                </ul>
            </div>
        </div>


        <!-- 主题表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading">
                       	 生成静态页面
                    </div>
                    <div class="panel-body">
                        <form  class="form-horizontal" id="inputForm" action="build.jhtml" method="post" role="form">

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">生成类型</label>
                                <div class="col-md-6 col-sm-6">
                                    <select class="form-control input-sm" id="buildType" name="buildType">
                                        <option value="0">首页</option>
                                        <option value="1">关于我们</option>
                                        <option value="2">联系我们</option>
                                        <option value="3">产品</option>
                                        <option value="-1">所有</option>
                                    </select>

                                </div>
                            </div>

                            <div class="form-group hidden">
                                <label class="col-md-2 col-sm-2 control-label">产品类型</label>
                                <div class="col-md-6 col-sm-6">
                                    <select class="form-control input-sm" id="productTypeId" name="productTypeId">
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
                                <label class="col-md-2 col-sm-2 control-label">开始日期</label>

                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control input-sm begin-date" name="beginDate" type="text" value="${defaultBeginDate?string("yyyy-MM-dd")}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">结束日期</label>

                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control input-sm end-date" name="endDate" type="text" value="${defaultEndDate?string("yyyy-MM-dd")}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">每次生成数</label>
                                <div class="col-md-6 col-sm-6">
                                    <input class="form-control" name="count" type="text" placeholder="生成数目" value="50">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <button  class="btn btn-primary"  type="submit" >确定</button>
									<a class="btn btn-danger" type="button" href=""../../../common/overview.jhtml">返回</a>
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

<script>
	$(document).ready(function() {
		[@flash_message /]
		var $inputForm = $("#inputForm");

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

        $('#buildType').change(function(){
            var type = $(this).val();
            if (type == 3) {
                $('#productTypeId').parent().parent().removeClass('hidden');
            } else {
                $('#productTypeId').parent().parent().addClass('hidden');
            }
        });

            $inputForm.validate({
            rules: {
            	count: "required"
            },
            submitHandler: function (form) {
                //跳出验证对话框
                bootbox.confirm({
                    //size: 'small',
                    message: "您确定操作吗?",
                    buttons: {
                        confirm: {
                            label: "确定",
                            className: "btn-primary"
                        },
                        cancel: {
                            label: "取消",
                            className: "btn-default"
                        }
                    },
                    callback: function (result) {
                        console.log("result :", result);
                        if (result) {
                            console.log("form_serialize:", $inputForm.serialize());
                            //form.submit();
                            $.post("build.jhtml", $inputForm.serialize(), function(resp, status){
                            	console.log("response is", resp);
                            	if (resp != null && resp.isCompleted) {
                            		var time;
									if (resp.buildTime < 60000) 
										time = (resp.buildTime / 1000).toFixed(2) + "秒";
									else 
										time = (resp.buildTime / 60000).toFixed(2) + "分";
                            		$.scojs_message("生成静态页面成功 [生成数: "+ resp.buildCount + "耗时: " + time, $.scojs_message.TYPE_OK);
                            	} else {
                            		$.scojs_message("生成静态页面失败!", $.scojs_message.TYPE_ERROR);
                            	}
                            }, "json");
                        }
                    }
                });
            }
       }); 
       
	});

</script>

</body>
</html>