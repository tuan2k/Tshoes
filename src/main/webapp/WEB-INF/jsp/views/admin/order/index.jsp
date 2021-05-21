<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="col-md-10">
	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý đặt hàng</div>
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
			<form action="${pageContext.request.contextPath}/admin/order/search">
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
					<c:when test="${not empty listorders }">
						<table cellpadding="0" cellspacing="0" border="0"
							class="table table-striped table-bordered" id="example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên khách hàng</th>
									<th>Tổng tiền($)</th>
									<th>Ngày mua</th>
									<th>Trạng thái thanh toán</th>
									<th>Ghi chú</th>
									<th width="30%">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listorders}" var="order">
								<tr class="odd gradeX">
									<td>${order.id }</td>
									<td>
									<c:set var="k" value="1"></c:set>
									<c:forEach items="${listusers }" var="user">
									<c:if test="${ user.id== order.user_id && k==1 }"> ${user.fullname }
									<c:set var="k" value="2"></c:set>
									</c:if>
									</c:forEach>
									</td>
									<td>${order.total }</td>
									<td>${order.date }</td>
									<td>${order.status }</td>
									<td>${order.note }</td>
									<td class="center text-center">
									<a href="view/${ order.id }" title=""class="btn btn-primary">
									<span></span> Xem</a>
									<a href="edit/${ order.id }" title=""class="btn btn-primary">
									<span class="glyphicon glyphicon-pencil "></span> Sửa</a>
									
									<a href="delete/${ order.id }" title="" class="btn btn-danger">
									 <span class="glyphicon glyphicon-trash"></span> Xóa</a>
									 
									 </td>
								</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p class="msg">Empty colors</p>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->



</div>