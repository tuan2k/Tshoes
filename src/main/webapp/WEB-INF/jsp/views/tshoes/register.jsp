<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<div class="content login-box">
		<h2>${msg }</h2>
		<div class="login-main">
			<div class="wrap">
				<h1>CREATE AN ACCOUNT</h1>
				<div class="register-grids">
					<form action="${pageContext.request.contextPath}/register" method="POST">
						<div class="register-top-grid">
							<h3>PERSONAL INFORMATION</h3>
							<div>
								<span>User Name<label>*</label></span>
								<input type="text" name="username" required>
							</div>
							<div>
								<span>Full Name<label>*</label></span>
								<input type="text" name="fullname" required>
							</div>
							<div>
								<span>Address<label>*</label></span>
								<input type="text" name="address" required>
							</div>
							<div>
								<span>Phone<label>*</label></span>
								<input type="text" name="phone" required>
							</div>
							<div class="clear"> </div>
						</div>
						<div class="clear"> </div>
						<div class="register-bottom-grid">
							<h3>LOGIN INFORMATION</h3>
							<div>
								<span>Password<label>*</label></span>
								<input type="password" name="password" required>
							</div>
							<div>
								<span>Confirm Password<label>*</label></span>
								<input type="password" name="rpassword" required>
							</div>
							<div class="clear"> </div>
						</div>
						<div class="clear"> </div>
						<input type="submit" value="submit" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!---- start-bottom-grids---->
	<div class="bottom-grids">
		<div class="bottom-top-grids">
			<div class="wrap">
				<div class="bottom-top-grid">
					<h4>GET HELP</h4>
					<ul>
						<li><a href="contact.html">Contact us</a></li>
						<li><a href="#">Shopping</a></li>
						<li><a href="#">NIKEiD</a></li>
						<li><a href="#">Nike+</a></li>
					</ul>
				</div>
				<div class="bottom-top-grid">
					<h4>ORDERS</h4>
					<ul>
						<li><a href="#">Payment options</a></li>
						<li><a href="#">Shipping and delivery</a></li>
						<li><a href="#">Returns</a></li>
					</ul>
				</div>
				<div class="bottom-top-grid last-bottom-top-grid">
					<h4>REGISTER</h4>
					<p>Create one account to manage everything you do with Nike, from your shopping preferences to your
						Nike+ activity.</p>
					<a class="learn-more" href="#">Learn more</a>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
		<div class="bottom-bottom-grids">
			<div class="wrap">
				<div class="bottom-bottom-grid">
					<h6>EMAIL SIGN UP</h6>
					<p>Be the first to know about new products and special offers.</p>
					<a class="learn-more" href="#">Sign up now</a>
				</div>
				<div class="bottom-bottom-grid">
					<h6>GIFT CARDS</h6>
					<p>Give the gift that always fits.</p>
					<a class="learn-more" href="#">View cards</a>
				</div>
				<div class="bottom-bottom-grid last-bottom-bottom-grid">
					<h6>STORES NEAR YOU</h6>
					<p>Locate a Nike retail store or authorized retailer.</p>
					<a class="learn-more" href="#">Search</a>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
	</div>