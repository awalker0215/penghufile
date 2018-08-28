<%@taglib prefix="sec"
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
<body class="font-ch co-background">
<nav class="navbar navbar-expand-lg navbar-dark co-drak mainHeader">
  <a class="navbar-brand" href="/">首頁</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
      <li class="nav-item active">
        <a class="nav-link" href="/fileupload">上傳檔案</a>
      </li>
      </sec:authorize>
      <sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_ADMIN')">
      <li class="nav-item">
        <a class="nav-link" href="/inventory">檔案列表</a>
      </li>
      </sec:authorize>
      <sec:authorize access="!hasRole('ROLE_USER') and hasRole('ROLE_ADMIN')">
      <li class="nav-item">
        <a class="nav-link" href="/government">單位列表</a>
      </li>
      </sec:authorize>
      <sec:authorize access="!hasRole('ROLE_USER') and !hasRole('ROLE_ADMIN')">
      <li class="nav-item">
        <a class="nav-link" href="/login">登入</a>
      </li>
      </sec:authorize>
      <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
      <c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	    
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
      <li class="nav-item">
        <a class="nav-link" href="javascript:formSubmit()">登出</a>
      </li>
      </sec:authorize>
    </ul>
  </div>
</nav>
<div class="container-fluid co-white">
  <div class="row text-center">
    <div class="col-md-12 col-md-offset-3">
		<h1>「澎湖民藝復興計畫」盤點網</h1>
	</div>
  </div>
</div>
<div class="main container co-transparent">
  <div class="row col-md-12">
    <div class="col-sm-6 text-center"> 
		<h4>計畫目的</h4>
		<div class="text-justify">
			<p class="font-height">澎湖是臺灣地區最早開發的區域，也是唯一的離島縣份，由於澎湖在不同
			時期一直保持著跟大陸、臺灣之間的聯繫交流，基本上受到來自各方的交流影
			響。但是孤懸海上的地理特性以及群島組成的社會形態，卻又形成某種地域上
			的封閉性，迫使澎湖必須更仰賴在地資源與條件的開發利用。這就使得澎湖在
			幾百年的歷史時間裡，持續累積出許多不同於臺灣社會的獨特日常生活文化。
			因此，本「澎湖民藝復興計畫」的先期盤點工作，其目的即在於從俗民日常生
			活的角度，盤點食、衣、住、行、育、樂六大生活領域的在地知識與智慧，以
			做為未來研提轉譯應用計畫的基礎。</p>
		</div>
	</div>
	<div class="text-left col-sm-6 fineTuneInput"> 
    <div>
      <h4>計畫主持人</h4>
      <p><strong class="font-bigger">林寶安</strong> &middot; 國立澎湖科技大學通識教育中心教授</p>
    </div>
      <div>
      <h4>協同主持人</h4>
      <p><strong class="font-bigger">許玉河</strong> &middot; 澎湖縣隘門國民小學老師</p>
      <p><strong class="font-bigger">呂政豪</strong> &middot; 國立澎湖科技大學觀光休閒系助理教授</p>
      <p><strong class="font-bigger">李宗儒</strong> &middot; 國立澎湖科技大學資訊管理系助理教授</p>
      <p><strong class="font-bigger">胡蘊玉</strong> &middot; 國立澎湖科技大學通識教育中心助理教授</p>
    </div>
  </div>
  </div>
</div>
<div class="footerArea container-fluid navbar-dark co-light">
  <div class="row">
    <div class="text-center col-md-12 col-md-offset-3">
      <p>Copyright &copy; 2018 &middot; IDELab </p>
    </div>
  </div>
  <hr>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="/resources/js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="/resources/js/bootstrap.js"></script>
</body>
</html>
