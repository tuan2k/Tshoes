<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="col-md-10">
	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý danh mục</div>
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
			<form action="${pageContext.request.contextPath}/admin/cat/search">
			<div class="col-md-4">
				<div class="input-group form">
					<input type="text" class="form-control" placeholder="Search..." name="search">
					<span class="input-group-btn">
						<input type="submit" value="Search" class="btn btn-primary" type="button"/>
					</span>
				</div>
			</div>
			</form>
		</div>

		<div class="row">
			<div class="panel-body">

				<c:choose>
					<c:when test="${not empty listcats }">
						<table cellpadding="0" cellspacing="0" border="0"
							class="table table-striped table-bordered" id="example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Parent id</th>
									<th>Tên</th>
									<th width="30%">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listcats}" var="cat">
								<tr class="odd gradeX">
									<td>${cat.id }</td>
									<td>${cat.parent_id }</td>
									<td>${cat.name }</td>
									<td class="center text-center">
									<a href="edit/${ cat.id }" title=""class="btn btn-primary">
									<span class="glyphicon glyphicon-pencil "></span> Sửa</a>
									
									<a href="delete/${ cat.id }" title="" class="btn btn-danger">
									 <span class="glyphicon glyphicon-trash"></span> Xóa</a>
									 
									 </td>
								</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p class="msg">Empty categories</p>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->



</div>