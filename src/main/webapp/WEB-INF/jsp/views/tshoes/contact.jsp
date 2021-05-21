<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<div class="content contact-main">
		<!----start-contact---->
		<div class="contact-info">
			<div class="map">
				<iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
					src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a
						href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265"
						style="color:#666;text-align:left;font-size:12px"></a></small>
			</div>
			<div class="wrap">
				<div class="contact-grids">
					<div class="col_1_of_bottom span_1_of_first1">
						<h5>Address</h5>
						<ul class="list3">
							<li>
								<img src="${pageContext.request.contextPath}/resources/tshoes/images/home.png" alt="">
								<div class="extra-wrap">
									<p>Lorem ipsum consectetu,<br>dolor sit amet,.</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="col_1_of_bottom span_1_of_first1">
						<h5>Phones</h5>
						<ul class="list3">
							<li>
								<img src="${pageContext.request.contextPath}/resources/tshoes/images/phone.png" alt="">
								<div class="extra-wrap">
									<p><span>Telephone:</span>+1 800 258 2598</p>
								</div>
								<img src="${pageContext.request.contextPath}/resources/tshoes/images/fax.png" alt="">
								<div class="extra-wrap">
									<p><span>FAX:</span>+1 800 589 2587</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="col_1_of_bottom span_1_of_first1">
						<h5>Email</h5>
						<ul class="list3">
							<li>
								<img src="${pageContext.request.contextPath}/resources/tshoes/images/email.png" alt="">
								<div class="extra-wrap">
									<p><span class="mail"><a href="mailto:yoursite.com">info(at)spikeshoe.com</a></span>
									</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<form method="post" action="contact-post.html">
					<div class="contact-form">
						<div class="contact-to">
							<input type="text" class="text" value="Name..." onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Name...';}">
							<input type="text" class="text" value="Email..." onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Email...';}">
							<input type="text" class="text" value="Subject..." onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Subject...';}">
						</div>
						<div class="text2">
							<textarea value="Message:" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Message';}">Message..</textarea>
						</div>
						<span><input type="submit" class="" value="Submit"></span>
						<div class="clear"></div>
					</div>
				</form>
			</div>
		</div>
		<!----//End-contact---->
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