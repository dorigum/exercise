<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div id="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
			<div class="container">
				<form id="joinForm" name="joinForm" method="post" action="/memUpdate">
					<div class="form-group">
						<br><label for="id">id:</label> <input type="text"
							class="form-control" id="id"  value=${mem.id }
							name="id" readonly >
					</div>
					<div class="form-group">
						<label for="name">이름:</label> <input type="text"
							class="form-control" id="name" value=${mem.name }
							name="name" required readonly>
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" onkeyup="passwordCheckfunction()"
							value=${mem.name } name="pwd" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					
					<div class="form-group">
						<label for="email">이메일:</label> <input type="text"
							class="form-control" id="email" value="${mem.email }"
							name="email" required readonly>
					</div>
					<div class="form-group">
						<label for="age">나이:</label> <input type="text"
							class="form-control" id="age" value="${mem.age}" name="age"
							required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					
					<div class="form-group">
						<label for="height">키:</label> <input type="text"
							class="form-control" id="height" value="${mem.height}"
							name="height" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label for="height">몸무게</label> <input type="text"
							class="form-control" id="weight" value="${mem.weight}"
							name="weight" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<button id="submit" type="submit">Submit</button>
				</form>
			</div>
			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
		</div>
	</div>
</body>
</html>
