<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<div class="content login-box">
		<h2>${msg }</h2>
		<div class="login-main">
			<div class="wrap">
				<h1>LOGIN OR CREATE AN ACCOUNT</h1>
				<div class="login-left">
					<h3>NEW CUSTOMERS</h3>
					<p>By creating an account with our store, you will be able to move through the checkout process
						faster, store multiple shipping addresses, view and track your orders in your account and more.
					</p>
					<a class="acount-btn" href="${pageContext.request.contextPath }/register">Creat an Account</a>
				</div>
				<div class="login-right">
					<h3>REGISTERED CUSTOMERS</h3>
					<p>If you have an account with us, please log in.</p>
					<form action="${pageContext.request.contextPath }/login" method="post">
						<div>
							<span>User Name<label>*</label></span>
							<input type="text" name="username">
						</div>
						<div>
							<span>Password<label>*</label></span>
							<input type="password" name="password">
						</div>
						<input type="submit" value="Login" />
					</form>
				</div>
				<div class="clear"> </div>
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