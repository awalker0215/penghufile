﻿<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-Hant-TW">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Publisher</title>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">

</head>
<body class="font-ch">
<nav class="navbar navbar-expand-lg navbar-dark co-dark mainHeader">
  <a class="navbar-brand" href="index.html">首頁</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="upload.html">上傳檔案</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="inventory.html">檔案列表</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="unit.html">單位列表</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="detail.html">詳細資料</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="unitSetting.html">設定</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.html">登入</a>
      </li>
    </ul>
  </div>
</nav>
<div class="container-fluid co-white">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <h1 class="text-center">「澎湖民藝復興計畫」盤點網</h1>
    </div>
  </div>
  <hr>
</div>
<div class="container col-md-6 co-transparent">
  <div class="row text-center">
    <div class="col-md-12 col-md-offset-3">
		<h3>單位A</h3>
	</div>
  </div>
  <hr>
  <div class="row col-md-12">
    <div class="col-sm-6 text-center"> 
		<h5>基本資料</h5>
		<div class="text-justify">
			<p><strong>設立年代</strong>&nbsp;1995</p>
			<p><strong>負責人</strong>&nbsp;王大明</p>
			<p><strong>電話</strong>&nbsp;06-9876630</p>
			<p><strong>地址</strong>&nbsp;澎湖縣馬公市XX路XXX號</p>
			<p><strong>網址</strong>&nbsp;<a href="http://google.com">www.xxx.gov.tw</a></p>
		</div>
	</div>
	<div class="text-center col-sm-6"> 
		<div>
			<p>您有<h4>5</h4>個文化檔案</p>
		</div>
	  <button class="btn btn-info" onclick="location.href='upload.html'">新增資料</button>
	</div>
  </div>
</div>
<div class="footerArea container-fluid navbar-dark co-light">
  <div class="row">
    <div class="text-center col-md-12 col-md-offset-3">
      <p>Copyright &copy; 2018 &middot; IDELab </p>
    </div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="/resources/js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="/resources/js/bootstrap.js"></script>
</body>
</html>
