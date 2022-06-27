<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author"
			content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
		<meta name="generator" content="Hugo 0.98.0">
		<title>Sign-in Template · Bootstrap v5.2</title>
		
		<link rel="canonical"
			href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
		<link href="resource/css/assets/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<style>
			.bd-placeholder-img {
				font-size: 1.125rem;
				text-anchor: middle;
				-webkit-user-select: none;
				-moz-user-select: none;
				user-select: none;
			}
			
			@media ( min-width : 768px) {
				.bd-placeholder-img-lg {
					font-size: 3.5rem;
				}
			}
			
			.b-example-divider {
				height: 3rem;
				background-color: rgba(0, 0, 0, .1);
				border: solid rgba(0, 0, 0, .15);
				border-width: 1px 0;
				box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
					rgba(0, 0, 0, .15);
			}
			
			.b-example-vr {
				flex-shrink: 0;
				width: 1.5rem;
				height: 100vh;
			}
			
			.bi {
				vertical-align: -.125em;
				fill: currentColor;
			}
			
			.nav-scroller {
				position: relative;
				z-index: 2;
				height: 2.75rem;
				overflow-y: hidden;
			}
			
			.nav-scroller .nav {
				display: flex;
				flex-wrap: nowrap;
				padding-bottom: 1rem;
				margin-top: -1px;
				overflow-x: auto;
				text-align: center;
				white-space: nowrap;
				-webkit-overflow-scrolling: touch;
			}
		</style>
		
		
		<!-- Custom styles for this template -->
		<link href="resource/css/signin.css" rel="stylesheet">
		<meta charset="UTF-8">
		<title>Login</title>

	</head>
	<body class="text-center">
		
		<!-- form안의 데이터들이 submit이 되면 name의 이름을 가지고 백에 날아감 -->
		<main class="form-signin w-100 m-auto">
			<form action="loginAction.jsp" method="POST">
				<img class="mb-4" src="resource/css/assets/brand/bootstrap-logo.svg" alt=""
					width="72" height="57">
				<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
				<div class="form-floating">
					<input type="email" class="form-control" id="userID" name = "userID"
					placeholder="name@example.com"> <label for="userID">Email
					address or ID</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="userPassword" name="userPassword"
						placeholder="Password"> <label for="userPassword">Password</label>
				</div>
	
				<div class="checkbox mb-3">
					<label> <input type="checkbox" value="remember-me">
						Remember me
					</label>
				</div>
				<button class="w-100 btn btn-lg btn-primary" type="submit">Sign
					in</button>
				<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
			</form>
		</main>
	
	
	
	</body>
</html>