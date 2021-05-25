<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<style>
.pagination{margin-bottom:15px;}
.pagination ul{text-align: center;}
.pagination ul li{display: inline-block;margin-right: 3px;}
.pagination ul li a{background: none repeat scroll 0 0 #e7e7e7;
color: #999;
padding: 5px 8px;}
.pagination ul li a:hover{background:#464646;color:#fff;}
.work_pagination {width:98%;margin-left:15px;}
.work_pagination .newer,.work_pagination .older{background: none repeat scroll 0 0 #454545;
color: #ffd500;
display: block;
font-family: oswald;
padding: 10px;}
.work_pagination .newer:hover,.work_pagination .older:hover{background:#222;}
</style>
<div class="img-slider">
		<div class="wrap">
			<ul id="jquery-demo">
				<li>
					<a href="#slide1">
						<img src="${pageContext.request.contextPath}/resources/tshoes/images/slide-1.jpg" alt="" />
					</a>
					<div class="slider-detils">
						<h3>MENS FOOT BALL <label>BOOTS</label></h3>
						<span>Stay true to your team all day, every day, game day.</span>
						<a class="slide-btn" href="details.html"> Shop Now</a>
					</div>
				</li>
				<li>
					<a href="#slide2">
						<img src="${pageContext.request.contextPath}/resources/tshoes/images/slide-4.jpg" alt="" />
					</a>
					<div class="slider-detils">
						<h3>MENS FOOT BALL <label>BOOTS</label></h3>
						<span>Stay true to your team all day, every day, game day.</span>
						<a class="slide-btn" href="details.html"> Shop Now</a>
					</div>
				</li>
				<li>
					<a href="#slide3">
						<img src="${pageContext.request.contextPath}/resources/tshoes/images/slide-1.jpg" alt="" />
					</a>
					<div class="slider-detils">
						<h3>MENS FOOT BALL <label>BOOTS</label></h3>
						<span>Stay true to your team all day, every day, game day.</span>
						<a class="slide-btn" href="details.html"> Shop Now</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="clear"> </div>
	<!----//End-image-slider---->
	<!----start-price-rage--->
	<div class="alert alert-success" role="alert">
			${ msg}
	</div>
	<div class="wrap">
		<div class="price-rage">
			<h3>Weekly selection:</h3>
			<div id="slider-range">
			</div>
		</div>
	</div>
	<!----//End-price-rage--->
	<!--- start-content---->
	<div class="content">
		<div class="wrap">
			<div class="content-left">
				<div class="content-left-top-grid">
					<div class="content-left-price-selection">
						<h4>Select Price:</h4>
						<div class="price-selection-tree">
							<span class="col_checkbox">
								<input id="10" class="css-checkbox10" type="checkbox">
								<label class="normal"><i for="10" name="demo_lbl_10" class="css-label10"> </i>
									400</label>
							</span>
							<span class="col_checkbox">
								<input id="11" class="css-checkbox11" type="checkbox">
								<label class="active1"><i for="11" name="demo_lbl_11" class="css-label11">
									</i>350</label>
							</span>
							<span class="col_checkbox">
								<input id="12" class="css-checkbox12" type="checkbox">
								<label class="normal"><i for="12" name="demo_lbl_12" class="css-label12"> </i>
									300</label>
							</span>
							<span class="col_checkbox">
								<input id="13" class="css-checkbox13" type="checkbox">
								<label class="normal"><i for="13" name="demo_lbl_13" class="css-label13">
									</i>250</label>
							</span>
							<span class="col_checkbox">
								<input id="14" class="css-checkbox14" type="checkbox">
								<label class="normal"><i for="14" name="demo_lbl_14" class="css-label14"> </i>
									200</label>
							</span>
							<span class="col_checkbox">
								<input id="15" class="css-checkbox15" type="checkbox">
								<label class="normal"><i for="15" name="demo_lbl_15" class="css-label15">
									</i>150</label>
							</span>
						</div>

					</div>
				</div>
				<div class="content-left-bottom-grid">
					<h4>Boys Football:</h4>
					<div class="content-left-bottom-grids">
						<div class="content-left-bottom-grid1">
							<img src="${pageContext.request.contextPath}/resources/tshoes/images/foot-ball.jpg" title="football" />
							<h5><a href="details.html">Nike Strike PL Hi-Vis</a></h5>
							<span> Football</span>
							<label>&#163; 375</label>
						</div>
						<div class="content-left-bottom-grid1">
							<img src="${pageContext.request.contextPath}/resources/tshoes/images/jarse.jpg" title="jarse" />
							<h5><a href="details.html">Nike Strike PL Hi-Vis</a></h5>
							<span> Football</span>
							<label>&#163; 375</label>
						</div>
					</div>
				</div>
			</div>
			<div class="content-right">
				<div class="product-grids">
					<!--- start-rate---->
					<script src="${pageContext.request.contextPath}/resources/tshoes/js/jstarbox.js"></script>
					<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/tshoes/css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
					<script type="text/javascript">
						jQuery(function () {
							jQuery('.starbox').each(function () {
								var starbox = jQuery(this);
								starbox.starbox({
									average: starbox.attr('data-start-value'),
									changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
									ghosting: starbox.hasClass('ghosting'),
									autoUpdateAverage: starbox.hasClass('autoupdate'),
									buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
									stars: starbox.attr('data-star-count') || 5
								}).bind('starbox-value-changed', function (event, value) {
									if (starbox.hasClass('random')) {
										var val = Math.random();
										starbox.next().text(' ' + val);
										return val;
									}
								})
							});
						});
					</script>
					<!---//End-rate---->
					<!---caption-script---->
					<!---//caption-script---->
					<c:choose>
					<c:when test="${ not empty listproducts }">
					<c:forEach items="${listproducts}" var="product">
					<div class="product-grid fade">
						<div class="product-grid-head">
							<ul class="grid-social">
								<li><a class="facebook" href="#"><span> </span></a></li>
								<li><a class="twitter" href="#"><span> </span></a></li>
								<li><a class="googlep" href="#"><span> </span></a></li>
								<div class="clear"> </div>
							</ul>
						</div>
						<div class="product-pic">
							<a href="#"><img src="${pageContext.request.contextPath}/resources/files/${product.string}" title="product-name" /></a>
							<p>
								<a href="${pageContext.request.contextPath}"><small>Nike</small> HYPERVENOM <small>Phantom</small> FG</a>
								<span>Men's Firm-Ground Football Boot</span>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="${pageContext.request.contextPath}/detail/${product.id}">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">&#163; ${product.price }</a>
							</div>
							<div class="clear"> </div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					</c:forEach>
					
					</c:when>
					<c:otherwise>
					Empty product
					</c:otherwise>
					</c:choose>
					
					
					<div class="clear"> </div>
				</div>
			</div>
			<div class="clear"> </div>
		</div>
	</div>
	<div class="pagination">
	<c:if test="${not empty search}">
	<c:if test="${not empty totalPage}">
		<nav class="text-center" aria-label="...">
			<ul>
				<c:set value="0" var="k"></c:set>
				<c:forEach begin="1" end="${totalPage}" var="i">
					<c:if test="${ k == 0}">
						<c:choose>
							<c:when test="${currentPage > 1 }">
								<li><a
									href="${pageContext.request.contextPath }/${currentPage-1}/search?search=${search}"
									aria-label="Previous"><span aria-hidden="true">«</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath }/1/search?search=${search}"
									aria-label="Previous"><span aria-hidden="true">«</span></a></li>
							</c:otherwise>
						</c:choose>
						<c:set value="1" var="k"></c:set>
					</c:if>
					<li class="<c:if test="${ i == currentPage }">active</c:if>">
					<c:if test="${i != currentPage }">
					<a
						href="${pageContext.request.contextPath }/${i}/search?search=${search}">${i }
					</a>
					</c:if>
					<c:if test="${i == currentPage }">
					<a
						href="${pageContext.request.contextPath }/${i}//search?search=${search}">${i }
							<span class="sr-only">(current)</span>
					</a>
					</c:if>
					</li>
					<c:if test="${ i == totalPage}">
						<c:choose>
							<c:when test="${currentPage < totalPage }">
								<li><a
									href="${pageContext.request.contextPath }/${currentPage+1}/search?search=${search}"
									aria-label="Next"><span aria-hidden="true">»</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath }/${totalPage}/search?search=${search}"
									aria-label="Next"><span aria-hidden="true">»</span></a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>

			</ul>
		</nav>
	</c:if>
	</c:if>
	
	<c:if test="${empty search}">
	<c:if test="${not empty totalPage}">
		<nav class="text-center" aria-label="...">
			<ul>
				<c:set value="0" var="k"></c:set>
				<c:forEach begin="1" end="${totalPage}" var="i">
					<c:if test="${ k == 0}">
						<c:choose>
							<c:when test="${currentPage > 1 }">
								<li><a
									href="${pageContext.request.contextPath }/${currentPage-1}"
									aria-label="Previous"><span aria-hidden="true">«</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath }/1"
									aria-label="Previous"><span aria-hidden="true">«</span></a></li>
							</c:otherwise>
						</c:choose>
						<c:set value="1" var="k"></c:set>
					</c:if>
					<li class="<c:if test="${ i == currentPage }">active</c:if>">
					<c:if test="${i != currentPage }">
					<a
						href="${pageContext.request.contextPath }/${i}">${i }
					</a>
					</c:if>
					<c:if test="${i == currentPage }">
					<a
						href="${pageContext.request.contextPath }/${i}">${i }
							<span class="sr-only">(current)</span>
					</a>
					</c:if>
					</li>
					<c:if test="${ i == totalPage}">
						<c:choose>
							<c:when test="${currentPage < totalPage }">
								<li><a
									href="${pageContext.request.contextPath }/${currentPage+1}"
									aria-label="Next"><span aria-hidden="true">»</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath }/${totalPage}"
									aria-label="Next"><span aria-hidden="true">»</span></a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>

			</ul>
		</nav>
	</c:if>
	</c:if>
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