<%@page import="edu.vinaenter.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<style>
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
/*reset css*/
div, label {
	margin: 0;
	padding: 0;
}

body {
	margin: 20px;
}

h1 {
	font-size: 1.5em;
	margin: 10px;
}
/****** Style Star Rating Widget *****/
#rating {
	border: none;
	float: left;
}

#rating>input {
	display: none;
} /*ẩn input radio - vì chúng ta đã có label là GUI*/
#rating>label:before {
	margin: 5px;
	font-size: 1.25em;
	font-family: FontAwesome;
	display: inline-block;
	content: "\f005";
} /*1 ngôi sao*/
#rating>.half:before {
	content: "\f089";
	position: absolute;
} /*0.5 ngôi sao*/
#rating>label {
	color: #ddd;
	float: right;
}
	/*float:right để lật ngược các ngôi sao lại đúng theo thứ tự trong thực tế*/
/*thêm màu cho sao đã chọn và các ngôi sao phía trước*/
#rating>input:checked ~label, #rating:not (:checked )>label:hover,
	#rating:not (:checked )>label:hover ~label{
	color: #FFD700;
}
/* Hover vào các sao phía trước ngôi sao đã chọn*/
#rating>input:checked+label:hover, #rating>input:checked ~label:hover,
	#rating>label:hover ~input:checked ~label, #rating>input:checked ~label:hover
	~label{
	color: #FFED85;
}

.comment-left {
	width: 820px;
	float: left;
}

.comment-left>h2 {
	font-size: 22px;
	color: #2e2e2e;
	text-transform: uppercase;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}
</style>
<script
	src="${pageContext.request.contextPath}/resources/tshoes/js/jquery.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/resources/tshoes/js/jquery-3.2.1.min.js"></script> --%>
<c:url var="home" value="${pageContext.request.contextPath }"
	scope="request" />
<div class="content details-page">
	<!---start-product-details--->
	<div class="product-details">
		<c:if test="${not empty product }">
			<div class="wrap">
				<ul class="product-head">
					<li><a href="${pageContext.request.contextPath}/">Home</a> <span>::</span></li>
					<li class="active-page"><a
						href="${pageContext.request.contextPath}/product">Product Page</a></li>
					<div class="clear"></div>
				</ul>
				<!----details-product-slider--->
				<!-- Include the Etalage files -->
				<link rel="stylesheet"
					href="${pageContext.request.contextPath}/resources/tshoes/css/etalage.css">
				<script
					src="${pageContext.request.contextPath}/resources/tshoes/js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<!----//details-product-slider--->
				<div class="details-left">
					<div class="details-left-slider">
						<ul id="etalage">
							<c:choose>
								<c:when test="${not empty listimages }">
									<c:forEach items="${listimages}" var="image">
										<li><img class="etalage_source_image"
											src="${pageContext.request.contextPath}/resources/files/${image.name}" />
											<img class="etalage_source_image"
											src="${pageContext.request.contextPath}/resources/files/${image.name}" />
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
							no Images
							</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<div class="details-left-info">
						<div class="details-right-head">
							<h1>${product.name }</h1>
							<p class="product-detail-info">${product.description }</p>
							<div class="product-more-details">
								<ul class="price-avl">
									<li class="price"><span>${product.price }</span><label>${product.price }</label></li>
									<div class="clear"></div>
								</ul>
								<ul class="product-colors">
									<h3>Màu sắc</h3>
									<li><div class="form-group">
											<label> </label> <select id="color">
												<c:forEach items="${listcolors}" var="color">
													<option value="${ color.id }">${ color.name }</option>
												</c:forEach>
											</select>
										</div></li>

									<div class="clear"></div>
								</ul>
								<ul class="prosuct-qty">
									<span>Size:</span>
									<select id="size">
										<c:choose>
											<c:when test="${not empty listsizes }">
												<c:forEach items="${listsizes }" var="size">
													<option value="${size.id}">${size.size }</option>
												</c:forEach>

											</c:when>
											<c:otherwise>
										Hết hàng
										</c:otherwise>
										</c:choose>

									</select>
								</ul>
								<%
									if (session.getAttribute("userLogin") != null){
								%>
								<a href="javascript:void(0)" onclick="addToCart(${product.id})">Add
									to Cart</a>
								<% }else { %>
								<a href="${pageContext.request.contextPath}/login" >Login to buy</a>
								<% } %>
								<ul class="product-share">
									<h3>All so Share On</h3>
									<ul>
										<li><a class="share-face" href="#"><span> </span> </a></li>
										<li><a class="share-twitter" href="#"><span> </span>
										</a></li>
										<li><a class="share-google" href="#"><span> </span> </a></li>
										<li><a class="share-rss" href="#"><span> </span> </a></li>
										<div class="clear"></div>
									</ul>
								</ul>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="details-right">
					<a href="#">SEE MORE</a>
				</div>
				<div class="clear"></div>
			</div>
			<!----product-rewies---->
			<div class="product-reviwes">
				<div class="wrap">
					<div id="verticalTab">
						<ul class="resp-tabs-list">
							<li>Description</li>
							<li>Product tags</li>
							<li>Product reviews</li>
						</ul>
						<div class="resp-tabs-container vertical-tabs">
							<div>
								<h3>Details</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Vestibulum nibh urna, euismod ut ornare non, volutpat vel
									tortor. Integer laoreet placerat suscipit. Sed sodales
									scelerisque commodo. Nam porta cursus lectus. Proin nunc erat,
									gravida a facilisis quis, ornare id lectus. Proin consectetur
									nibh quis urna gravida mollis.</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Vestibulum nibh urna, euismod ut ornare non, volutpat vel
									tortor</p>
							</div>
							<div>
								<h3>Product Tags</h3>
								<h4>Add Your Tags:</h4>
								<form>
									<input type="text"> <input type="submit"
										value="ADD TAGS" /> <span>Use spaces to separate tags.
										Use single quotes (') for phrases.</span>
								</form>
							</div>
							<div id="loadComment">
								<h3>Customer Reviews</h3>
								<c:choose>
									<c:when test="${ not empty listComments }">
										<c:forEach items="${listComments}" var="comment">
								Người đăng:
								<c:set var="c" value="1"></c:set>
											<c:forEach items="${listUsers }" var="u">
												<c:if test="${comment.user_id==u.id  && c==1}"> ${u.fullname}
								<c:set var="c" value="2"></c:set>
												</c:if>
											</c:forEach>
								-------Ngày đăng: ${comment.date}
								<br>
											<br>
											<div id="rating">
												<input type="radio" id="star5"
													<c:if test="${ comment.rate== 5 }">checked</c:if> readonly />
												<label class="full" for="star5" title="Awesome - 5 stars"></label>
												<input type="radio" id="star4"
													<c:if test="${ comment.rate== 4 }">checked</c:if> /> <label
													class="full" for="star4" title="Pretty good - 4 stars"></label>
												<input type="radio" id="star3"
													<c:if test="${ comment.rate== 3 }">checked</c:if> /> <label
													class="full" for="star3" title="Meh - 3 stars"></label> <input
													type="radio" id="star2"
													<c:if test="${ comment.rate== 2 }">checked</c:if> /> <label
													class="full" for="star2" title="Kinda bad - 2 stars"></label>
												<input type="radio" id="star1"
													<c:if test="${ comment.rate== 1 }">checked</c:if> /> <label
													class="full" for="star1" title="Sucks big time - 1 star"></label>
											</div>
											<div class="form-group">
												<br> <br> Bình luận: <input
													value="${comment.content }" readonly />
											</div>
											<hr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>There are no customer reviews yet.</p>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
		</c:if>



		<div class="clear"></div>
		<hr>
		<%
						if (session.getAttribute("userLogin") != null){
							User u = (User) session.getAttribute("userLogin");
		%>
		<div class="comment-p">
			<div class="comment-left">
				<h2>Đánh giá và nhận xét</h2>
				<form action="comment" method="post" enctype="multipart/form-data"
					onsubmit="return check_field(0)">
					<div id="rating">
						<span>Chọn đánh giá của bạn:</span> <input type="radio" id="star5"
							name="rating" value="5" checked /> <label class="full"
							for="star5" title="Awesome - 5 stars"></label> <input
							type="radio" id="star4" name="rating" value="4" /> <label
							class="full" for="star4" title="Pretty good - 4 stars"></label> <input
							type="radio" id="star3" name="rating" value="3" /> <label
							class="full" for="star3" title="Meh - 3 stars"></label> <input
							type="radio" id="star2" name="rating" value="2" /> <label
							class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
							type="radio" id="star1" name="rating" value="1" /> <label
							class="full" for="star1" title="Sucks big time - 1 star"></label>
					</div>
					<br> <br>
					<div>
						<textarea name="user_content" placeholder="Nội dung bình luận"
							id="comment" rows="5" cols="50"></textarea>
					</div>
					<input type="button"
						onclick="addComment(<%= u.getId() %>,${product.id })"
						value="Gửi bình luận" class="btn btn-green" />
				</form>
			</div>
		</div>
		<% } %>
		<!--- start-similar-products--->
		<div class="similar-products">
			<div class="similar-products-left">
				<h3>SIMILAR PRODUCTS</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<c:choose>
				<c:when test="${ not empty similarProducts }">
					<c:forEach items="${similarProducts }" var="sproduct">
						<c:if test="${ product.id != sproduct.id }">
							<div class="similar-products-right">
								<div id="owl-demo" class="owl-carousel">
									<div class="item">
										<div class="product-grid fade sproduct-grid">
											<div class="product-pic">
												<a href="#"><img
													src="${pageContext.request.contextPath}/resources/files/${sproduct.string}"
													title="product-name" /></a>
												<p>
													<a href="#"><small>Nike</small> HYPERVENOM <small>Phantom</small>
														FG</a> <span>Men's Firm-Ground Football Boot</span>
												</p>
											</div>
											<div class="product-info">
												<div class="product-info-cust">
													<a
														href="${pageContext.request.contextPath}/detail/${sproduct.id}">Details</a>
												</div>
												<div class="product-info-price">
													<a href="#">&#163; ${sproduct.price}</a>
												</div>
												<div class="clear"></div>
											</div>
											<div class="more-product-info">
												<span> </span>
											</div>
										</div>
									</div>
								</div>
								<!----//End-img-cursual---->
							</div>
						</c:if>

					</c:forEach>
				</c:when>
			</c:choose>

			<div class="clear"></div>
		</div>
		<!--- //End-similar-products--->
	</div>
</div>
<div class="clear"></div>
<!--//vertical Tabs-->
<!----//product-rewies---->
<!---//End-product-details--->
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
				<p>Create one account to manage everything you do with Nike,
					from your shopping preferences to your Nike+ activity.</p>
				<a class="learn-more" href="#">Learn more</a>
			</div>
			<div class="clear"></div>
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
			<div class="clear"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
			function addToCart(idPro){
				var color = document.getElementById("color");
				var size = document.getElementById("size");
				$.ajax({
					url: '${pageContext.request.contextPath}/buy',
					type: 'POST',
					data: {
						"idColor": color.value,
						"idSize" : size.value,
						"aidPro" : idPro
					},
					success: function(data){
					$("#sizecart").text(data);
					alert("Thêm vào giỏ hàng thành công!");
					},
					error: function (erro){
							alert('Có lỗi xảy ra');
						}
					})
			}
			
			function addComment(uid,pid){
				var rating = $("input[type='radio'][name='rating']:checked").val();
				var comment = document.getElementById("comment").value;
				$.ajax({
					url: '${pageContext.request.contextPath}/comment',
					type: 'POST',
					data: {
						"uid": uid,
						"pid": pid,
						"rate" : rating,
						"comment" : comment
					},
					success: function(data){
					$('#loadComment').load(' #loadComment');
					alert("Thêm bình luận thành công");
					},
					error: function (erro){
							alert('Có lỗi xảy ra');
						}
					})
			}
</script>
<script
	src="${pageContext.request.contextPath}/resources/tshoes/js/jstarbox.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/tshoes/css/jstarbox.css"
	type="text/css" media="screen" charset="utf-8" />
<script type="text/javascript">
					jQuery(function() {
						jQuery('.starbox')
								.each(
										function() {
											var starbox = jQuery(this);
											starbox
													.starbox(
															{
																average : starbox
																		.attr('data-start-value'),
																changeable : starbox
																		.hasClass('unchangeable') ? false
																		: starbox
																				.hasClass('clickonce') ? 'once'
																				: true,
																ghosting : starbox
																		.hasClass('ghosting'),
																autoUpdateAverage : starbox
																		.hasClass('autoupdate'),
																buttons : starbox
																		.hasClass('smooth') ? false
																		: starbox
																				.attr('data-button-count') || 5,
																stars : starbox
																		.attr('data-star-count') || 5
															})
													.bind(
															'starbox-value-changed',
															function(event,
																	value) {
																if (starbox
																		.hasClass('random')) {
																	var val = Math
																			.random();
																	starbox
																			.next()
																			.text(
																					' '
																							+ val);
																	return val;
																}
															})
										});
					});
				</script>
<script>
	jQuery(document)
			.ready(
					function($) {

						$('#etalage')
								.etalage(
										{
											thumb_image_width : 300,
											thumb_image_height : 400,
											source_image_width : 900,
											source_image_height : 1000,
											show_hint : true,
											click_callback : function(
													image_anchor, instance_id) {
												alert('Callback example:\nYou clicked on an image with the anchor: "'
														+ image_anchor
														+ '"\n(in Etalage instance: "'
														+ instance_id + '")');
											}
										});
						// This is for the dropdown list example:
						$('.dropdownlist').change(
								function() {
									etalage_show($(this)
											.find('option:selected').attr(
													'class'));
								});

					});
</script>
<script
	src="${pageContext.request.contextPath }/resources/tshoes/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true, // 100% fit in a container
			closed : 'accordion', // Start closed if in accordion view
			activate : function(event) { // Callback function if tab is switched
				var $tab = $(this);
				var $info = $('#tabInfo');
				var $name = $('span', $info);
				$name.text($tab.text());
				$info.show();
			}
		});

		$('#verticalTab').easyResponsiveTabs({
			type : 'vertical',
			width : 'auto',
			fit : true
		});
	});
</script>