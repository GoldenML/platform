<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zxx">

	<head>
		<title>Full Screen Enroll Form Responsive Widget Template :: w3layouts</title>
		<!-- Meta tag Keywords -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8" />
		<meta name="keywords" content="Full Screen Enroll Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
		<script>
			addEventListener("load", function () {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		<!-- Meta tag Keywords -->

		<!-- css files -->
		<link rel="stylesheet" href="../css/stu/style.css" type="text/css" media="all" />
		<!-- Style-CSS -->
		<link rel="stylesheet" href="../css/stu/fontawesome-all.css">
		<!-- Font-Awesome-Icons-CSS -->
		<!-- //css files -->

		<!-- web-fonts -->
		<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext"
			rel="stylesheet">
		<!-- //web-fonts -->
	</head>

	<body>
		<div class="main-w3ls">
			<div class="left-content">
				<div class="w3ls-content">
					<!-- logo -->
					<h1>
						<a href="index.html"><i class="fab fa-accusoft"></i>Full Screen Enroll Form</a>
					</h1>
					<!-- //logo -->
					<h2>Sed do eiusmod tempor incidunut labore.</h2>
					<a href="#" class="button-w3ls">
						<i class="fas fa-long-arrow-alt-right"></i>
					</a>
					<ul class="nav-w3ls">
						<li>
							<a href="#">Home</a>
						</li>
						<li>
							<a href="#">About Us</a>
						</li>
						<li>
							<a href="#">Error Page</a>
						</li>
						<li>
							<a href="#">Blog</a>
						</li>
						<li>
							<a href="#">Contact Us</a>
						</li>
					</ul>
				</div>
				<!-- copyright -->
				<div class="copyright">
					<p>&copy; 2018 Full Screen Enroll Form. All rights reserved | Design by
						<a href="http://w3layouts.com">W3layouts</a>
					</p>
				</div>
				<!-- //copyright -->
			</div>
			<div class="right-form-agile">
				<!-- content -->
				<div class="sub-main-w3">
					<h3>Signup Now</h3>
					<h5>Creating an account is free..</h5>
					<p>and won't take longer than a couple os seconds</p>
					<form action="#" method="post">
						<div class="form-style-agile">
							<label>姓名：</label>
							<div class="pom-agile">
								<span class="fas fa-user"></span>
								<input placeholder="姓名" name="Name" type="text" required="">
							</div>
						</div>
						<div class="form-style-agile">
							<label>手机号：</label>
							<div class="pom-agile">
								<span class="fas fa-envelope-open"></span>
								<input placeholder="手机号" name="phone" type="text" required="">
							</div>
						</div>
						<div class="form-style-agile">
							<label>密码：</label>
							<div class="pom-agile">
								<span class="fas fa-key"></span>
								<input placeholder="Password" name="Password" type="password" id="password1" required="">
							</div>
						</div>
						<div class="form-style-agile">
							<label>确认密码：</label>
							<div class="pom-agile">
								<span class="fas fa-key"></span>
								<input placeholder="Confirm Password" name="Confirm Password" type="password" id="password2" required="">
							</div>
						</div>
						<div style="font-size: 20px;color:white;">
							文化程度：
							<select style="color:black" id="edu_degree">
								<option value = "0">本科</option>
								<option value = "1">高中</option>
								<option value = "2">初中</option>
								<option value = "3">小学</option>
							</select>
						</div>
						<input type="submit" value="Submit">
					</form>

				</div>
			</div>
		</div>
		<!-- //content -->
		<!-- password-script -->
		<script>
			window.onload = function () {
				document.getElementById("password1").onchange = validatePassword;
				document.getElementById("password2").onchange = validatePassword;
			}

			function validatePassword() {
				var pass2 = document.getElementById("password2").value;
				var pass1 = document.getElementById("password1").value;
				if (pass1 != pass2)
					document.getElementById("password2").setCustomValidity("Passwords Don't Match");
				else
					document.getElementById("password2").setCustomValidity('');
				//empty string means no validation error
			}
		</script>
		<!-- //password-script -->

	</body>

</html>