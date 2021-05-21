<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="page-content container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-wrapper">
				<div class="box">
				<form action="${pageContext.request.contextPath }/admin/auth/login" method="post">
					<div class="content-wrap">
						<img width="100px" height="100px" class="img-circle"
							src="${pageContext.request.contextPath }/resources/admin/images/icon-180x180.png">
						<h6>Đăng nhập</h6>

						<div class="form-group">
							<label class="text-left pull-left" for="username">Tên
								đăng nhập</label> <input class="form-control" type="text"
								placeholder="Username" name ="username" required>
						</div>

						<div class="form-group">
							<label class="text-left pull-left" for="password">Mật
								khẩu</label> <input class="form-control" type="password"
								placeholder="Password" name="password" required>
						</div>
						
						<div class="form-group">
									<input type="submit" value="Login" class="btn btn-success" /> 
						</div>

					</div>
				</form>
				</div>

				<div class="already">
					<p>Don't have an account yet?</p>
					<a href="javascript:void(0)">Sign Up</a>
				</div>
			</div>
		</div>
	</div>
</div>