<%@page import="edu.vinaenter.models.User"%>
<%@page import="edu.vinaenter.models.Cart"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<script	src="${pageContext.request.contextPath}/resources/tshoes/js/bootsnav.js"></script>
<script	src="${pageContext.request.contextPath}/resources/tshoes/js/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/tshoes/js/bootstrap-select.js"></script>
<script type="text/javascript">
							$(function () {
								var $cart = $('#cart');
								$('#clickme').click(function (e) {
									e.stopPropagation();
									if ($cart.is(":hidden")) {
										$cart.slideDown("slow");
									} else {
										$cart.slideUp("slow");
									}
								});
								$(document.body).click(function () {
									if ($cart.not(":hidden")) {
										$cart.slideUp("slow");
									}
								});
							});
</script>
<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="top-header-left">
				<div>
                    <ul>
                        <li>
							<a href="<%= request.getContextPath()%>/cart">
								<i class="fa fa-shopping-bag"></i>
								<%
								 if ( session.getAttribute("listCarts") != null ){
									 List<Cart> listCarts = (List<Cart>) session.getAttribute("listCarts");
									 if (listCarts.size() > 0){
								%>
								<span id="sizecart" class="cart">(<%= listCarts.size() %>)</span>
								<% } } else{ %>
								<span>Cart</span>
								<% } %>
							</a>
						</li>
                    </ul>
                </div>
				</div>
				<div class="top-header-center">
					<div class="top-header-center-alert-left">
						<h3>FREE DELIVERY</h3>
					</div>
					<div class="top-header-center-alert-right">
						<div class="vticker">
							<ul>
								<li>Applies to orders of $50 or more. <label>Returns are always free.</label></li>
							</ul>
						</div>
					</div>
					<div class="clear"> </div>
				</div>
				<div class="top-header-right">
					<ul>
						<%
						if (session.getAttribute("userLogin") == null){
						%>
						<li><a href="${pageContext.request.contextPath}/login">Login</a><span> </span></li>
						<li><a href="${pageContext.request.contextPath}/register">Join</a></li>
						<% } else { 
								User uLogin = (User) session.getAttribute("userLogin");
						%>
						<li><a><%= uLogin.getUsername() %></a><span></span></li>
						<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
						<%  } %>
					</ul>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
		<!----start-mid-head---->
		<div class="mid-header">
			<div class="wrap">
				<div class="mid-grid-left">
					<form action="${pageContext.request.contextPath}/search" method="post">
						<select class="form-control" name="cat_id">
									<c:forEach items="${listCategoryC}" var="cat">
									<option value="${ cat.id }">${cat.name }</option>
									</c:forEach>
						</select>
						<input type="text"  name ="catname"placeholder="What Are You Looking for?" />
						<input type="submit" value="Search"/>
					</form>
				</div>
				<div class="mid-grid-right">
					<a class="logo" href="index.html"><span> </span></a>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
		<!----//End-mid-head---->
		<!----start-bottom-header---->
		<div class="header-bottom">
			<div class="wrap">
				<!-- start header menu -->
				<ul class="megamenu skyblue">
					<c:choose>
					<c:when test="${ not empty listCategoryG }">
					<c:forEach items="${listCategoryG }" var="catg">
					<li class="grid"><a class="color2" href="#">${ catg.name}</a>
						<div class="megapanel">
							<div class="row">
								<div class="col1">
								<div class="h_nav">
									<c:choose>
									<c:when test="${not empty listCategoryP }">
									<c:forEach items="${listCategoryP }" var="catp">
										<h4>${catp.name}</h4>
										<ul>
											<c:forEach items="${listCategoryC }" var="catc">
											<li><a href="${pageContext.request.contextPath}/cat/${catc.id}">${catc.name }</a></li>
											</c:forEach>
										</ul>
									</c:forEach>
									</c:when>
									</c:choose>
								</div>
								</div>
								<div class="col1 men">
									<div class="men-pic">
										<img src="${pageContext.request.contextPath}/resources/tshoes/images/men.png" title="" />
									</div>
								</div>
							</div>
						</div>
					</li>
					</c:forEach>
					</c:when>
					<c:otherwise>
					Empty Category
					</c:otherwise>
					</c:choose>
					
				</ul>

			</div>
		</div>
	</div>
