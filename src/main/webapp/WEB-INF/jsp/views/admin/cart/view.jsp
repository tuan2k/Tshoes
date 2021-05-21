<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="col-md-10">
	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Sửa màu sắc</div>
			</div>
			<br> <br>
			<c:if test="${not empty msg }">
			<div class="alert alert-danger" role="alert">
			${ msg}
			</div>
			</c:if>
			<div class="content-box-large box-with-header">
				<div>
					<div class="row mb-10"></div>

					<div class="row">
						<div class="col-sm-6">
							<c:choose>
								<c:when test="${not empty order }">
									<div class="row">
										<div class="col-md-12 panel-info">
											<form method="post" action="${pageContext.request.contextPath}/admin/order/edit">
												<input name="id" type="hidden" value="${order.id }" />
												 userid : <input name="user_id" value="${order.user_id }"
													type="text" /><br />
													<hr>
												 total : <input name="total" value="${order.total}"
													type="text" /><br />
													<hr>
												 status : <input name="status" value="${order.status }"
													type="text" /><br />
													<hr>
												 note  : <input name="note" value="${order.note }"
													type="text" /><br />
													<hr>
											 <input name="submit" value="Lưu"
													type="submit" />
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