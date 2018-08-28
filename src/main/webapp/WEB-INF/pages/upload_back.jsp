<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page session="true"%>
<%@ page language="java" import="java.sql.*" %>
<html lang="zh-Hant-TW">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Publisher</title>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-datepicker.min.css" rel="stylesheet">
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
<form name="addlocationForm" action="/uploadpage?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
<div class="main container col-md-6">
	 <div class="row">
    <div class="text-center col-md-12">
	  <div class="row col-md-12">
		  <div class="text-center form-control">
		  <h5>出版品型態</h5>
		  <div class="form-group row">
			  <label class="col-sm-4 col-form-label">描述</label>
			  <div class="col-sm-8">
				 <input type="text" class="form-control" id="" placeholder="功能、內容描述">
			  </div>
		  </div>
		    <label class="checkarea">全文電子檔
			<input type="radio" checked="checked" name="RadioForFile" id="content">
			<span class="checkradio"></span>
				<div class="custom-file" id="inputContent">
				  <input type="file" name="file" class="custom-file-input" id="inputContentFile">
				  <label class="custom-file-label" for="inputContentFile">選擇檔案</label>
				</div>
			</label>
			<label class="checkarea">附錄電子檔
			  <input type="radio" name="RadioForFile" id="appendix">
			  <span class="checkradio"></span>
			  	<div class="custom-file hiddenArea" id="inputAppendix">
				  <input type="file" class="custom-file-input" id="inputAppendixFile">
				  <label class="custom-file-label" for="inputAppendixFile">選擇檔案</label>
				</div>
			</label>
			<label class="checkarea">紙本
			  <input type="radio" name="RadioForFile" id="paper">
			  <span class="checkradio"></span>
			</label>
			<div class="text-center">
				<label class="checkarea">電子書
				  <input type="radio" name="RadioForFile" id="Ebook">
				  <span class="checkradio"></span>
				</label>
				<div class="form-group row col-md-12 text-center">
					<!-- <label class="col-sm-4 col-form-label">檔案位址</label> -->
					<div class="col-sm-12 fineTuneInput hiddenArea" id="inputEbookURL">
					  <input type="text" class="form-control" id="" placeholder="檔案位址，如：http://">
					</div>
				</div>
			</div>	
			<div class="text-center">
				<label class="checkarea">影音光碟
				  <input type="radio" name="RadioForFile" id="disk">
				  <span class="checkradio"></span>
				</label>
				<div class="form-group row col-md-12 text-center">
					<!-- <label class="col-sm-4 col-form-label">檔案位址</label> -->
					<div class="col-sm-12 fineTuneInput hiddenArea" id="inputDiskURL">
					  <input type="text" class="form-control" id="" placeholder="檔案位址，如：http://">
					</div>
				</div>
			</div>
			<div class="text-center">
				<label class="checkarea">其他
				  <input type="radio" name="RadioForFile" id="other">
				  <span class="checkradio"></span>
				</label>
				<div class="form-group row col-md-12 text-center">
					<!-- <label class="col-sm-4 col-form-label">檔案位址</label> -->
					<div class="col-sm-12 fineTuneInput hiddenArea" id="inputOther">
					  <input type="text" class="form-control" id="" placeholder="檔案位址，如：http://">
					</div>
				</div>
			</div>
		  </div>
	  </div>
	</div>
  </div>
  <br>
  <div class="row">
    <div class="text-center col-md-11" id="publicationDetail"><!--col-sm-12 text-center-->
      <h5>出版品基本資料</h5>
      <div class="form-group row"><!--class="text-center form-control"form-group row-->
		<label class="col-sm-4 col-form-label">書籍名稱</label>
			<div class="col-sm-8">
				<input type="text" class="form-control fineTuneTopInput" id="" placeholder="">
			</div>
			<label class="col-sm-4 col-form-label">作者/編者</label>
			<div class="col-sm-8">
				<input type="text" class="form-control fineTuneTopInput" id="">
			</div>
			<label class="col-sm-4 col-form-label">出版年月</label>
			<div class="col-sm-8">
				<input type="text" class="form-control fineTuneTopInput" id="datepicker">
			</div> 
		    <label class="col-sm-4 col-form-label">出版地</label>
			<div class="col-sm-8">
				<input type="text" class="form-control fineTuneTopInput" id="">
			</div>
		    <label class="col-sm-4 col-form-label">ISBN</label>
			<div class="col-sm-8">
				<input type="text" class="form-control fineTuneTopInput" id="">
			</div>
	  </div>
    </div>
      <br>
  </div>
  <br>
  <div class="row">
    <div class="text-center col-md-12">
	  <div class="row col-md-12">
		  <div class="text-center form-control">
		  <h5>是否授權</h5>
		    <label class="checkarea">是
			<input type="radio" checked="checked" name="radio">
			<span class="checkradio"></span>
			</label>
			  <div class="form-group row">
				<label class="col-sm-3 col-form-label">費用(新臺幣)</label>
				<div class="col-sm-8">
				  	<div class="input-group number-spinner">
						<span class="input-group-btn">
							<button class="btn btn-default" data-dir="dwn"><strong>-</strong></button>
						</span>
						<input type="text" class="form-control text-center" value="0">
						<span class="input-group-btn">
							<button class="btn btn-default" data-dir="up"><strong>+</strong></button>
						</span>
					</div>
				</div>
			  </div>
			<label class="checkarea">否
			  <input type="radio" name="radio">
			  <span class="checkradio"></span>
			</label>
		  </div>
	  </div>
    </div>
  </div>

  <div>
	<div class="text-center col-md-12">
		<h4>類型</h4>
		<div class="row">
			<div class="col-md-12 row">
				<div class="col-md-4">
					<label class="checkarea">食
					  <input type="checkbox">
					  <span class="checkmark"></span>
					</label>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">魚乾
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-8 row">
							<div class="col-sm-6">
								<label class="checkarea">臭肉魚乾
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">象魚乾
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">石鮔乾
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">菜乾
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-8 row">
							<div class="col-sm-6">
								<label class="checkarea">高麗菜乾
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">高麗菜酸
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">花菜乾
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">酸瓜
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">海菜/紫菜
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">產物
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-8 row">
							<div class="col-sm-6">
								<label class="checkarea">番薯
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">花生
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">高粱
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">海產
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-8 row">
							<div class="col-sm-6">
								<label class="checkarea">春
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">夏
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">秋
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">冬
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">庶民小吃
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
							<label class="checkarea">節慶民俗食物
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-8 row">
							<div class="col-sm-6">
								<label class="checkarea">炸棗
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">菜繭
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">雞母狗
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">家禽家畜
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-sm-6">
								<label class="checkarea">餐廳
								  <input type="checkbox">
								  <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 row">
				<div class="col-md-4">
					<label class="checkarea">衣
					  <input type="checkbox">
					  <span class="checkmark"></span>
					</label>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6">
							<label class="checkarea">蒙面女郎
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-6">
							<label class="checkarea">草鞋
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 row">
				<div class="col-md-4">
					<label class="checkarea">住
					  <input type="checkbox">
					  <span class="checkmark"></span>
					</label>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">傳統民宅
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">日據洋樓
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">現代建築
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-8">
							<label class="checkarea">官方歷史建物
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">砲台
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">眷村
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">古蹟
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">菜宅
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">石滬
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">抱礅
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">聚落
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">燈塔
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 row">
				<div class="col-md-4">
					<label class="checkarea">行
					  <input type="checkbox">
					  <span class="checkmark"></span>
					</label>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">舢舨
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">漁船
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">離阿甲
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">牛車
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">碼頭
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">漁港
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">橋梁
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">車站
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">機場
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 row">
				<div class="col-md-4">
					<label class="checkarea">育
					  <input type="checkbox">
					  <span class="checkmark"></span>
					</label>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">各級學校
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">書院
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">武轎
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-8">
							<label class="checkarea">涼傘等各類才藝協會
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">畫會
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">詩社
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">球類
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 row">
				<div class="col-md-4">
					<label class="checkarea">樂
					  <input type="checkbox">
					  <span class="checkmark"></span>
					</label>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-4">
							<label class="checkarea">廟會
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">景點
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">名勝
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">軍中樂園
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">澡堂
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">戲院
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">夜市
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">童玩
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">賭博
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">飲宴
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">婚喪喜慶
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<div class="col-md-4">
							<label class="checkarea">褒歌
								<input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
<hr>
  <div class="row">
    <div class="col-sm-12 text-center">
      <h5>標籤</h5>
      <div class="form-group row">
		<label class="col-sm-12 col-form-label">為您的作品定義一些標籤</label>
		<div class="col-sm-12">
			<textarea class="form-control" placeholder="#石滬#澎湖"></textarea>
		</div>
	  </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12 text-center">
      <button type="submit" value="Upload" class="btn btn-info btn-sm">發布</button>
      <!-- <button type="button" class="btn btn-success btn-sm"></button> -->
    </div>
  </div>
</div>
</form>
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
<script src="/resources/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/frontEnd.js"></script>
</body>
</html>
