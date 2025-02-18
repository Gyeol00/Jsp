<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.json</title>
	<script>
		document.addEventListener('DOMContentLoaded', function(){
			
			const btnUser1 = document.getElementById('btnUser1');
			const user1 = document.querySelector('.user1');
			const spans = user1.getElementsByTagName('span');
			
			btnUser1.onclick = async function(){
				
				const response = await fetch('./data/user1.jsp');
				const data = await response.json();
				
				spans[0].innerText = data.uid;
				spans[1].innerText = data.name;
				spans[2].innerText = data.age;
				spans[3].innerText = data.addr;
			}
		});
	</script>
</head>
<body>
	<h3>3.JSON 실습</h3>
	
	<h4>JSON</h4>
	<a href="./data/user1.jsp">user1 요청하기</a><br>
	<a href="./data/user2.jsp">user2 요청하기</a><br>
	<a href="./data/users.jsp">users 요청하기</a><br>
	
	<h4>XML</h4>
	<a href="./data/xml1.jsp">xml1 요청하기</a><br>
	<a href="./data/xml2.jsp">xml2 요청하기</a><br>
	
	<h4>AJAX (Asyncronous Javascript And XML)</h4>
	<button id="btnUser1">user1 요청</button>
	<p class="user1">
		uid : <span></span><br>
		name : <span></span><br>
		age : <span></span><br>
		addr : <span></span><br>
	</p>
	
	
	
</body>
</html>