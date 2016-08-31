<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>产品类别</title>

    <link href="${base}/resource/css/admin/style.css" rel="stylesheet">
    <link href="${base}/resource/css/admin/style-responsive.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/scojs.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/sco.message.css" rel="stylesheet">
    
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
                    <li>产品类别列表(共<span id="pageTotal">200</span>条记录)</li>
                </ul>
            </div>
        </div>

        <form id="listForm" action="product_type_view.jhtml" method="get">
            <!-- 主题表格数据 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            	产品类别列表
                            <a href="add.jhtml" class="btn btn-xs btn-info">
                            	<i class="fa fa-plus-circle"></i> 添加</a>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover table-bordered" id="listTable">
                                <thead>
                                    <tr>
                                        <th>类别名称</th>
                                        <th>等级</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	[#list productTypeTree as productType]
											<tr>
												<td>
													<span style="margin-left: ${productType.grade * 20}px;[#if productType.grade == 0] color: #000000;[/#if]">
														${productType.name}
													</span>
												</td>
												<td>
													${productType.grade}
												</td>
												<td>
												    <a href="#" class="btn btn-search btn-view" val="${productType.id}">
		                                                <i class="fa fa-search"></i>查看
		                                            </a>
		                                            <a href="edit.jhtml?id=${productType.id}" class="btn btn-info">
		                                            	<i class="fa fa-pencil-square"></i>编辑
		                                            </a>
		                                            <a href="#" class="btn btn-warning btn-delete" val="${productType.id}">
		                                                <i class="fa fa-minus-circle"></i>删除
		                                            </a>
													<a href="${base}${productType.path}" class="btn btn-search" val="${productType.id}" target="_blank">
		                                                <i class="fa fa-search"></i>[详情]
		                                            </a>									
													
												</td>
											</tr>
									[/#list]
		
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- 删除记录确认模态框（Modal） -->
        <div class="modal fade" id="deleteModal" aria-hidden="true" aria-labelledby="deleteModalLabel" role="dialog"
             tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal" type="button" aria-hidden="true">×</button>
                        <h4 class="modal-title">
                            <i class="fa fa-exclamation-triangle"></i>
                        </h4>
                    </div>
                    <div class="modal-body">
                        	您确定要删除吗?
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-warning btn-modal-delete" data-dismiss="modal" type="button"> 确定</button>
                        <button class="btn btn-default" data-dismiss="modal" type="button">关闭</button>
                    </div>
                </div>
            </div>
        </div>

		<!-- 详情查看模态框（Modal） -->
        <div class="modal fade" id="detailModal" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
             tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal" type="button" aria-hidden="true">×</button>
                        <h4 class="modal-title">
                            <i class="fa fa-exclamation-triangle"></i>
                        </h4>
                    </div>
                    <div class="modal-body">
                    	<div class="inner">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-warning" data-dismiss="modal" type="button"> 确定</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <!-- 类型详情 -->
    <div class="hidden">
    	<div class="table-responsive table-detail">
	    	<table class="table table-striped" style="width: 100%;">
			      <tr>
			         <td>名字</td>
			         <td class="dlg-name"></td>
			      </tr>			      		      
			      <tr>
			         <td>等级</td>
			         <td class="dlg-grade"></td>
			      </tr>				      
			      <tr>
			         <td>页面标题</td>
			         <td class="dlg-seoTitle"></td>
			      </tr>	
			      <tr>
			         <td>页面关键字</td>
			         <td class="dlg-seoKeywords"></td>
			      </tr>				      
			      <tr>
			         <td>页面描述</td>
			         <td class="dlg-seoDescription"></td>
			      </tr>	
			</table>
		</div>
    </div>
    
</div>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${base}/resources/jquery-2.1.0.min.js"></script>
<script src="${base}/resources/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${base}/resources/jquery-migrate-1.2.1.min.js"></script>
<script src="${base}/uilib/bootstrap-3/js/bootstrap.min.js"></script>
<script src="${base}/uilib/sco-master/js/sco.message.js"></script>
<script src="${base}/resources/modernizr.min.js"></script>

<script src="${base}/resources/admin/list.js"></script>
<script src="${base}/uilib/sco-master/js/sco.message.js"></script>
<script src="${base}/uilib/sco-master/js/sco.modal.js"></script>

<script>

	$(document).ready(function() {
		[@flash_message /]
	});

	$(document).ready(function() {
		var detailUrl = "detail.jhtml";
		var deleteUrl = "delete.jhtml";
		
		$(".btn-view").off("click").on("click", function(event){
			event.preventDefault();
			var dlgTableContent = $(".table-detail").clone();
			var id = $(this).attr("val");
			//返回详情内容
			$.post(detailUrl, {"id":id}, function(resp, status){
				if (resp != null && resp.type == "success") {
					var productType = $.parseJSON(resp.content);
					$.each(productType, function(name, value){ 
						dlgTableContent.find(".dlg-" + name).text(value);
					});					
					var modal =$.scojs_modal({
						target : "#detailModal",
					  	title   : "信息详情",
					  	content	 : dlgTableContent.html()
					});
					modal.show();
				}
			},"json"); //end for post
		});
		
		$(".btn-delete").off("click").on("click", function(event){
			event.preventDefault();	
			var id = $(this).attr("val");
			console.log("delete-id", id);
			var modal =$.scojs_modal({
				target  : "#deleteModal"
			});
			modal.show();
			// 对话框内的删除事件
			$(".btn-modal-delete").off("click").on("click", function(event){
				$.post(deleteUrl, {"id":id}, function(resp, status){				
					if (resp != null && resp.type == "success") {
						$.scojs_message(resp.content, $.scojs_message.TYPE_OK);
					} else {
						$.scojs_message(resp.content, $.scojs_message.TYPE_ERROR);
					}
				},"json"); //end for post
			});
		});
		
	});
</script>

</body>
</html>