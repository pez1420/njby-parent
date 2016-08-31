<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>南京秦淮区碧源礼品文化经营部</title>
    <link href="${base}/uilib/bootstrap-3/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="${base}/uilib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${base}/resources/css/googleapifont.css" rel="styleshee" type="text/css">
    <link href="${base}/uilib/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" rel="stylesheet" type="text/css" />
    <link href="${base}/uilib/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" rel="stylesheet" type="text/css" />
    <link href="${base}/resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>

<!-- 网页头部 -->
[#include "/forward/include/header.ftl"]

<!--公司概况-->
<div class="section_header">
  <div class="container">
    <h2><span>公司概况</span>|About our company</h2>
  </div>
</div>
<div id="about_section_1">
  <div class="container">
    <div class="row">
      <div class="col-lg-6">
          [@ad_list count=1 ad_type=1 ad_position_id="c1958aceebeb11e595ed74e5432100f2"]
              [#list ads as ad]
                  <img src="${base}${ad.path}" class="img-responsive" alt="${ad.title}">
              [/#list]
          [/@ad_list]
      </div>

        <div class="col-lg-6">
        <h3>公司简介</h3>
        <p>
            [@ad_list count=1 ad_type=0 ad_position_id="e4d27066ebeb11e595ed74e5432100f2"]
                [#list ads as ad]
                    ${ad.content}
                [/#list]
            [/@ad_list]
        </p>
        </div>
    </div>
  </div>
</div>


<!-- 选择我们的原因 -->
<div class="section_header">
	<h2><span>选择我们的原因</span>|Why choose us</h2>
</div>
<div id="about_section_2">
  <div class="container">
    <div class="row">
     [@culture_list count=4]
		[#list cultures as culture]
		    <div class="col-lg-6">
		        <h4><i class="fa fa-graduation-cap fa-2x pull-left"></i> ${culture.title}</h4>
		        <p> ${culture.detail}</p>
      		</div>
		[/#list]
	 [/@culture_list]
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

<script src="${base}/resources/jquery-2.1.0.min.js"></script>
<script src="${base}/resources/less-1.7.5.min.js"></script>
<script src="${base}/uilib/bootstrap-3/js/bootstrap.min.js"></script>
</body>
</html>