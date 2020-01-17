function spaceChk(elem){
	if(elem.val().replace(/\s/g, "")==""){
		alert("공백은 입력할 수 없습니다.");
		elem.val("");
		elem.focus();

		return true;
	}

	return false;
}

function expChk(elem, exp, str){
	if(!exp.test(elem.val())){
		alert(str + "해주세요.");
		elem.val("");
		elem.focus();
		
		return true;
	}

	return false;
}

$(function(){
	// 인증번호 생성
	var certification = Math.floor(Math.random() * 100000);
	
	// 정규식 생성
	var idExp = /[a-zA-Z]+[\w]{5,11}/;
	var pwExp = /[\w_!@#$%^&*+/=?'{}|~`-]{8,12}/;
	var nameExp = /[가-힣a-zA-Z]/g;
	var emailExp = /^[\w]+@[\w.]+$/;
	var phoneExp = /\d/g;
	
	// 인증여부 생성
	var submitChk = false;
	
	// 전송 유효성 검사
	$("#send").click(function(){
		// 아이디 유효성
		if(spaceChk($("#id")) || expChk($("#id"), idExp, "조건에 맞는 아이디를 입력")){
			return;
		}
		
		// 비밀번호 유효성
		if(spaceChk($("#pw")) || expChk($("#pw"), pwExp, "조건에 맞는 비밀번호를 입력")){
			return;
		}
		
		// 비밀번호 확인 유효성
		if($("#pw").val() != $("#pwChk").val()){
			alert("입력한 비밀번호와 다릅니다. 다시 입력해주세요.");
			$("#pwChk").val("");
			$("#pwChk").focus();
			
			return;
		}
		
		// 이름 유효성
		if(spaceChk($("#name")) || expChk($("#name"), nameExp, "이름을 입력")){
			return;
		}
		
		// 성별 유효성
		if(!$("input[name='gender']").is(":checked")){
			alert("성별을 선택해주세요.");
			$("input[name='gender']:eq(0)").focus();
			
			return;
		}
		
		// 생일 유효성
		if($("#birth").val() == ""){
			alert("생일을 입력해주세요.");
			$("#birth").focus();
			
			return;
		}
		
		// 이메일 유효성
		if(spaceChk($("#email")) || expChk($("#email"), emailExp, "이메일을 입력")){
			return;
		}
		
		// 전송 버튼 유효성
		if(!submitChk){
			alert("인증을 진행해주세요.");
		}else{
			$("#dataForm").attr({
				"method" : "post",
				"action" : "/scriptTag/jsp/member.jsp"
			});
			
			$("#dataForm").submit();
		}
	});
	
	// 휴대전화 번호 유효성
	$("#btnCertify").click(function(){
		if(spaceChk($("#phone")) || expChk($("#phone"), phoneExp, "번호를 입력")){
			return;
		}
		
		$("#certification").val(certification);
	});

	// 인증 유효성
	$("#btnCheck").click(function(){
		if($("#certification").val() == certification){
			alert("인증되었습니다.");
		}else{
			alert("인증을 진행해주세요.")
		}
		
		submitChk = true;
	});
	
})