<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>通告管理</title>


    <link href="${base}/resources/css/admin/style.css" rel="stylesheet">
    <link href="${base}/resources/css/admin/style-responsive.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/scojs.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/sco.message.css" rel="stylesheet">
    
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
                    <li>通告管理列表(共<span id="pageTotal">${page.total}</span>条记录)</li>
                </ul>
            </div>
        </div>
        <form id="listForm" action="list.jhtml" method="get">
            <!-- 搜索条件  -->
            <div class="row clearfix">
                <div class="col-md-12">
                    <div class="clearfix">
                        <label>
                            <span style="margin-right: 15px;">标题</span>
                            <input type="text" class="form-control input-sm" placeholder="标题"
                                   name="title" value="${search.title}"
                                   style="width: 150px; display: inline-block; margin-right: 30px;">
                        </label>

                        <button type="submit" class="btn-sm btn btn-info" style="margin-left: 30px;"><i
                                class="fa fa-search"></i>
                            		查询
                        </button>
                    </div>
                </div>
            </div>

            <!-- 主题表格数据 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            	通告管理列表
                            <a href="#" class="btn btn-xs btn-warning disabled" id="deleteButton" data-toggle="modal"
                               data-target="#deleteModal" style="margin-left: 30px;">
                                <i class="fa fa-minus-circle"></i> 删除
                            </a>
                            <a href="add.jhtml" class="btn btn-xs btn-info"><i class="fa fa-plus-circle"></i> 添加</a>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover table-bordered" id="listTable">
                                <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" id="selectAll">
                                    </th>
                                    <th>标题</th>
                                    <th>是否发布</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                [#list page.content as notice]
	                                <tr>
	                                    <td><input type="checkbox" name="ids" value=""></td>
	                                    <td>${notice.title}</td>
	                                    <td>
	                                    	[#if notice.isPublication]
	                                    		是
	                                    	[#else]
	                                    		否
	                                    	[/#if]
	                                    </td>
	                                    <td>${notice.createDate?string("yyyy-MM-dd")}</td>
	                                    <td>
	                                        <a href="#" class="btn btn-search btn-view" val="${notice.id}"><i class="fa fa-search"></i>查看
	                                        </a>
											<a href="edit.jhtml?id=${notice.id}" class="btn btn-info"><i class="fa fa-pencil-square"></i>编辑
	                                    </td>
	                                </tr>
                                [/#list]
                                </tbody>
                            </table>
                            <!-- 分页信息 -->
							[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
								[#include "/admin/include/pagination.ftl"]
							[/@pagination]


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
                        <button class="btn btn-default" data-dismiss="modal" type="button">关闭</button>
                        <button class="btn btn-warning" data-dismiss="modal" type="button"> 确定</button>
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
    
    <!-- 通告详情 -->
    <div class="hidden">
    	<div class="table-responsive table-detail">
	    	<table class="table table-striped" style="width: 100%;">
			      <tr>
			         <td>标题</td>
			         <td class="dlg-title"></td>
			      </tr>
			      <tr>
			         <td>内容</td>
			         <td class="dlg-content"></td>
			      </tr>
			      <tr>
			         <td>作者</td>
			         <td class="dlg-author"></td>
			      </tr>
			      <tr>
			         <td>SEO-标题</td>
			         <td class="dlg-seoTitle"></td>
			      </tr>
			      <tr>
			         <td>SEO-关键字</td>
			         <td class="dlg-seoKeywords"></td>
			      </tr>
			      <tr>
			         <td>SEO-描述</td>
			         <td class="dlg-seoDescription"></td>
			      </tr>	
			      <tr>
			         <td>是否发布</td>
			         <td class="dlg-isPublication"></td>
			      </tr>		
			      <tr>
			         <td>点击数</td>
			         <td class="dlg-hits"></td>
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
		$(".btn-view").off("click").on("click", function(event){
			//preventDefault() 方法阻止元素发生默认的行为(滚动条事件)
			event.preventDefault();
			var dlgTableContent = $(".table-detail").clone();
			var id = $(this).attr("val");	
					
			//返回详情内容
			$.post(detailUrl, {"id":id}, function(resp, status){
				if (resp != null && resp.type == "success") {
					var notice = $.parseJSON(resp.content);
					$.each(notice, function(name, value){ 
						console.log("Name: " + name + ", Value: " + value); 
						if (name == "isPublication") {
							dlgTableContent.find(".dlg-" + name).text(value == true ? "是":"否");
						} else {
							dlgTableContent.find(".dlg-" + name).text(value);
						}
					});
					
					//对话框内容详情
					var modal =$.scojs_modal({
						target : "#detailModal",
					  	title   : "信息详情",
					  	content	 : dlgTableContent.html()
					});
					modal.show();
					
				}
			}, "json");
		});
	});
	  
</script>

</body>
</html>


