<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="col-md-10">
	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Thông tin sản phẩm</div>
			</div>
			<br> <br>
			<c:if test="${not empty msg }">
				<div class="alert alert-danger" role="alert">${ msg}</div>
			</c:if>
			<div class="content-box-large box-with-header">
				<div>
					<div class="row mb-10"></div>

					<div class="row">
						<div class="col-sm-6">
							<c:choose>
								<c:when test="${not empty product }">
									<div class="row">
										<div class="col-md-12 panel-info">
											<form method="post"
												action="${pageContext.request.contextPath}/admin/product/view">
												Tên sản phẩm : <input readonly value="${product.name }"
													type="text" /><br />
												<hr>
												Giá : <input readonly value="${product.price}"
													type="text" /><br />
												<hr>
												Số lượng : <input readonly value="${product.number }"
													type="text" /><br />
												<hr>
												<div class="form-group">
													<label>Màu sắc </label> <select class="form-control"
														name="color" multiple readonly>
														<c:forEach items="${listcolors}" var="color">
															<option value="${ color.id }">${ color.name }</option>
														</c:forEach>
													</select>
												</div>

												<div class="form-group">
													<label>Kích cỡ </label> <select class="form-control"
														name="size" multiple readonly>
														<c:forEach items="${listsizes}" var="size">
															<option value="${ size.id }">${ size.size }</option>
														</c:forEach>
													</select>
												</div>
												
												<div class="form-group">
													<label>Hình ảnh </label> 
														<c:forEach items="${listImages}" var="img">
															<img alt="product img" src="${pageContext.request.contextPath}/resources/files/${img.name}">
														<br> 
														</c:forEach>
												</div>
												
											</form>
										</div>
									</div>
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