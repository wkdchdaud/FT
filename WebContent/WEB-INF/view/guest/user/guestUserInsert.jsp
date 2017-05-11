<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="euc-kr">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">

<script type="text/javascript">
	var idExists = "1"; //ID중복체크 실행여부(1: 중복체크 실행안함 / 2: 아이디 중복 / 3: 통과)
	function doAction() {

		//*f는 form 태그 안의 id임*//
		//자바스크립트는 조건문에 연산자 있는거까지 실행됨
		var total = 0;
		var f = document.getElementById("f");
		var max = document.f.ckbox.length;
		if (f.user_id.value == "") {
			alert("아이디를 입력하시길 바랍니다");
			f.user_id.focus();
			return false;
		}
		

		if (idExists == "1") {
			alert("아이디를 중복체크를 실행하시길 바랍니다.");
			f.user_id.focus();
			return false;

		} else if (idExists == "2") {
			alert("아이디가 중복되었습니다. 중복되지 않은 아이디를 입력하시길 바랍니다.");
			f.user_id.focus();
			return false;
		}

		if (f.password.value == "") {
			alert("비밀번호를 입력하시길 바랍니다");
			f.password.focus();
			return false;
		}

		
		if (f.checkpassword.value == "") {
			alert("비밀번호를 한번 더 입력하시길 바랍니다");
			f.checkpassword.focus();
			return false;
		}

		
		if (f.password.value != f.checkpassword.value) {
			alert("비밀번호가 서로 일치하지 않습니다");
			f.password.focus();
			return false;
		}
		
		if (f.user_name.value == "") {
			alert("이름을 입력하시길 바랍니다");
			f.user_name.focus();
			return false;
		}

		if (f.birthday.value == "") {
			alert("생년월일을 입력하시길 바랍니다");
			f.birthday.focus();
			return false;
		}
		

		if (f.birthday.value.length < 6) {
			alert("생년월일을 모두 입력하시길 바랍니다");
			f.birthday.focus();
			return false;
		}
		if (f.birthday.value.substr(2,2) < 1 || f.birthday.value.substr(2,2) > 12) { // check month range
			 alert("1~12월 사이로 써주시길 바랍니다");
			 return false;
		}

		if (f.birthday.value.substr(4,2) < 1 || f.birthday.value.substr(4,2) > 31) {
 			alert("1~31일 사이로 써주시길 바랍니다");
 			return false;
		}

 		if ((f.birthday.value.substr(2,2)==4 
			|| f.birthday.value.substr(2,2)==6 
			|| f.birthday.value.substr(2,2)==9 
			|| f.birthday.value.substr(2,2)==11) 
			&& f.birthday.value.substr(4,2)==31) {
 			if(f.birthday.value.substr(2,2)==11){
 				alert(f.birthday.value.substr(2,2)+" 월은 31일이 없습니다");
 			}else{
 				alert(f.birthday.value.substr(3,1)+" 월은 31일이 없습니다");
 			}
 			return false
 		}

 		if (f.birthday.value.substr(2,2) == 2) { // check for february 29th
 			var isleap = (f.birthday.value.substr(0,2) % 4 == 0 
 					&& (f.birthday.value.substr(0,2) % 100 != 0 
 					|| f.birthday.value.substr(0,2) % 400 == 0));
 			if (f.birthday.value.substr(4,2)>29 
 					|| (f.birthday.value.substr(4,2)==29 && !isleap)) {
 			alert("2월은" 
 				+ f.birthday.value.substr(4,2) 
 				+ "이 없습니다");
 			return false;
 			}
 		}
		if (f.email1.value == "") {
			alert("이메일을 입력하시길 바랍니다");
			f.email1.focus();
			return false;
		}
		
		if (f.email2.value == "") {
			alert("이메일을 입력하시길 바랍니다");
			f.email2.focus();
			return false;
		}

		
		if (f.tel_2.value == "") {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_2.focus();
			return false;
		}

		if (f.tel_2.value.length != 4) {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_2.focus();
			return false;
		}
		
		
		
		if (f.tel_3.value == "") {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_3.focus();
			return false;
		}
		
		if (f.tel_3.value.length != 4) {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_3.focus();
			return false;
		}
		
		
		for (var idx = 0; idx < max; idx++) {
			if (eval("document.f.ckbox[" + idx + "].checked") == true) {
				total += 1;
			}
		}
		if (total == 2) {
			document.f.submit();
		} else {
			alert("회원약관과 개인정보약관에 동의하시길바랍니다");
			return false;
		}
		//뜨는 멘트가 똑같으면 나중에 화남(왜냐하면 뭐가 틀린지 모르니)
		//f.target = "ifrProc";
	}
	// 길이
	function check(obj_name,max_length) {
		var str = obj_name;
		   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
		   var li_str_len = ls_str.length;  // 전체길이
		   // 변수초기화
		   var li_max      = max_length; // 제한할 글자수 크기
		   var i           = 0;  // for문에 사용
		   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
		   var li_len      = 0;  // substring하기 위해서 사용
		   var ls_one_char = ""; // 한글자씩 검사한다
		   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
		var blank = /[\s]/gi;
		if (blank.test(str.value) == true) {
			alert('공백은 사용할 수 없습니다');
			str.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(str.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			str.value = "";
			return false;
		}
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(str.value) == true) {
			alert('한글은 사용이 불가능합니다');
			str.value = "";
			return false;
		}
		for(i=0; i< li_str_len; i++)
		   {
		      // 한글자추출
		      ls_one_char = ls_str.charAt(i);
		      // 한글이면 2를 더한다.
		      if (escape(ls_one_char).length > 4)
		      {
		         li_byte = li_byte+2;
		      }
		      // 그외의 경우는 1을 더한다.
		      else
		      {
		         li_byte++;
		      }
		      // 전체 크기가 li_max를 넘지않으면
		      if(li_byte <= li_max)
		      {
		         li_len = i + 1;
		      }
		   }   
		   
		   // 전체길이를 초과하면
		   if(li_byte > li_max)
		   {
		      alert( li_max + " Bytes를 초과 입력할수 없습니다.");
		      ls_str2 = ls_str.substr(0, li_len);
		      obj_name.value = ls_str2; 
		   }
		   obj_name.focus(); 
	}
	function namecheck(obj_name,max_length)
	{
		
		var name = obj_name;
	   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
	   var li_str_len = ls_str.length;  // 전체길이
	   // 변수초기화
	   var li_max      = max_length; // 제한할 글자수 크기
	   var i           = 0;  // for문에 사용
	   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
	   var li_len      = 0;  // substring하기 위해서 사용
	   var ls_one_char = ""; // 한글자씩 검사한다
	   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
	   
	   var blank = /[\s]/gi;
		if (blank.test(name.value) == true) {
			alert('공백은 사용할 수 없습니다');
			name.value = "";
			return false;
		}
	
		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(name.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			name.value = "";
			return false;
		}
 		var num_regx=/\d/gi; //\d은 [0-9]와 같음
 		if(num_regx.test(name.value) == true) {
 			alert('숫자는 사용이 불가능합니다');
 			name.value = "";
 			return false;
 		}
	   
	   for(i=0; i< li_str_len; i++)
	   {
	      // 한글자추출
	      ls_one_char = ls_str.charAt(i);
	      // 한글이면 2를 더한다.
	      if (escape(ls_one_char).length > 4)
	      {
	         li_byte = li_byte+2;
	      }
	      // 그외의 경우는 1을 더한다.
	      else
	      {
	         li_byte++;
	      }
	      // 전체 크기가 li_max를 넘지않으면
	      if(li_byte <= li_max)
	      {
	         li_len = i + 1;
	      }
	   }   
	   
	   // 전체길이를 초과하면
	   if(li_byte > li_max)
	   {
	      alert( li_max + " Bytes를 초과 입력할수 없습니다.");
	      ls_str2 = ls_str.substr(0, li_len);
	      obj_name.value = ls_str2; 
	   }
	   obj_name.focus();   
	}

	function emailcheck(obj_name,max_length) {
		var email1 = obj_name;
		   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
		   var li_str_len = ls_str.length;  // 전체길이
		   // 변수초기화
		   var li_max      = max_length; // 제한할 글자수 크기
		   var i           = 0;  // for문에 사용
		   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
		   var li_len      = 0;  // substring하기 위해서 사용
		   var ls_one_char = ""; // 한글자씩 검사한다
		   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
		var blank = /[\s]/gi;
		if (blank.test(email1.value) == true) {
			alert('공백은 사용할 수 없습니다');
			email1.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(email1.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			email1.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(email1.value) == true) {
			alert('한글은 사용이 불가능합니다');
			email1.value = "";
			return;
		}
		for(i=0; i< li_str_len; i++)
		   {
		      // 한글자추출
		      ls_one_char = ls_str.charAt(i);
		      // 한글이면 2를 더한다.
		      if (escape(ls_one_char).length > 4)
		      {
		         li_byte = li_byte+2;
		      }
		      // 그외의 경우는 1을 더한다.
		      else
		      {
		         li_byte++;
		      }
		      // 전체 크기가 li_max를 넘지않으면
		      if(li_byte <= li_max)
		      {
		         li_len = i + 1;
		      }
		   }   
		   
		   // 전체길이를 초과하면
		   if(li_byte > li_max)
		   {
		      alert( li_max + " Bytes를 초과 입력할수 없습니다.");
		      ls_str2 = ls_str.substr(0, li_len);
		      obj_name.value = ls_str2; 
		   }
		   obj_name.focus(); 
	}
	
	function email2check(obj_name,max_length) {
		var email2 = obj_name;
		   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
		   var li_str_len = ls_str.length;  // 전체길이
		   // 변수초기화
		   var li_max      = max_length; // 제한할 글자수 크기
		   var i           = 0;  // for문에 사용
		   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
		   var li_len      = 0;  // substring하기 위해서 사용
		   var ls_one_char = ""; // 한글자씩 검사한다
		   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
		
		var blank = /[\s]/gi;
		if (blank.test(email2.value) == true) {
			alert('공백은 사용할 수 없습니다');
			email2.value = "";
			return false;
		}

		var special = /[`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(email2.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			email2.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(email2.value) == true) {
			alert('한글은 사용이 불가능합니다');
			email2.value = "";
			return;
		}
		
		var number =/[0-9]/gi;
		if (number.test(email2.value) == true) {
			alert('숫자는 사용이 불가능합니다');
			email2.value = "";
			return;
		}
		for(i=0; i< li_str_len; i++)
		   {
		      // 한글자추출
		      ls_one_char = ls_str.charAt(i);
		      // 한글이면 2를 더한다.
		      if (escape(ls_one_char).length > 4)
		      {
		         li_byte = li_byte+2;
		      }
		      // 그외의 경우는 1을 더한다.
		      else
		      {
		         li_byte++;
		      }
		      // 전체 크기가 li_max를 넘지않으면
		      if(li_byte <= li_max)
		      {
		         li_len = i + 1;
		      }
		   }   
		   
		   // 전체길이를 초과하면
		   if(li_byte > li_max)
		   {
		      alert( li_max + " Bytes를 초과 입력할수 없습니다.");
		      ls_str2 = ls_str.substr(0, li_len);
		      obj_name.value = ls_str2; 
		   }
		   obj_name.focus(); 
		
	}
	
	function birth() {
		var birthday = document.getElementById('birthday');
		
		if(birthday.value.length > 6 ) {
 			alert('생년월일은 6자리수보다 클 수 없습니다');
 			birthday.value = "";
 			return false;
 		}
		
		var blank = /[\s]/gi;
		if (blank.test(birthday.value) == true) {
			alert('공백은 사용할 수 없습니다');
			birthday.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(birthday.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			birthday.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(birthday.value) == true) {
			alert('한글은 사용이 불가능합니다');
			birthday.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(birthday.value) == true) {
			alert('영어는 사용이 불가능합니다');
			birthday.value = "";
			return;
		}

	}
	
	function tel2() {
		var tel_2 = document.getElementById('tel_2');
		
 		if(tel_2.value.length > 4 ) {
 			alert('전화번호는 4자리수보다 클 수 없습니다');
 			tel_2.value = "";
 			return false;
 		}
		var blank = /[\s]/gi;
		if (blank.test(tel_2.value) == true) {
			alert('공백은 사용할 수 없습니다');
			tel_2.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(tel_2.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			tel_2.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(tel_2.value) == true) {
			alert('한글은 사용이 불가능합니다');
			tel_2.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(tel_2.value) == true) {
			alert('영어는 사용이 불가능합니다');
			tel_2.value = "";
			return;
		}
	}
	
	function tel3() {
		var tel_3 = document.getElementById('tel_3');
		
 		if(tel_3.value.length > 4 ) {
 			alert('전화번호는 4자리수보다 클 수 없습니다');
 			tel_3.value = "";
 			return false;
 		}
		var blank = /[\s]/gi;
		if (blank.test(tel_3.value) == true) {
			alert('공백은 사용할 수 없습니다');
			tel_3.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(tel_3.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			tel_3.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(tel_3.value) == true) {
			alert('한글은 사용이 불가능합니다');
			tel_3.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(tel_3.value) == true) {
			alert('영어는 사용이 불가능합니다');
			tel_3.value = "";
			return;
		}
		
	}
	
	function passwordcheck(obj_name,max_length)
	{
		
		var password = obj_name;
	   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
	   var li_str_len = ls_str.length;  // 전체길이
	   // 변수초기화
	   var li_max      = max_length; // 제한할 글자수 크기
	   var i           = 0;  // for문에 사용
	   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
	   var li_len      = 0;  // substring하기 위해서 사용
	   var ls_one_char = ""; // 한글자씩 검사한다
	   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
	   
	   
	   var blank = /[\s]/gi;
		if (blank.test(password.value) == true) {
			alert('공백은 사용할 수 없습니다');
			password.value = "";
			return false;
		}
	
	   
	   for(i=0; i< li_str_len; i++)
	   {
	      // 한글자추출
	      ls_one_char = ls_str.charAt(i);
	      // 한글이면 2를 더한다.
	      if (escape(ls_one_char).length > 4)
	      {
	         li_byte = li_byte+2;
	      }
	      // 그외의 경우는 1을 더한다.
	      else
	      {
	         li_byte++;
	      }
	      // 전체 크기가 li_max를 넘지않으면
	      if(li_byte <= li_max)
	      {
	         li_len = i + 1;
	      }
	   }   
	   
	   // 전체길이를 초과하면
	   if(li_byte > li_max)
	   {
	      alert( li_max + " Bytes를 초과 입력할수 없습니다.");
	      ls_str2 = ls_str.substr(0, li_len);
	      obj_name.value = ls_str2; 
	   }
	   obj_name.focus();   
	}
	
	function checkpasswordcheck(obj_name,max_length)
	{
		
		var checkpassword = obj_name;
	   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
	   var li_str_len = ls_str.length;  // 전체길이
	   // 변수초기화
	   var li_max      = max_length; // 제한할 글자수 크기
	   var i           = 0;  // for문에 사용
	   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
	   var li_len      = 0;  // substring하기 위해서 사용
	   var ls_one_char = ""; // 한글자씩 검사한다
	   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
	   
	   
	   var blank = /[\s]/gi;
		if (blank.test(checkpassword.value) == true) {
			alert('공백은 사용할 수 없습니다');
			checkpassword.value = "";
			return false;
		}
	
	   
	   for(i=0; i< li_str_len; i++)
	   {
	      // 한글자추출
	      ls_one_char = ls_str.charAt(i);
	      // 한글이면 2를 더한다.
	      if (escape(ls_one_char).length > 4)
	      {
	         li_byte = li_byte+2;
	      }
	      // 그외의 경우는 1을 더한다.
	      else
	      {
	         li_byte++;
	      }
	      // 전체 크기가 li_max를 넘지않으면
	      if(li_byte <= li_max)
	      {
	         li_len = i + 1;
	      }
	   }   
	   
	   // 전체길이를 초과하면
	   if(li_byte > li_max)
	   {
	      alert( li_max + " Bytes를 초과 입력할수 없습니다.");
	      ls_str2 = ls_str.substr(0, li_len);
	      obj_name.value = ls_str2; 
	   }
	   obj_name.focus();   
	}

	function cal_length(val)
	{
	  // 입력받은 문자열을 escape() 를 이용하여 변환한다.
	  // 변환한 문자열 중 유니코드(한글 등)는 공통적으로 %uxxxx로 변환된다.
	  var temp_estr = escape(val);
	  var s_index   = 0;
	  var e_index   = 0;
	  var temp_str  = "";
	  var cnt       = 0;

	  // 문자열 중에서 유니코드를 찾아 제거하면서 갯수를 센다.
	  while ((e_index = temp_estr.indexOf("%u", s_index)) >= 0)  // 제거할 문자열이 존재한다면
	  {
	    temp_str += temp_estr.substring(s_index, e_index);
	    s_index = e_index + 6;
	    cnt ++;
	  }

	  temp_str += temp_estr.substring(s_index);

	  temp_str = unescape(temp_str);  // 원래 문자열로 바꾼다.

	  // 유니코드는 2바이트 씩 계산하고 나머지는 1바이트씩 계산한다.
	  return ((cnt * 2) + temp_str.length) + "";
	}
	


	//이메일 변경시 값 가져오기(폼객체, 선택한 이메일 값)
 	function doChangeEmail(f, val) {

 		//직접 입력을 선택하였다면, 기존 입력된 값을 지운다.
 		if (val == "etc") {
			f.email2.value = "";
			f.email2.focus();
			f.email2.readOnly = false;

			f.email2.style.backgroundColor = "";

			//그렇지 않으면, 선택된 값을 입력 받도록 한다.
 		} else {
 			f.email2.value = val;
 			f.email2.readOnly = true;
 		}

 	}
	// 길이

	//ajax 호출
	function xmlHttpPost(actionUrl, submitParameter, resultFunction) {
		var xmlHttpRequest = false;

		//IE인경우
		if (window.ActiveXObject) {
			xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
		} else {
			xmlHttpRequest = new XMLHttpRequest();
			xmlHttpRequest.overrideMimeType('text/xml');
		}

		xmlHttpRequest.open('POST', actionUrl, true);
		xmlHttpRequest.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xmlHttpRequest.onreadystatechange = function() {
			if (xmlHttpRequest.readyState == 4) {
				switch (xmlHttpRequest.status) {
				case 404:
					alert('오류: ' + actionUrl + '이 존재하지 않음');
					break;
				case 500:
					alert('오류: ' + xmlHttpRequest.responseText);
					break;
				default:
					eval(resultFunction + '(xmlHttpRequest.responseText);');
					break;
				}
			}
		}

		xmlHttpRequest.send(submitParameter);
	}

	//결과보여주기
	function viewResult(result) {
		//아이디가 중복되지 않았다면... 
		if (result.replace(/^\s*|\s*$/g, "") == "S") {
			alert("사용가능한 아이디입니다.");
			f.user_id.readOnly = true;
			idExists = 3;

			//아이디가 중복되었다면.....
		} else {
			alert("아이디가 중복되었습니다. 중복되지 않은 아이디를 입력하시길 바랍니다.");
			idExists = 2;

		}
	}

	//아이디 중복체크 버튼 눌렀을때 실행
	function doIdCheck() {

		var f = document.getElementById("f");

		if (f.user_id.value == "") {
			alert("아이디를 입력하시길 바랍니다.");
			f.user_id.focus();
			return;
		}

		var actionUrl = "/user/UserDupInfo.do" //호출 url 
		var submitParameter = "user_id=" + f.user_id.value; //전달값
		var resultFunction = "viewResult"; //실행후 실행할 함수명

		xmlHttpPost(actionUrl, submitParameter, resultFunction);
	}
</script>
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
		<!-- S: CONTENT -->
		<!-- join -->
		<form name="f" id="f" method="post" action="busiUserInsert.do" onsubmit="doAction()">
			<div class="content" style="display: block;">
				<div class="content_wrapper">
					<header>
						<span>회원가입</span>
					</header>
					<div class="section">
						<!-- group -->
						<div class="group">
							<div class="input_row id_check">
								<span class="input_box"> <label class="lbl">아이디</label> <input
									type="text" id="user_id" name="user_id" placeholder="아이디"
									class="input_email" style="width: 250px" 
									onkeydown="check(this,20)" maxlength="20" />
								</span>
							</div>
							<input type="button" title="중복확인" value="중복확인" class="btn_small check" onclick="javascript:doIdCheck()">
							
						</div>
						<!-- group -->
						<div class="input_row">
							<span class="input_box"> <label class="lbl">비밀번호</label> <input
								type="password" name="password" id="password" placeholder="비밀번호"
								class="input_area" onkeydown="passwordcheck(this,20)" maxlength="20">
								<h4>비밀번호는 최대 20자이며 대소문자 구별합니다</h4>
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">비밀번호
									확인</label> <input type="password" name="checkpassword"
								id="checkpassword"  placeholder="비밀번호 확인"
								class="input_area" style="width: 250px" onkeydown="checkpasswordcheck(this,20)" maxlength="20">
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">이름</label> <input
								type="text" name="user_name" id="user_name" style="width: 250px" 
								placeholder="이름" class="input_area" value="" onkeydown="namecheck(this,20)" maxlength="20">
							</span>
						</div>
						<div class="input_row" align="left">
							<span class="input_box" > <label class="lbl">생년월일 ex)1998년 2월 14일생이면 980214</label> <input
								type="text" placeholder="생년월일  ex)1998년 2월 14일생이면 980214" class="input_area" value=""
								 name="birthday" id="birthday" onkeydown="birth()" maxlength="6">
							</span>
						</div>
						<!-- group -->
						<div class="group">
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">이메일</label><input
									type="text" name="email1" id="email1"  placeholder="이메일"
									class="input_phone" value="" onkeydown="emailcheck(this,20)" maxlength="20">
								</span>
							</div>
							<label class='dash'> @ </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl"></label> <input
									type="text" name="email2" id="email2"  placeholder=""
									class="input_phone" onkeydown="email2check(this,20)" value="" maxlength="20">
								</span>
							</div>
							<label class='dash'> </label>
							<div class="input_select phone"> 
 								<select name="email3" onchange="doChangeEmail(this.form, this.value)"
									> 
								<option value="etc">직접입력</option> 
									<option value="naver.com">naver.com</option> 
 									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="empal.com">empal.com</option> 
									<option value="hanafos.com">hanafos.com</option> 
									<option value="hotmail.com">hotmail.com</option> 
									<option value="gmail.com">gmail.com</option> 
									<option value="paran.com">paran.com</option> 
									<option value="korea.com">korea.com</option> 
 									<option value="freechal.com">freechal.com</option> 
								</select> 
 							</div> 
						</div>
						<!-- group -->
						<!-- group -->
						<div class="group">
							<div class="input_select phone clear">
								<select name="tel_1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<label class='dash'> - </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">전화번호</label>
									<input onkeydown="tel2()" type="text" placeholder="전화번호" class="input_phone"
									value="" name="tel_2" id="tel_2"  onkeydown="tel2()" maxlength="4"
									>
								</span>
							</div>
							<label class='dash'> - </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">전화번호</label>
									<input type="text" placeholder="" class="input_phone"
									value="" name="tel_3" id="tel_3" maxlength="4"
									onkeydown="tel3()">
								</span>
							</div>
						</div>
						<!-- group -->
					</div>
				</div>
			</div>

			<div class="content" style="display: block;">
				<div class="content_wrapper">
					<header>
						<span>약관동의</span>
					</header>
					<div class="article">
						<li class="sections__section"><h3 class="article_title">제1조(목적)</h3>
							이 약관은 라오푸드트럭(푸드트럭 사업자)가 운영하는 라오푸드트럭(이하 “FT”이라 한다)에서 제공하는 인터넷 관련
							서비스(이하 “서비스”라 한다)를 이용함에 있어 라오푸드트럭과 이용자의 권리ㆍ의무 및 책임사항을 규정함을 목적으로
							합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」</li> <br />
						<li class="sections__section"><h3 class="article_title">제2조(정의)</h3>
							①“FT” 이란 라오푸드트럭가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등
							정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버FT을 운영하는
							사업자의 의미로도 사용합니다. <br /> <br />②“이용자”란 “FT”에 접속하여 이 약관에 따라 “FT”이
							제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br /> <br />③ ‘회원’이라 함은 “FT”에
							개인정보를 제공하여 회원등록을 한 자로서, “FT”의 정보를 지속적으로 제공받으며, “FT”이 제공하는 서비스를
							계속적으로 이용할 수 있는 자를 말합니다. <br /> <br />④ ‘비회원’이라 함은 회원에 가입하지 않고
							“FT”이 제공하는 서비스를 이용하는 자를 말합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제3조
								(약관등의 명시와 설명 및 개정)</h3> ① “FT”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지
							주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호,
							통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 카페홀릭 사이버FT의 초기 서비스화면(전면)에
							게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. <br /> <br />②
							“FT은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은
							중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야
							합니다. <br /> <br />③ “FT”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률,
							전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지
							않는 범위에서 이 약관을 개정할 수 있습니다. <br /> <br />④ “FT”이 약관을 개정할 경우에는
							적용일자 및 개정사유를 명시하여 현행약관과 함께 FT의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지
							공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고
							공지합니다. 이 경우 FT“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br />
							<br />⑤ “FT”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그
							이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관
							조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘FT“에 송신하여 ”FT“의 동의를 받은
							경우에는 개정약관 조항이 적용됩니다. <br /> <br />⑥ 이 약관에서 정하지 아니한 사항과 이 약관의
							해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는
							전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제4조(서비스의
								제공 및 변경)</h3> ① “FT”은 다음과 같은 업무를 수행합니다. 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의
							체결 2. 구매계약이 체결된 재화 또는 용역의 배송 3. 기타 “FT”이 정하는 업무<br /> <br />②“FT”은
							재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의
							내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는
							용역의 내용을 게시한 곳에 즉시 공지합니다. <br /> <br />③“FT”이 제공하기로 이용자와 계약을 체결한
							서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한
							주소로 즉시 통지합니다. ④전항의 경우 “FT”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “FT”이
							고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제5조(서비스의
								중단)</h3> ① “FT”은 컴퓨터 등 정보통신설비의 보수점검ㆍ교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는
							서비스의 제공을 일시적으로 중단할 수 있습니다. <br /> <br />②“FT”은 제1항의 사유로 서비스의
							제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “FT”이 고의 또는
							과실이 없음을 입증하는 경우에는 그러하지 아니합니다. <br /> <br />③사업종목의 전환, 사업의 포기,
							업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “FT”은 제8조에 정한 방법으로 이용자에게
							통지하고 당초 “FT”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “FT”이 보상기준 등을 고지하지 아니한
							경우에는 이용자들의 마일리지 또는 적립금 등을 “FT”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게
							지급합니다.</li> <br />


						<li class="sections__section"><h3 class="article_title">제6조(회원가입)</h3>
							① 이용자는 “FT”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서
							회원가입을 신청합니다. <br /> <br />② “FT”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중
							다음 각호에 해당하지 않는 한 회원으로 등록합니다. 1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을
							상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 “FT”의 회원재가입 승낙을
							얻은 경우에는 예외로 한다. 2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 3. 기타 회원으로 등록하는 것이
							“FT”의 기술상 현저히 지장이 있다고 판단되는 경우 <br /> <br />③ 회원가입계약의 성립시기는
							“FT”의 승낙이 회원에게 도달한 시점으로 합니다. ④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우,
							즉시 전자우편 기타 방법으로 “FT”에 대하여 그 변경사항을 알려야 합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제7조(회원
								탈퇴 및 자격 상실 등)</h3> ① 회원은 “FT”에 언제든지 탈퇴를 요청할 수 있으며 “FT”은 즉시 회원탈퇴를
							처리합니다. <br /> <br />② 회원이 다음 각호의 사유에 해당하는 경우, “FT”은 회원자격을 제한 및
							정지시킬 수 있습니다. 1. 가입 신청시에 허위 내용을 등록한 경우 2. “FT”을 이용하여 구입한 재화등의 대금,
							기타 “FT”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 3. 다른 사람의 “FT” 이용을
							방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우 4. “FT”을 이용하여 법령 또는 이 약관이
							금지하거나 공서양속에 반하는 행위를 하는 경우 <br /> <br />③ “FT”이 회원 자격을 제한ㆍ정지
							시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 “FT”은 회원자격을
							상실시킬 수 있습니다. <br /> <br />④ “FT”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다.
							이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제8조(회원에
								대한 통지)</h3> ① “FT”이 회원에 대한 통지를 하는 경우, 회원이 “FT”과 미리 약정하여 지정한 전자우편 주소로
							할 수 있습니다. <br /> <br />② “FT”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “FT”
							게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는
							사항에 대하여는 개별통지를 합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제9조(구매신청)</h3>
							“FT”이용자는 “FT”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “FT”은 이용자가 구매신청을
							함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수
							있습니다. 1. 재화등의 검색 및 선택 2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력 3.
							약관내용, 청약철회권이 제한되는 서비스, 배송료ㆍ설치비 등의 비용부담과 관련한 내용에 대한 확인 4. 이 약관에
							동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭) 5. 재화등의 구매신청 및 이에 관한 확인
							또는 “FT”의 확인에 대한 동의 6. 결제방법의 선택</li> <br />
						<li class="sections__section"><h3 class="article_title">제10조
								(계약의 성립)</h3> ① “FT”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다.
							다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을
							취소할 수 있다는 내용을 고지하여야 합니다. 1. 신청 내용에 허위, 기재누락, 오기가 있는 경우 2. 미성년자가
							담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우 3. 기타 구매신청에 승낙하는 것이 “FT”
							기술상 현저히 지장이 있다고 판단하는 경우 <br /> <br />② “FT”의 승낙이 제12조제1항의
							수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다. <br /> <br />③ “FT”의
							승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을
							포함하여야 합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제11조(지급방법)</h3>
							“FT”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단,
							“FT”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다. 1.
							폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제 3.
							온라인무통장입금 4. 전자화폐에 의한 결제 5. 수령시 대금지급 6. 마일리지 등 “FT”이 지급한 포인트에 의한
							결제 7. “FT”과 계약을 맺었거나 “FT”이 인정한 상품권에 의한 결제 8. 기타 전자적 지급 방법에 의한 대금
							지급 등</li> <br />
						<li class="sections__section"><h3 class="article_title">제12조(수신확인통지-구매신청
								변경 및 취소)</h3> ① “FT”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다. <br /> <br />②
							수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를
							요청할 수 있고 “FT”은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만
							이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제13조(재화등의
								공급)</h3> ① “FT”은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일
							이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “FT”이 이미 재화
							등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다.
							이때 “FT”은 이용자가 재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다. <br />
							<br />②“FT”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을
							명시합니다. 만약 “FT”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만
							“FT”이 고의ㆍ과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제14조(환급)</h3>
							“FT”은 이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를
							이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에
							필요한 조치를 취합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제15조(청약철회
								등)</h3> ①“FT”과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의
							철회를 할 수 있습니다. <br /> <br />② 이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는
							경우에는 반품 및 교환을 할 수 없습니다. 1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만,
							재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다) 2. 이용자의 사용 또는
							일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의
							가치가 현저히 감소한 경우 4. 같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한
							경우 <br /> <br />③ 제2항제2호 내지 제4호의 경우에 “FT”이 사전에 청약철회 등이 제한되는 사실을
							소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이
							제한되지 않습니다. <br /> <br />④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이
							표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날
							또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제16조(청약철회
								등의 효과)</h3> ① “FT”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을
							환급합니다. 이 경우 “FT”이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여
							고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다. <br /> <br />② “FT”은 위 대금을
							환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해
							결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다. <br /> <br />③
							청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. “FT”은 이용자에게 청약철회등을
							이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게
							이행되어 청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 “FT”이 부담합니다. <br /> <br />④
							이용자가 재화등을 제공받을때 발송비를 부담한 경우에 “FT”은 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기
							쉽도록 명확하게 표시합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제17조(개인정보보호)</h3>
							①“FT”은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그
							외 사항은 선택사항으로 합니다. 1. 성명 2. 주소 3. 전화번호 4. 희망ID(회원의 경우) 5. 비밀번호(회원의
							경우) 6. 전자우편주소(또는 이동전화번호) <br /> <br />② “FT”이 이용자의 개인식별이 가능한
							개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. <br /> <br />③제공된 개인정보는 당해
							이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 FT 이 집니다. 다만,
							다음의 경우에는 예외로 합니다. 1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소,
							전화번호)를 알려주는 경우 2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수
							없는 형태로 제공하는 경우 3. 재화등의 거래에 따른 대금정산을 위하여 필요한 경우 4. 도용방지를 위하여 본인확인에
							필요한 경우 5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우 <br /> <br />④“FT”이
							제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호,
							기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의
							내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지
							이 동의를 철회할 수 있습니다. <br /> <br />⑤이용자는 언제든지 “FT”이 가지고 있는 자신의
							개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “FT”은 이에 대해 지체없이 필요한 조치를 취할 의무를
							집니다. 이용자가 오류의 정정을 요구한 경우에는 “FT”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지
							않습니다. <br /> <br />⑥ “FT”은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며
							신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여
							모든 책임을 집니다. ⑦ “FT” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을
							달성한 때에는 당해 개인정보를 지체없이 파기합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제18조(“FT“의
								의무)</h3> ① “FT”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라
							지속적이고, 안정적으로 재화ㆍ용역을 제공하는데 최선을 다하여야 합니다. <br /> <br />② “FT”은
							이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을
							갖추어야 합니다. <br /> <br />③ “FT”이 상품이나 용역에 대하여 「표시ㆍ광고의공정화에관한법률」
							제3조 소정의 부당한 표시ㆍ광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다. <br />
							<br />④ “FT”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제19조(회원의
								ID 및 비밀번호에 대한 의무)</h3> ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.

							<br /> <br />② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. <br />
							<br />③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로
							“FT”에 통보하고 “FT”의 안내가 있는 경우에는 그에 따라야 합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제20조(이용자의
								의무)</h3> 이용자는 다음 행위를 하여서는 안됩니다. 1. 신청 또는 변경시 허위 내용의 등록 2. 타인의 정보 도용
							3. “FT”에 게시된 정보의 변경 4. “FT”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
							5. “FT” 기타 제3자의 저작권 등 지적재산권에 대한 침해 6. “FT” 기타 제3자의 명예를 손상시키거나 업무를
							방해하는 행위 7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 FT에 공개 또는
							게시하는 행위</li> <br />
						<li class="sections__section"><h3 class="article_title">제21조(연결“FT”과
								피연결“FT” 간의 관계)</h3> ① 상위 “FT”과 하위 “FT”이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림
							및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “FT”(웹 사이트)이라고 하고 후자를 피연결
							“FT”(웹사이트)이라고 합니다. <br /> <br />②연결“FT”은 피연결“FT”이 독자적으로 제공하는
							재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결“FT”의 초기화면 또는 연결되는
							시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제22조(저작권의
								귀속 및 이용제한)</h3> ① “FT“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”FT“에 귀속합니다. <br />
							<br />② 이용자는 “FT”을 이용함으로써 얻은 정보 중 “FT”에게 지적재산권이 귀속된 정보를 “FT”의 사전
							승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는
							안됩니다. <br /> <br />③ “FT”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해
							이용자에게 통보하여야 합니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제23조(분쟁해결)</h3>
							① “FT”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를
							설치ㆍ운영합니다. <br /> <br />② “FT”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그
							사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다. <br />
							<br />③“FT”과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는
							공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li> <br />
						<li class="sections__section"><h3 class="article_title">제24조(재판권
								및 준거법)</h3> ①“FT”과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고,
							주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가
							분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. <br /> <br />②“FT”과
							이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</li>
					</div>
					<div class="agree">
						동의함 <input type='checkbox' name="ckbox" />
					</div>
					<div class="article">
						<li class="sections__section"><h3 class="article_title">수집하는
								개인정보의 항목</h3> 회사는 회원가입, 상담, 서비스 신청 및 제공 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
							- 이름, 이메일, 주소, 연락처, 핸드폰 번호, 아이디, 비밀번호, 닉네임, 팩스번호, 홈페이지 주소 또한 서비스
							이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다. - 서비스 이용기록, 접속 로그,
							쿠키, 접속 IP 정보, 방문일시, 브라우저종류 및 os, 검색어, 결제기록, 이용정지 기록, 상담기록</li>
						<li class="sections__section"><h3 class="article_title">개인정보의
								수집 및 이용목적</h3> 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. 가. 서비스 제공에 관한 계약 이행 및
							서비스 제공에 따른 요금정산 콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매
							및 요금 결재, 요금추심 나. 회원 관리 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와
							비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인
							동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달</li>
						<li class="sections__section"><h3 class="article_title">개인정보의
								보유/이용기간</h3> 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단,
							다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. 가. 회사 내부 방침에 의한 정보보유 사유 -
							부정이용기록 보존 이유 : 부정 이용 방지 보존 기간 : 1년 나. 관련법령에 의한 정보보유 사유 상법, 전자상거래
							등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한
							기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와
							같습니다. - 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간
							: 5년 - 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존
							기간 : 5년 - 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
							보존 기간 : 3년 - 본인확인에 관한 기록 보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률 보존 기간
							: 6개월 - 방문에 관한 기록 보존 이유 : 통신비밀보호법 보존 기간 : 3개월</li>
						<li class="sections__section"><h3 class="article_title">개인정보취급
								위탁관련 / 개인정보제공 거부</h3> 가. 개인정보취급 위탁관련 - 개인정보취급위탁을 받는 자 : (주)oooo -
							개인정보취급위탁을 하는 업무의 내용 : 회원관리 회원제 서비스 이용에 따른 회원정보 관리 및 웹사이트 시스템 관리

							나. 개인정보제공 거부에 관한 사항 - 귀하께서는 본 동의 안내 문구를 숙지하였으며, 안내문구에 대해 거절하실 수
							있습니다. 단, 거절하신 경우에는 서비스 이용에 제한을 받을 수 있습니다.</li>
						<li class="sections__section"><h3 class="article_title">고유식별정보
								처리에 관한 사항 / 본인확인서비스 이용을 위한 고유식별 정보 제공 동의</h3> NICE신용평가정보㈜(이하 “대행사”)가
							“대행사”에서 제휴한 업체[자세한 업체 목록은 “대행사”에서 제공하는 본인인증서비스 이용 시, 명시]를 통해 제공하는
							휴대폰 본인인증 서비스와 관련하여 고객으로부터 수집한 고유식별정보를 이용하거나 타인에게 제공할 때에는 ‘정보통신망
							이용촉진 및 정보보호 등에 관한 법률’(이하 “정보통신망법”)에 따라 고객의 동의를 얻어야 합니다. 제1조
							[고유식별정보의 처리] “본인확인기관”은 휴대폰 본인인증 서비스 제공 시, 아래 두 가지 목적을 위해 고객의
							고유식별정보를 처리할 수 있습니다. 1. 정보통신망법 제23조의 2 제2항에 따라 인터넷상에서 주민등록번호를 입력하지
							않고도 본인임을 확인할 수 있는 휴대폰 본인인증서비스를 제공하기 위해 고유식별정보를 이용 2. ‘본인확인기관 지정
							등에 관한 기준(방송통신위원회 고시)’에 따라 “대행사”와 계약한 정보통신서비스 제공자의 연계서비스 및 중복
							가입확인을 위해 필요한 경우, “대행사”에서 제휴한 업체가 아래의 고유식별정보를 제공받아 처리할 수 있습니다. (1)
							이름, 휴대폰번호, 통신사, 성별, 생년월일, 국적 제2조 [본인확인서비스 이용을 위한 고유식별 정보 제3자 제공
							동의] 이용자는 “대행사”가 제공하는 본인확인서비스(이하 “서비스”라 합니다)를 이용하기 위해 같이 이용자의
							고유식별정보를 본인확인기관이 아래 기재된 제 3자에게 제공하는 것에 동의 합니다. 1. 고유식별정보를 제공받는 자

							“대행사” 와 “대행사”에서 제휴한 업체(SKT, Kt, LG U+, ㈜케이지모빌리언스) 2. 고유식별정보를 제공받는
							자의 이용목적 - 서비스(회원가입, ID/PW찾기 등) 이용을 위한 본인인증 - 본인인증을 위한 휴대폰 정보의 일치
							여부 확인 - 휴대폰 사용자 확인을 위한 SMS 인증번호 전송 - 부정 이용 방지 3. 제공하는 고유식별정보 항목 -
							성명, 성별, 생년월일, 내/외국인, 휴대폰번호, 이동통신사 4. 고유식별정보를 제공받는 자의 보유 및 이용 기간 -
							이용자의 개인정보는 이용목적이 달성되거나 보유 및 보존기간이 종료한 경우 해당 정보를 지체 없이 파기. 단, 관련
							법령 및 회사방침에 의해 보존하는 정보의 경우 아래 목적으로만 이용하며 보존기간은 다음과 같습니다. '정보통신망
							이용촉진 및 정보보호 등에 관한 법률'의 거래기록 보존 의무에 따른 보존: 1년</li>
						<h3 class="article_title"></h3>
					</div>
					<div class="agree">
						동의함 <input type='checkbox' name="ckbox" />
					</div>
				</div>
			</div>
			<!-- join -->
			<div class="content wrapper50">
				<input type="button" title="확인"  value="확인" onclick="doAction()"
					class="btn_half left"> <input type="button" title="취소"
					value="취소" class="btn_half left"
					onclick="location.href='/appmain.do'">
			</div>
		</form>
		<!-- E: CONTENT -->
		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
