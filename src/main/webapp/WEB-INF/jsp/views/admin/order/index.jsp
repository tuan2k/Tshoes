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
				
				<!-- Pagination -->
				<c:if test="${not empty search}">
				<c:if test="${not empty totalPage }">
				<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<c:set value="0" var="k"></c:set>
						<c:forEach begin="1" end="${totalPage}" var="i">
						<c:if test="${ k == 0}">
						<c:choose>
						<c:when test="${currentPage > 1 }">
						<li><a href="${pageContext.request.contextPath }/admin/order/${currentPage-1}/search?search=${search}" aria-label="Previous"><span
								aria-hidden="true">«</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/admin/order/1/search?search=${search}" aria-label="Previous"><span
								aria-hidden="true">«</span></a></li>
						</c:otherwise>
						</c:choose>
						<c:set value="1" var="k"></c:set>
						</c:if>
						<li class="<c:if test="${ i == currentPage }">active</c:if>">
						<a href="${pageContext.request.contextPath }/admin/order/${i}/search?search=${search}">${i } 
						<span class="sr-only">(current)</span></a></li>
						<c:if test="${ i == totalPage}">
						<c:choose>
						<c:when test="${currentPage < totalPage }">
						<li><a href="${pageContext.request.contextPath }/admin/order/${currentPage+1}/search?search=${search}" aria-label="Next"><span
								aria-hidden="true">»</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/admin/order/${totalPage}/search?search=${search}" aria-label="Next"><span
								aria-hidden="true">»</span></a></li>
						</c:otherwise>
						</c:choose>
						</c:if>
						</c:forEach>
					</ul>
				</nav>
				</c:if>
				</c:if>
				<c:if test="${empty search}">
				<c:if test="${not empty totalPage }">
				<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<c:set value="0" var="k"></c:set>
						<c:forEach begin="1" end="${totalPage}" var="i">
						<c:if test="${ k == 0}">
						<c:choose>
						<c:when test="${currentPage > 1 }">
						<li><a href="${pageContext.request.contextPath }/admin/order/index/${currentPage-1}" aria-label="Previous"><span
								aria-hidden="true">«</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/admin/order/index/1" aria-label="Previous"><span
								aria-hidden="true">«</span></a></li>
						</c:otherwise>
						</c:choose>
						<c:set value="1" var="k"></c:set>
						</c:if>
						<li class="<c:if test="${ i == currentPage }">active</c:if>">
						<a href="${pageContext.request.contextPath }/admin/order/index/${i}">${i } 
						<span class="sr-only">(current)</span></a></li>
						<c:if test="${ i == totalPage}">
						<c:choose>
						<c:when test="${currentPage < totalPage }">
						<li><a href="${pageContext.request.contextPath }/admin/order/index/${currentPage+1}" aria-label="Next"><span
								aria-hidden="true">»</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/admin/order/index/${totalPage}" aria-label="Next"><span
								aria-hidden="true">»</span></a></li>
						</c:otherwise>
						</c:choose>
						</c:if>
						</c:forEach>
						
					</ul>
				</nav>
				</c:if>
				</c:if>
				<!-- /.pagination -->

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->



</div>