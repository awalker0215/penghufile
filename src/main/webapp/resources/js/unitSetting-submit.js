function checkData() {
		var unitname = document.getElementById("unitname").value;
		var unityear = document.getElementById("unityear").value;
		var unitresponse = document.getElementById("unitresponse").value;
		var unitphone = document.getElementById("unitphone").value;
		var unitaddress = document.getElementById("unitaddress").value;
		var uniturl = document.getElementById("uniturl").value;
		var urlformat = "http";
		
		if(unitname == "") {
			alert("請輸入單位名稱!");
			document.insertForm.unitname.focus();
			return false;
		}
		else if(isNaN(unitname) == false) {
			alert("單位名稱格式錯誤");
			document.insertForm.unitname.focus();
			return false;
		}
		
		if(unityear == "") {
			alert("請輸入設立年代!");
			document.insertForm.unityear.focus();
			return false;
		}
		else if(unityear.length >= 5 || isNaN(unityear) == true) {
			alert("設立年代格式錯誤");
			document.insertForm.unityear.focus();
			return false;
		}
		
		if(unitresponse == "") {
			alert("請輸入負責人名稱!");
			document.insertForm.unitresponse.focus();
			return false;
		}
		else if(isNaN(unitresponse) == false) {
			alert("負責人名稱格式錯誤");
			document.insertForm.unitresponse.focus();
			return false;
		}
		
		if(unitphone == "") {
			alert("請輸入連絡電話!");
			document.insertForm.unitphone.focus();
			return false;
		}
		else if(/*isNaN(unitphone) == true ||  */unitphone.length >= 15/* || unitphone.length >= 21*/) {
			alert("連絡電話格式錯誤");
			document.insertForm.unitphone.focus();
			return false;
		}
		
		if(unitaddress == "") {
			alert("請輸入單位地址!");
			document.insertForm.unitaddress.focus();
			return false;
		}
		else if(isNaN(unitaddress) == false) {
			alert("單位地址格式錯誤！");
			document.insertForm.unitaddress.focus();
			return false;
		}

		if(uniturl == "") {
			alert("請輸入單位網址!");
			document.insertForm.uniturl.focus();
			return false;
		}
		else {
			var temp = uniturl.substring(0, 4);
			if(urlformat != temp || isNaN(uniturl) == false) {
				alert("單位網址格式錯誤！");
				document.insertForm.uniturl.focus();
				return false;
			}
		}
		
		
		return true;
	}