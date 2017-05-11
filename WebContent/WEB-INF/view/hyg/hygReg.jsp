<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.HygDTO"%>
<%@page import="java.util.List"%>    

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>위생인증</title>

	<%@include file="/inc/top.jsp" %>

	<script type="text/javascript">
	function doAction() {
		var f = document.getElementById("f");
		if (f.title.value==""){
			alert("위생인증 제목을 업로드하시길 바랍니다.");
		return false;
		}
		if (f.contents.value==""){
			alert("내용을 업로드하시길 바랍니다.");
		return false;
		}
		
		if (f.fileGRP.value==""){
			alert("위생인증 사진을 업로드하시길 바랍니다.");
		return false;
		}
		
		   if (calBytes(f.title.value) > 100) {
		        alert("제목은 최대 100Bytes까지 입력 가능합니다.");
		        f.title.focus();
		        return;
		     }

		      if (calBytes(f.contents.value) > 4000) {
		        alert("내용은 최대 4000Bytes까지 입력 가능합니다.");
		        f.contents.focus();
		        return;
		     }    
		  

				
			f.submit();
		return true;
		}
		function calBytes(str) {

			var tcount = 0;
			var tmpStr = new String(str);
			var strCnt = tmpStr.length;
			var onechar;
			
			for (i = 0; i < strCnt; i++) {
				onechar = tmpStr.charAt(i);
				if (escape(onechar).length > 4) {
					tcount += 2;
				} else {
					tcount += 1;
				}
			}
			return tcount;
		}
	
		//파일 업로드
		function doFileUpload() {
			
			var cw=screen.availWidth;     //화면 넓이
			var ch=screen.availHeight;    //화면 높이
			
			var sw=500;    //띄울 창의 넓이
			var sh=400;    //띄울 창의 높이
			
			var ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			var mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
			
			window.open("/file/FileUploadSingPOP.do?jObj=fileGRP", "UPLOAD_POP",
					"width=" + sw + ",height=" + sh + ",top=" + mt + ",left=" + ml
							+ ",resizable=no,scrollbars=yes");
		}
		
		//이미지 첨부가 완료되면 실행될 함수
		function doUploadOK(){
		
			alert("doUploadOK");
			var btnImg = document.getElementById("btnImg");
			
			btnImg.value = "업로드 완료";
			btnImg.disabled;
			
		}
		
		
	</script>

</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">위생인증서</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">위생인증
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            	<form name="f" id="f" method="post" action="/hyg/hygInsert.do">
	
								
 
 										
 										<table class="table table-striped table-bordered table-hover"
									     id="dataTables-example">		
 										
 										<tr>
										<td align="center" width="120px"><b>위생인증 제목</b></td>
										<td><input type="text" name="title" maxlength="50" class="form-control" style= "width:400px"/></td>
										</tr>
										<tr>
										<td align="center" width="120px"><b>내용 </b></td>
										<td>
										<textarea name="contents"  maxlength="2000"  class="form-control" rows="10" cols="68"/></textarea></td>
										</tr>
 										
 										
 										<tr>
										<td align="center"><b>위생인증 사진</b></td>
										<td>
											<input type="hidden" name="fileGRP" id="fileGRP" /><%//저장된 파일의 파일그룹 아이디 %>
											<input type="button" id="btnImg" value="등록"  onclick="doFileUpload()"/>
										</td>
									</tr>
									</table>
	
                                </form>
	                            <p align="right">
									<input type="button" value="등록" onclick="doAction()" class="btn btn-outline btn-success"/>
									<input type="button" value="목록" onclick="location.href='/hyg/hygList.do'" class="btn btn-outline btn-default"/>
	                            </p>
                            </div>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<!-- 로직 처리용 -->
	
	<iframe name="ifrProc" style="display:none"></iframe>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
    