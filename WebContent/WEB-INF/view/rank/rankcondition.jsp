<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, java.text.*"  %>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<%@include file="/inc/top.jsp" %>

    <title>종합순위 조회</title>

   <script type="text/javascript">
      function changeSelect(city) {
         var local = document.f.local;
         var opt = $("#local option").length;
         
         var num = null;
         var vnum = null;
         
         if(city.value == "B0001"){
            num = null;
            vnum = null;
            num = new Array("전체선택","강남구","노원구","마포구","서대문구","서초구","용산구","종로구","중구");
            vnum = new Array("X","C0001", "C0002", "C0003", "C0004", "C0005" ,"C0006", "C0007", "C0008");
         }
         
         else if(city.value == "B0002"){
            num = null;
            vnum = null;
            num = new Array("전체선택","강화군","남구","동구","부평구","연수군","옹진군","중구");
            vnum = new Array("X","C0009", "C0010", "C0011", "C0012","C0013", "C0014", "C0015");
         }
         
         else if(city.value == "B0003"){
            num = null;
            vnum = null;
            num = new Array("전체선택","가평군","고양시","과천시","광명시","광주시","구리시","김포시","남양주시","동두천시","성남시","수원시","안산시","안성시","양주시","여주시","연천군","오산시","용인시","이천시","파주시","포천시","화성시");
            vnum = new Array("X","C0016", "C0017", "C0018", "C0019", "C0020","C0021", "C0022", "C0023" ,"C0024", "C0025", "C0026", "C0027", "C0028 "," C0029 "," C0030 "," C0031"," C0032 "," C0033 "," C0034 "," C0035 "," C0036 "," C0037 ");
         }
         
         else if(city.value == "B0004"){
            num = null;
            vnum = null;
            num = new Array("전체선택","강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","횡성군");
            vnum = new Array("X","C0038", "C0039", "C0040", "C0041", "C0042", "C0043", "C0044", "C0045", "C0046", "C0047", "C0048" ,"C0049", "C0050 "," C0051 "," C0052 "," C0053"," C0054 ");
         }
         
         else if(city.value == "B0005"){
            num = null;
            vnum = null;
            num = new Array("전체선택","강서구","남구","사하구","영도구","해운대구");
            vnum = new Array("X","C0055","C0056","C0057","C0058","C0059");
         }
         
         else if(city.value == "B0006"){
            num = null;
            vnum = null;
            num = new Array("전체선택","남구","달서구","달성군","동구","북구","수성구","중구");
            vnum = new Array("X","C0060","C0061","C0062","C0063","C0064","C0065","C0066");
         }
         
         else if(city.value == "B0007"){
            num = null;
            vnum = null;
            num = new Array("전체선택","남구","동구","북구");
            vnum = new Array("X","C0067","C0068","C0069");
         }
         
         else if(city.value == "B0008"){
            num = null;
            vnum = null;
            num = new Array("전체선택","동구","서구","유성구","중구");
            vnum = new Array("X","C0070","C0071","C0072","C0073");
         }
         
         else if(city.value == "B0009"){
            num = null;
            vnum = null;
            num = new Array("전체선택","남구","동구","울주군");
            vnum = new Array("X","C0074","C0075","C0076");
         }
         
         else if(city.value == "B0010"){
            num = null;
            vnum = null;
            num = new Array("세종특별자치시");
            vnum = new Array("C0077");
         }
         
         else if(city.value == "B0011"){
            num = null;
            vnum = null;
            num = new Array("전체선택","계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","청양군","태안군","홍성군","괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시","충주시");
            vnum =new Array("X","C0078", "C0079", "C0080" ,"C0081" ,"C0082", "C0083", "C0084", "C0085", "C0086", "C0087", "C0088", "C0089", " C0090 "," C0091 "," C0092 "," C0093 "," C0094 "," C0095 "," C0096 "," C0097 "," C0098 "," C0099 "," C0100"," C0101 "," C0102 " , "C0103");
         }
         
         else if(city.value == "B0012"){
            num = null;
            vnum = null;
            num = new Array("전체선택","강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군","고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군");
            vnum = new Array("X","C0104", "C0105", "C0106", "C0107", "C0108", "C0109", "C0110", "C0111", "C0112", "C0113", "C0114", "C0115", "C0116 "," C0117"," C0118 "," C0119 "," C0120 "," C0121 "," C0122 "," C0123 "," C0124 "," C0125 "," C0126 "," C0127 "," C0128 ", "C0129", "C0130", "C0131", "C0132", "C0133", "C0134", "C0135", "C0136", "C0137", "C0138" ,"C0139");
         }
         
         else if(city.value == "B0013"){
            num = null;
            vnum = null;
            num = new Array("전체선택","거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","통영시","통합창원시","하동군","함안군","함양군","합천군","경산시","경주시","고령군","구미시","구위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시");
            vnum = new Array("X","C0140", "C0141", "C0142", "C0143", "C0144", "C0145", "C0146", "C0147 ", "C0148", "C0149", "C0150", "C0151", "C0152 "," C0153 "," C0154"," C0155 "," C0156"," C0157"," C0158"," C0159 "," C0160 "," C0161"," C0162 "," C0163 "," C0164 "," C0165 "," C0166 "," C0167 "," C0168 "," C0169 "," C0170"," C0171 "," C0172 "," C0173 "," C0174 "," C0175 "," C0176", "C0177", "C0178", "C0179", "C0180");
         }
         
         //var local = document.f.local;
         //var opt = $("#local option").lengthss;         
         
         local.length = 0;
         
         for(var k=0; k<num.length;k++){
             local.options[k] = new Option(num[k],vnum[k]);
         }
         
      }
         
         
         
            
      function doAction(f) {
         var i = 0;

         if (f.nation.value == "D0003" && f.pay.value == "S") {
            if (confirm("내·외국인 및 입장료를 전체로 하셨습니다. 진행하시겠습니까?")) {
               return true;
            } else {
               return false;
            }
         }

         else if (f.nation.value == "D0003") {
            if (confirm("내·외국인을 전체로 하셨습니다. 진행하시겠습니까?")) {
               return true;
            } else {
               return false;
            }
         } 
          else if (f.pay.value== "S"){
         	if (confirm("입장료를 전체로 하셨습니다. 진행하시겠습니까?")){
         		 return true;
          } else {
            	 return false;
          }
         }
         
         return true;
         
        
      }

   </script>
</head>
<%
java.util.Calendar cal2= java.util.Calendar.getInstance();
java.util.Calendar cal3 = java.util.Calendar.getInstance();
java.util.Calendar cal4 = java.util.Calendar.getInstance();
java.util.Calendar cal5 = java.util.Calendar.getInstance();
java.util.Calendar cal6 = java.util.Calendar.getInstance();
java.util.Calendar cal7 = java.util.Calendar.getInstance();
java.util.Calendar cal8 = java.util.Calendar.getInstance();
java.util.Calendar cal9 = java.util.Calendar.getInstance();
java.util.Calendar cal10 = java.util.Calendar.getInstance();
java.text.DateFormat format = new java.text.SimpleDateFormat("MM월dd일");

/* cal.add(cal.DATE, -7); */ // 7일(일주일)을 뺀다

cal2.add(cal2.DATE, +2);
String dateStr2 = format.format(cal2.getTime());

cal3.add(cal3.DATE, +3);
String dateStr3 = format.format(cal3.getTime());

cal4.add(cal4.DATE, +4);
String dateStr4 = format.format(cal4.getTime());

cal5.add(cal5.DATE, +5);
String dateStr5 = format.format(cal5.getTime());

cal6.add(cal6.DATE, +6);
String dateStr6 = format.format(cal6.getTime());

cal7.add(cal7.DATE, +7);
String dateStr7 = format.format(cal7.getTime());

cal8.add(cal8.DATE, +8);
String dateStr8 = format.format(cal8.getTime());

cal9.add(cal9.DATE, +9);
String dateStr9 = format.format(cal9.getTime());

cal10.add(cal10.DATE, +10);
String dateStr10 = format.format(cal10.getTime());


%>
<body>
<form name="f" method="post" action="ranklist.do" onsubmit="return doAction(this)" >

    <div id="wrapper">

   <%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">종합순위정보 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">종합순위 조회
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <br/>
                        <br/>
                        
                           <table border=1  class="table table-striped table-bordered table-hover" id="dataTables-example">
                              <tr>
                                 <td width="100px" align="center" height = "50px"><b>시,도</b></td>
                                 
                                 <td width="200px" align="center"> 
                                    <select name="city" size="1" onchange="changeSelect(this)"  style="width:200px" class="form-control" >
                                      <option value="B0001" selected >서울특별시</option>
                                      <option value="B0002">인천광역시</option>
                                      <option value="B0003">경기도</option>
                                      <option value="B0004">강원도</option>
                                      <option value="B0005">부산광역시</option>
                                      <option value="B0006">대구광역시</option>
                                      <option value="B0007">광주광역시</option>
                                      <option value="B0008">대전광역시</option>
                                      <option value="B0009">울산광역시</option>
                                      <option value="B0010">세종특별자치시</option>
                                      <option value="B0011">충청도</option>
                                      <option value="B0012">전라도</option>
                                      <option value="B0013">경상도</option>
                                   </select> 
                                    </td>
                                 </tr>
                                 
                                 <tr>
                                    <td align="center" height = "50px"> <b>시,군,구</b> </td>
                                    <td align="center">
                                       <select name="local" size="1" id="local" style="width:200px"  class="form-control" >
                                      <option value="X" selected>전체선택</option>
                                      <option value="C0001">강남구</option>
                                      <option value="C0002">노원구</option>
                                      <option value="C0003">마포구</option>
                                      <option value="C0004">서대문구</option>
                                      <option value="C0005">서초구</option>
                                      <option value="C0006">용산구</option>
                                      <option value="C0007">종로구</option>
                                      <option value="C0008">중구</option>
                                       </select>
                                    </td>
                                 </tr>
                                 
                                 <tr>
                                    <td align="center" height = "50px"><b>참여 월</b></td>
                                    <td align="center">
                                       <select name="calender" size="1" style="width:200px"  class="form-control" >
                                          <option value="jan" selected>1월</option>
                                          <option value="feb" >2월</option>
                                          <option value="mar" >3월</option>
                                          <option value="apr" >4월</option>
                                          <option value="may" >5월</option>
                                          <option value="jun" >6월</option>
                                          <option value="jul" >7월</option>
                                          <option value="aug" >8월</option>
                                          <option value="sep" >9월</option>
                                          <option value="oct" >10월</option>
                                          <option value="nov" >11월</option>
                                          <option value="dec" >12월</option>
                                       </select>
                                    </td>
                                 </tr>
                                 
                                 <tr>
                                   <td align="center" height = "50px"><b>내·외국인</b></td>
                                   <td align="center">
                                      <select name="nation" size="1" style="width:200px"  class="form-control" >
                                         <option value="D0003" selected>전체</option>
                                         <option value="D0001">내국인</option>
                                 		 <option value="D0002">외국인</option>                                          
                                      </select>
                                   </td>
                                 </tr>
                                 
                                 <tr>
                                    <td align="center" height = "50px"><b>입장료 유무</b></td>
                           <td align="center"> 
                              <select name="pay" size="1" style="width:200px"  class="form-control"  >
                                          <option value="S" selected >전체</option>
                                          <option value="F0001"  >무료</option>
                                          <option value="F0002" >유료</option>   
                                       </select>
                                    </td>
                                 </tr>
                                 <tr>
                                 <td align="center" height = "50px" ><b>판매 예정 일 날씨</b></td>
                                 <td align="center" >
                                 <select name="weather" size="1" style="width:200px" class="form-control">
                                 			<option value="today" selected > <%=dateStr2 %></option>
                                 			<option value="today"  > <%=dateStr3 %></option>
                                 			<option value="today"  > <%=dateStr4 %></option>
                                 			<option value="today"  > <%=dateStr5 %></option>
                                 			<option value="today"  > <%=dateStr6 %></option>
                                 			<option value="today"  > <%=dateStr7 %></option>
                                 			<option value="today"  > <%=dateStr8 %></option>
                                 			<option value="today"  > <%=dateStr9 %></option>
                                 			<option value="today"  > <%=dateStr10 %></option>
                                 			
                                 	</select></td>
                                                                   
                           </table>
                           <div align="center">
                                 <br/>
                               <p align="right">
                                     <input type="submit"  class="btn btn-outline btn-warning" value="종합순위 조회">
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
   </div>
    </form>
    <!-- /#wrapper -->

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
    