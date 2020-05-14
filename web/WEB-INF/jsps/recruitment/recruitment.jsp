<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>创新创业型小微企业人力资源管理平台</title>
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
    <meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon" />
<link href="${ctx}/js/metronic/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/metronic/css/base.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="${ctx}/campusnew3/css/base.css"/>
	<link rel="stylesheet" href="${ctx}/campusnew3/css/flexslider.css" type="text/css"/>
	<link rel="stylesheet" href="${ctx}/campusnew3/css/home.css"/>
	 
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
	
	<script src="${ctx}/campus/js/libs/jquery.js"></script>
    <script src="${ctx}/campus/js/footer.js"></script>
    <script src="${ctx}/campusnew/js/libs/jquery.js"></script>
	<script src="${ctx}/campusnew/js/libs/jquery.flexslider-min.js"></script>
	<script src="${ctx}/campusnew/js/main.js"></script>
	<script src="${ctx}/campus/js/footer.js"></script>
	<script src="${ctx}/campus/js/home.js"></script>
</head>
<body style="background-color:rgb(73,74,95);">
<div style="width: 1360px;height:48px; background-color:RGB(43,48,59) ">
      <ul style="margin-left: 40px;padding-top:6px; ">
        <li style="display: inline-block;"><h1><a href="loginForm.html" style="color:white;font-size:20px;text-decoration:none;">创新创业型小微企业人力资源管理平台</a></h1></li>
        <li style="display: inline-block; margin-left: 120px;"><a  style="font-size:14px;color:rgb(130,130,130); text-decoration:none;" >用户登陆</a></li>
        <li style="display: inline-block; margin-left: 60px;"><a href="loginForm.html" style="font-size:14px;color:rgb(130,130,130); text-decoration:none; ">首页</a></li>
        <li style="display: inline-block; margin-left: 60px;"><a href="#" onclick="location.href='./recruitment';"style="font-size:14px;color:rgb(130,130,130); text-decoration:none;">招聘页面</a></li>
        <li style="display: inline-block; margin-left: 80px;"><a href="javascript:alert('本系统只提供管理员和公司管理人员登录系统！！！如若注册此系统，请联系部门负责人下发注册码 ！！！');"	  style="font-size:14px;color:rgb(130,130,130); text-decoration:none;">帮助与文档</a></li>
        <li style="display: inline-block; margin-left: 64px;"><p  style="font-size:14px;color:rgb(130,130,130);">客服电话：4008864211</p></li>
      </ul>    
    </div> 
    <div style="height: 80px;background-color:rgb(73,74,95);width:1360px;"></div>
<div id="J-index-wrap" class="index-wrap animation" style="background-color:rgb(73,74,95);width:1360px;">
	<div class="wrap" style="background-color:rgb(73,74,95);width:1360px; padding-left: 200px">
		<div class="main-burn-content" style="background-color:rgb(73,74,95);width:1360px;">
			<div class="index_cont">
                        	<div class="applystatus" style="display:none" >
            					<h3 class="applystatus_title">申请状态</h3>
				<input type="hidden" id="jobObjFlag" value="false" />
									<a href="/web/resume/resume_index" class="index_cont_btn applystatus_myresume">我的简历</a>
				</div>
		        	<div class="postlist" style="display:block" >
        					<div class="postlist_cont">
						<div class="postlist_item">
							<div class="postlist_sub postlist_xproj">
								<div class="postlist_sub_valign">
									<div class="valign_wrap">
										<div class="postlist_sub_icon"></div>
										<div class="postlist_sub_name">人才项目</div>
									</div>
									<!--[if lt IE 8]><span></span><![endif]-->
								</div>
								<ul class="postlist_sub_wrap">
									
									<li class="postlist_sub_item"><a onclick="" href="#">管培生</a></li>
                                    
								</ul>
							</div>
						</div>
						<div class="postlist_item">
							<div class="postlist_sub postlist_xtech">
								<div class="postlist_sub_valign">
									<div class="valign_wrap">
										<div class="postlist_sub_icon"></div>
										<div class="postlist_sub_name">技术方向</div>
									</div>
									<!--[if lt IE 8]><span></span><![endif]-->
								</div>
								<ul class="postlist_sub_wrap">
																			<li class="postlist_sub_item"><a onclick="" href="#">软件开发类</a></li>
																			<li class="postlist_sub_item"><a onclick="" href="#">数据与算法类</a></li>
																			<li class="postlist_sub_item"><a onclick="" href="#">测试类</a></li>
																	</ul>
							</div>
							<div class="postlist_sub postlist_xop">
								<div class="postlist_sub_valign">
									<div class="valign_wrap">
										<div class="postlist_sub_icon"></div>
										<div class="postlist_sub_name">客户服务</div>
									</div>
									<!--[if lt IE 8]><span></span><![endif]-->
								</div>
								<ul class="postlist_sub_wrap">
																			<li class="postlist_sub_item"><a onclick="" href="#">客户服务类</a></li>
																	</ul>
							</div>
						</div>
						<div class="postlist_item">
							<div class="postlist_sub postlist_xux">
								<div class="postlist_sub_valign">
									<div class="valign_wrap">
										<div class="postlist_sub_icon"></div>
										<div class="postlist_sub_name">设计方向</div>
									</div>
									<!--[if lt IE 8]><span></span><![endif]-->
								</div>
								<ul class="postlist_sub_wrap">
																			<li class="postlist_sub_item"><a onclick="" href="#">设计类</a></li>
																	</ul>
							</div>
							<div class="postlist_sub postlist_xmarket">
								<div class="postlist_sub_valign">
									<div class="valign_wrap">
										<div class="postlist_sub_icon"></div>
										<div class="postlist_sub_name">金融方向</div>
									</div>
									<!--[if lt IE 8]><span></span><![endif]-->
								</div>
								<ul class="postlist_sub_wrap">
																			<li class="postlist_sub_item"><a onclick="" href="#">金融产品类</a></li>
																			<li class="postlist_sub_item"><a onclick="" href="#">保险类</a></li>
																	</ul>
							</div>
						</div>
						<div class="postlist_item">
							<div class="postlist_sub postlist_xpm">
								<div class="postlist_sub_valign">
									<div class="valign_wrap">
										<div class="postlist_sub_icon"></div>
										<div class="postlist_sub_name">产品方向</div>
									</div>
									<!--[if lt IE 8]><span></span><![endif]-->
								</div>
								<ul class="postlist_sub_wrap">
																			<li class="postlist_sub_item"><a onclick="" href="#">项目类</a></li>
																			<li class="postlist_sub_item"><a onclick="" href="#">产品运营类</a></li>
																	</ul>
							</div>
							<div class="postlist_sub postlist_xfn">
								<div class="postlist_sub_valign">
									<div class="valign_wrap">
										<div class="postlist_sub_icon"></div>
										<div class="postlist_sub_name">市场与职能方向</div>
									</div>
									<!--[if lt IE 8]><span></span><![endif]-->
								</div>
								<ul class="postlist_sub_wrap">
																			<li class="postlist_sub_item" style="height:25px;line-height: 15px"><a onclick="" href="#">人力资源类</a></li>
																			<li class="postlist_sub_item" style="height:25px;line-height: 15px"><a onclick="" href="#">行政类</a></li>
																	</ul>
							</div>
						</div>
					</div>
					<a href="#" onclick="location.href='./recruitmentlist';" class="index_cont_btn postlist_sendresume"  style="margin-left: 360px;">投递简历</a>
				</div> 

			</div>
		</div>
	</div>
	</div>
	<div style="height: 146px;width:1360px;background-color:rgb(73,74,95);"></div>
	
	  <!-- 底部开始 -->
     <div style="width: 1360px;height:48px; background-color:RGB(43,48,59);">
        <div align="center" style="padding-top:15px;color:RGB(153,153,153);">Copyright ©2020 关注公众号【零幺码】和我一起进步！</div>
    </div>
</body>
</html>