<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/tshoes/css/css2/bootstrap.min.css">
<!-- End Top Search -->
<!-- Start All Title Box -->
<div class="all-title-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>Checkout</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Shop</a></li>
					<li class="breadcrumb-item active">Checkout</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End All Title Box -->

<!-- Start Cart  -->
<div class="cart-box-main">
	<div class="container">
		<div class="row new-account-login">
			<div class="col-sm-6 col-lg-6 mb-3">
				<form class="mt-3 collapse review-form-box" id="formLogin">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="InputUsername" class="mb-0">User name</label> <input
								type="text" class="form-control" id="username"
								placeholder="Enter Username">
						</div>
						<div class="form-group col-md-6">
							<label for="InputPassword" class="mb-0">Password</label> <input
								type="password" class="form-control" id="password"
								placeholder="Password">
						</div>
					</div>
					<button type="submit" class="btn hvr-hover" id="login">Login</button>
				</form>
			</div>
			<div class="col-sm-6 col-lg-6 mb-3">
				<form class="mt-3 collapse review-form-box" id="formRegister">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="InputName" class="mb-0">User Name</label> <input
								type="text" class="form-control" id="rusername"
								placeholder="UserName">
						</div>
						<div class="form-group col-md-6">
							<label for="InputLastname" class="mb-0">Full Name</label> <input
								type="text" class="form-control" id="fullname"
								placeholder="FullName">
						</div>
						<div class="form-group col-md-6">
							<label for="InputEmail1" class="mb-0">Mobile</label> <input
								type="text" class="form-control" id="mobile"
								placeholder="Enter Mobile">
						</div>
						<div class="form-group col-md-6">
							<label for="InputPassword1" class="mb-0">Password</label> <input
								type="password" class="form-control" id="rpassword"
								placeholder="Password">
						</div>
						<div class="form-group col-md-6">
							<label for="InputLastname" class="mb-0">Address</label> <input
								type="text" class="form-control" id="address"
								placeholder="Address">
						</div>
						<div class="form-group col-md-6">
							<label for="InputLastname" class="mb-0">Gender</label> <input
								type="radio" name="gender" class="form-control" id="gender"
								placeholder="gender" value="Nam"> Nam <input
								type="radio" name="gender" class="form-control" id="gender"
								placeholder="gender" value="Nu"> Nu
						</div>
					</div>
					<button type="submit" class="btn hvr-hover" id="register">Register</button>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-lg-6 mb-3">
				<div class="checkout-address">
					<div class="title-left">
						<h3>Billing address</h3>
					</div>
					<form class="needs-validation" novalidate>

						<div class="mb-3">
							<label for="username">Fullname *</label>
							<div class="input-group">
								<input type="text" class="form-control" id="username"
									placeholder="" value="${ user.fullname }">
								<div class="invalid-feedback" style="width: 100%;">Your
									FULL Name is required.</div>
							</div>
						</div>
						<div class="mb-3"></div>
						<div class="mb-3">
							<label for="address">Address *</label> <input type="text"
								class="form-control" value="${ user.address }" placeholder=""
								required>
							<div class="invalid-feedback">Please enter your shipping
								address.</div>
						</div>
						<div class="mb-3"></div>
						<hr class="mb-4">
						<hr class="mb-4">
						<div class="title">
							<span>Payment</span>
						</div>
						<div class="d-block my-3">
							<div class="custom-control custom-radio">
								<input id="credit" name="paymentMethod" type="radio"
									class="custom-control-input" checked required> <label
									class="custom-control-label" for="credit">Credit card</label>
							</div>
							<div class="custom-control custom-radio">
								<input id="debit" name="paymentMethod" type="radio"
									class="custom-control-input" required> <label
									class="custom-control-label" for="debit">Debit card</label>
							</div>
							<div class="custom-control custom-radio">
								<input id="paypal" name="paymentMethod" type="radio"
									class="custom-control-input" required> <label
									class="custom-control-label" for="paypal">Paypal</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="cc-name">Name on card</label> <input type="text"
									class="form-control" id="cc-name" placeholder="" required>
								<small class="text-muted">Full name as displayed on card</small>
								<div class="invalid-feedback">Name on card is required</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="cc-number">Credit card number</label> <input
									type="text" class="form-control" id="cc-number" placeholder=""
									required>
								<div class="invalid-feedback">Credit card number is
									required</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3 mb-3">
								<label for="cc-expiration">Expiration</label> <input type="text"
									class="form-control" id="cc-expiration" placeholder="" required>
								<div class="invalid-feedback">Expiration date required</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="cc-expiration">CVV</label> <input type="text"
									class="form-control" id="cc-cvv" placeholder="" required>
								<div class="invalid-feedback">Security code required</div>
							</div>
						</div>
						<hr class="mb-1">
					</form>
				</div>
			</div>
			<div class="col-sm-6 col-lg-6 mb-3">
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="shipping-method-box">
							<div class="title-left">
								<h3>Shipping Method</h3>
							</div>
							<div class="mb-4">
								<div class="custom-control custom-radio">
									<input id="shippingOption1" name="shipping-option"
										class="custom-control-input" checked="checked" type="radio">
									<label class="custom-control-label" for="shippingOption1">Standard
										Delivery</label> <span class="float-right font-weight-bold">FREE</span>
								</div>
								<div class="ml-4 mb-2 small">(3-7 business days)</div>
								<div class="custom-control custom-radio">
									<input id="shippingOption2" name="shipping-option"
										class="custom-control-input" type="radio"> <label
										class="custom-control-label" for="shippingOption2">Express
										Delivery</label> <span class="float-right font-weight-bold">$10.00</span>
								</div>
								<div class="ml-4 mb-2 small">(2-4 business days)</div>
								<div class="custom-control custom-radio">
									<input id="shippingOption3" name="shipping-option"
										class="custom-control-input" type="radio"> <label
										class="custom-control-label" for="shippingOption3">Next
										Business day</label> <span class="float-right font-weight-bold">$20.00</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-12">
						<div class="odr-box">
							<div class="title-left">
								<h3>Shopping cart</h3>
							</div>
							<div class="rounded p-2 bg-light">
								<div class="media mb-2 border-bottom">
									<div class="media-body">
										<a href="detail.html"> Lorem ipsum dolor sit amet</a>
										<div class="small text-muted">
											Price: $80.00 <span class="mx-2">|</span> Qty: 1 <span
												class="mx-2">|</span> Subtotal: $80.00
										</div>
									</div>
								</div>
								<div class="media mb-2 border-bottom">
									<div class="media-body">
										<a href="detail.html"> Lorem ipsum dolor sit amet</a>
										<div class="small text-muted">
											Price: $60.00 <span class="mx-2">|</span> Qty: 1 <span
												class="mx-2">|</span> Subtotal: $60.00
										</div>
									</div>
								</div>
								<div class="media mb-2">
									<div class="media-body">
										<a href="detail.html"> Lorem ipsum dolor sit amet</a>
										<div class="small text-muted">
											Price: $40.00 <span class="mx-2">|</span> Qty: 1 <span
												class="mx-2">|</span> Subtotal: $40.00
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-12">
						<div class="order-box">
							<div class="title-left">
								<h3>Your order</h3>
							</div>
							<div class="d-flex">
								<div class="ml-auto font-weight-bold">Total</div>
							</div>
							<div class="d-flex gr-total">
								<h5>Grand Total ($)</h5>
								<div class="ml-auto h5" id="pricePay">${ order.total}</div>
							</div>
							<hr>
						</div>

					</div>
					<div style="width: 200px">
						<div id="paypal-button"></div>
					</div>
					<a class="btn btn-success btn-md" href="${pageContext.request.contextPath}/index" >Trả sau</a>
				</div>
			</div>
		</div>

	</div>
</div>
<script>
$(document).ready(function () {
	
	 paypal.Button.render({
		    // Configure environment
		    env: 'sandbox',
		    client: {
		      sandbox: 'AVYVKrTT2TaPaoEU7vwpUbQ0wnrMI_kQsRLP5r8AcQ8hpC2OEDjO8fS-Xjl42D6Qo3fR_8mKjB6Et3EH',
		      production: 'demo_production_client_id'
		    },
		    // Customize button (optional)
		    locale: 'en_US',
		    style: {
		      size: 'small',
		      color: 'gold',
		      shape: 'pill',
		    },
		    // Enable Pay Now checkout flow (optional)
		    commit: true,
		
		    // Set up a payment
			payment: function(data, actions) {
				var pricePay = $("#pricePay").text();
				console.log(pricePay);
				return actions.payment.create({
				    transactions: [{
				      amount: {
				        total: pricePay,
				        currency: 'USD'
				      }
			    }]
			  });
			},
		    // Execute the payment
		    onAuthorize: function(data, actions) {
		      return actions.payment.execute().then(function() {
		        // Show a confirmation message to the buyer
				var r = confirm("Cảm ơn bạn  đã mua sản phẩm chủa TShoes!\nVui lòng nhấn 'OK' để xác nhận đơn hàng.");
				if (r == true) {
					window.location.href="http://localhost:8080/tshoes/success?id=${order.id}";
				} else {
					window.location.href="http://localhost:8080/tshoes/checkout";
				}
		      });
		    }
		  },'#paypal-button');
	
	
	});
	  </script>
	  
