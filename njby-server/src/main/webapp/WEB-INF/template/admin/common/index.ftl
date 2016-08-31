<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>系统概况</title>

    <link href="${base}/resources/css/admin/style.css" rel="stylesheet">
    <link href="${base}/resources/css/admin/style-responsive.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/scojs.css" rel="stylesheet">
    <link href="${base}/uilib/sco-master/css/sco.message.css" rel="stylesheet">
    <style>
        .coustom_panel {
            width: 100%;
            height: 250px;
            border-radius: 4px;
        }
    </style>
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
                    <li><a href="#"><i class="fa fa-home"></i> 首页</a></li>
                    <li>概况</li>
                </ul>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-6 ">
                <div class="panel panel-default coustom_panel">
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-condensed cf">
                            <tbody>
                            <tr>
                                <td>系统名称/版本:</td>
                                <td>${siteName}/V1.0</td>
                            <tr>
                                <td>操作系统:</td>
                                <td>${osName}</td>
                            </tr>
                            <tr>
                                <td>系统架构:</td>
                                <td>${osArch}</td>
                            </tr>
                            <tr>
                                <td>JAVA版本:</td>
                                <td>${javaVesion}</td>
                            </tr>
                            <tr>
                                <td>JAVAHOME:</td>
                                <td>${javaHome}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-6 ">
                <div class="panel panel-default coustom_panel">
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-condensed cf">
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-6 ">
                <div class="panel panel-default coustom_panel">
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-condensed cf">
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-6 ">
                <div class="panel panel-default coustom_panel">
                    <div class="panel-body">
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
</body>
</html>