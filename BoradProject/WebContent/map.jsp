<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>오시는 길</title>
		<style>
			#aa {
			  background: linear-gradient(#05FBFF, #1D62F0 ) fixed;
			}
			/* div {
			  margin: 120px 0;
			  text-align: center;
			} */
			h1, p {
			  font-family: Meiryo, "Hiragino Kaku Gothic Pro W3", Courier New, sans-serif;
			  line-height: 1.5;
			  margin-bottom: 25px;
			  color: #fff;
			}
		</style>
	</head>
<body>
		<%
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
		%>
		 <nav class="navbar navbar-default" style="background-color: #e3f2fd;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>		
				</button>
				<a class="navbar-brand" href="main.jsp" style="color: #008000;">Play data</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="nav-item"><a href="main.jsp">메인</a></li>
					<li class="nav-item"><a href="boardForm.jsp">게시판</a></li>
					<li class="nav-item"><a href="map.jsp">오시는길</a></li>
				</ul>
				<%
					// 로그인이 되어 있지 않다면
					if(userID == null){
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" role="button"
							aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
				<%
					} else {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" role="button"
							aria-haspopup="true" data-toggle="dropdown" aria-expaned="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
							<li><a href="updateUserForm.jsp">정보수정</a></li>
						</ul>
					</li>
				</ul>
				<%
					}
				%>
			</div>
		</nav>

		<h2><b>오시는 길</b></h2>
		<div id="map" style="width:800px;height:600px; float:left; margin-right:10px;"></div>
		<h2><b>Road Map</b></h2>
		<div id="roadview" style="width:400px;height:600px; float:left"></div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a326cfc4e3978b97f03d37739dd513c"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(37.48645042884947, 127.02071427614587),
				level: 3
			};
			var map = new kakao.maps.Map(container, options);
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			});
			marker.setMap(map);
			var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">Playdata</div>'
	        });
	        infowindow.open(map, marker);
		</script>
		<script>
		var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
		
		var position = new kakao.maps.LatLng(37.48645042884947, 127.02071427614587);
		
		// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		roadviewClient.getNearestPanoId(position, 50, function(panoId) {
		    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
		});
		</script>



</body>
</html>