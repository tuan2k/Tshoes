<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<div class="content product-box-main">
		<div class="wrap">
			<div class="content-left">
				<div class="content-left-top-brands">
					<h3>Categories</h3>
					<ul>
						<li><a href="#">ALL</a></li>
						<li><a href="#">WOMEN</a></li>
						<li><a href="#">NEW ARRIVALS</a></li>
						<li><a href="#">TRENDS</a></li>
						<li><a href="#">BOYS</a></li>
						<li><a href="#">GIRLS</a></li>
						<li><a href="#">SALE</a></li>
					</ul>
				</div>
				<div class="content-left-top-grid">
					<div class="content-left-price-selection content-left-top-brands-prices">
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
			</div>
			<div class="content-right product-box">
				<div class="product-box-head">
					<div class="product-box-head-left">
						<h3>Products <span>(500)</span></h3>
					</div>
					<div class="product-box-head-right">
						<ul>
							<li><span>Sort ::</span><a href="#"> </a></li>
							<li><label> </label> <a href="#"> Popular</a></li>
							<li><label> </label> <a href="#"> New</a></li>
							<li><label> </label> <a href="#"> Discount</a></li>
							<li><span>Price ::</span><a href="#">Low High</a></li>
						</ul>
					</div>
					<div class="clear"> </div>
				</div>
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
					// detail
					<div class="product-grid fade" onclick="location.href='details.html';">
						<div class="product-grid-head">
							<ul class="grid-social">
								<li><a class="facebook" href="#"><span> </span></a></li>
								<li><a class="twitter" href="#"><span> </span></a></li>
								<li><a class="googlep" href="#"><span> </span></a></li>
								<div class="clear"> </div>
							</ul>
							<div class="block">
								<div class="starbox small ghosting"> </div> <span> (46)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href="#"><img src="${pageContext.request.contextPath}/resources/tshoes/images/product1.jpg" title="product-name" /></a>
							<p>
								<a href="#"><small>Nike</small> HYPERVENOM <small>Phantom</small> FG</a>
								<span>Men's Firm-Ground Football Boot</span>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">&#163; 375</a>
							</div>
							<div class="clear"> </div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="clear"> </div>
				</div>
				<!----start-load-more-products---->
				<div class="loadmore-products">
					<a href="#">Loadmore</a>
				</div>
				<!----//End-load-more-products---->
			</div>
			<div class="clear"> </div>
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