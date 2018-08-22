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
<body class="font-ch">
<nav class="navbar navbar-expand-lg navbar-dark co-drak mainHeader">
  <a class="navbar-brand" href="/govdetail">首頁</a>
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
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <h1 class="text-center">「澎湖民藝復興計畫」盤點網</h1>
    </div>
  </div>
  <hr>
</div>

<div class="main container col-md-6">
  <h3>檔案詳細列表</h3>
  <div class="">
    <div class="row">
		<table class="table">
		  <tbody>
			<tr>
			  <td scope="col">出版品型態</td>
			  <td> 全文電子檔</td>
			</tr>
			<tr>
			  <td scope="col">描述 </td>
			  <td>闡述文化內容 </td>
			</tr>
			<tr>
			  <td scope="col">書籍名稱 </td>
			  <td>澎湖文化 </td>
			</tr>
			<tr>
			  <td scope="col">作者/編者 </td>
			  <td>王大明 </td>
			</tr>
			<tr>
			  <td scope="col">出版年月 </td>
			  <td>2015/8 </td>
			</tr>
			<tr>
			  <td scope="col">出版地 </td>
			  <td>澎湖縣 </td>
			</tr>
			<tr>
			  <td scope="col">ISBN </td>
			  <td>XXXXXXXXXX-X </td>
			</tr>
			<tr>
			  <td scope="col"> 授權(費用) </td>
			  <td>是,5000 </td>
			</tr>
			<tr>
			  <td scope="col">類型 </td>
			  <td>食,住 </td>
			</tr>
			<tr>
			  <td scope="col">標籤 </td>
			  <td> #抱礅#海#石滬</td>
			</tr>
			<tr>
			  <td scope="col">上傳日期 </td>
			  <td>2018/05/20 </td>
			</tr>
			<tr>
			  <td scope="col">檔案下載 </td>
			  <td><a href="#">下載</a></td>
			</tr>
		  </tbody>
		</table>
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
