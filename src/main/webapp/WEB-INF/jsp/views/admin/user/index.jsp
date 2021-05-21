<%@page import="edu.vinaenter.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="col-md-10">
	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý người dùng</div>
			</div>
			<br> <br>
			<c:if test="${not empty msg }">
			<div class="alert alert-success" role="alert">
			${ msg}
			</div>
			</c:if>
			
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<a href="add" class="btn btn-success"><span
					class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

			</div>
			<div class="col-md-4">
				<form action="${pageContext.request.contextPath}/admin/user/search">
				<div class="input-group form">
					<input type="text" class="form-control" placeholder="Search..." name="search">
					<span class="input-group-btn">
						<input class="btn btn-primary" type="submit" value="Search"/>
					</span>
				</div>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="panel-body">

				<c:choose>
					<c:when test="${not empty listusers }">
						<table cellpadding="0" cellspacing="0" border="0"
							class="table table-striped table-bordered" id="example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên</th>
									<th>Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listusers}" var="user">
									<tr class="odd gradeX">
										<td>${user.id }</td>
										<td>${user.username }</td>
										<c:if test="${ sessionScope.user.role_id == 1 }">
										<td class="center text-center"><a
											href="edit/${ user.id }" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Sửa
										</a> 
										<c:if test="${user.role_id != 1 }">
										<a href="delete/${ user.id }" title="" class="btn btn-danger">
												<span class="glyphicon glyphicon-trash"></span> Xóa
										</a>
										</c:if>
										</td>
										</c:if>
										<c:if test="${ sessionScope.user.role_id == 2  && user.id != 1}">
										<td class="center text-center"><a
											href="edit/${ user.id }" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Sửa
										</a>
										<c:if test="${ user.id != sessionScope.user.id }">
										<a href="delete/${ user.id }" title="" class="btn btn-danger">
												<span class="glyphicon glyphicon-trash"></span> Xóa
										</a>
										</c:if>
										</td>
										</c:if>
										<c:if test="${ sessionScope.user.role_id == 3 }">
										<td class="center text-center">
										<c:if test="${user.id == sessionScope.user.id }">
										<a
											href="edit/${ user.id }" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Sửa
										</a>
										</c:if>
										</td>
										</c:if>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p class="msg">Empty news</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->



</div>