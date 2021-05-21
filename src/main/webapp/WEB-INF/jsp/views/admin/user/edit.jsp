<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="col-md-10">

	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Sửa người sử dụng</div>
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
								<c:when test="${not empty user }">
									<form method="post" action="${pageContext.request.contextPath}/admin/user/edit">
										<div class="col-sm-6">
										<input name="id" type="hidden" value="${user.id }" />
											<div class="form-group">
												<label for="name">Tên đăng nhập:</label> <input type="text"
													name="username" class="form-control"  value="${user.username }"
													placeholder="Nhập tên đăng nhập">
											</div>

											<div class="form-group">
												<label for="name">Mật khẩu:</label> <input type="password"
													name="npassword" class="form-control" value=""
													placeholder="Nhập mật khẩu mới">
											</div>
											<div class="form-group">
												<label for="name">Họ và tên: </label> <input type="text"
													name="fullname" class="form-control" value="${user.fullname }"
													placeholder="Nhập mật khẩu">
											</div>
										</div>
										<div class="col-sm-12">
											<input type="submit" value="Sửa" class="btn btn-success" />
											<input type="reset" value="Nhập lại" class="btn btn-default" />
										</div>

									</form>
								</c:when>
								<c:otherwise>
									<p class="msg">Empty news</p>
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