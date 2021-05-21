<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="col-md-10">
	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Thông tin đơn hàng</div>
			</div>
			<br> <br>
			<c:if test="${not empty msg }">
				<div class="alert alert-danger" role="alert">${ msg}</div>
			</c:if>
			<div class="content-box-large box-with-header">
				<div>
					<div class="row mb-10"></div>
					<h4><a href="${pageContext.request.contextPath }/admin/order/index">HOME</a></h4>
					<br>
					<div class="row">
						<div class="col-sm-12">
							<c:choose>
								<c:when test="${not empty order }">
									<c:choose>
										<c:when test="${not empty listCarts }">
											<table cellpadding="0" cellspacing="0" border="0"
												class="table table-striped table-bordered" id="example">
												<thead>
													<tr>
														<th>Mã sản phẩm</th>
														<th>Mã đơn hàng</th>
														<th>Màu sắc</th>
														<th>Kích cỡ</th>
														<th>Tên sản phẩm</th>
														<th>Giá($)</th>
														<th>Số lượng</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listCarts}" var="cart">
														<tr class="odd gradeX">
															<td>${cart.id }</td>
															<td>${cart.order_id }</td>

															<td>
																<c:set var="ll" value="1"></c:set>
																<c:forEach items="${listColors}" var="color">
																<c:if test="${ color.id == cart.color_id && ll==1 }">${color.name }
																<c:set var="ll" value="2"></c:set>
																</c:if>
																</c:forEach>
															</td>
															<td>
															<c:set var="l" value="1"></c:set>
																<c:forEach items="${listSizes}" var="size">
																<c:if test="${ size.id == cart.size_id && l==1 }">${size.size }
																<c:set var="l" value="2"></c:set>
																</c:if>
																</c:forEach>
															</td>
															<td>
															<c:set var="lll" value="1"></c:set>
																<c:forEach items="${listProducts}" var="product">
																<c:if test="${ product.id == cart.product_id && lll==1 }">${product.name }
																<c:set var="lll" value="2"></c:set>
																</c:if>
																</c:forEach>
															</td>
															<td>
															<c:set var="lll" value="1"></c:set>
																<c:forEach items="${listProducts}" var="product">
																<c:if test="${ product.id == cart.product_id && lll==1 }">${product.price }
																<c:set var="lll" value="2"></c:set>
																</c:if>
																</c:forEach>
															</td>
															<td>${cart.number }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<h2>Tổng tiền ($): <strong>${order.total }</strong></h2> 
										</c:when>
										<c:otherwise>
											<p class="msg">Empty Order cart</p>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<p class="msg">Empty orders</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.row col-size -->

</div>