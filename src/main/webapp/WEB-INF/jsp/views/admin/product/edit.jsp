<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>	
<div class="col-md-10">
	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Sửa sản phẩm</div>
			</div>
			<br> <br>
			<c:if test="${not empty msg }">
			<div class="alert alert-danger" role="alert">
			${ msg}
			</div>
			</c:if>
			<div class="content-box-large box-with-header">
			
				<c:choose>
				<c:when test="${not empty product }">
				<form action="${pageContext.request.contextPath }/admin/product/edit" method="post" enctype="multipart/form-data">
				<div>
					<div class="row mb-10"></div>

					<div class="row">
						<div class="col-sm-6">
							<input name="id" type="hidden" value="${product.id }" />
							<div class="form-group">
								<label for="name">Tên sản phẩm</label>
								 <input type="text" class="form-control" name="name" value="${product.name }">
							</div>

							<div class="form-group">
								<label>Danh mục </label> 
								<select class="form-control" name="cat_id">
									<c:forEach items="${listcats}" var="cat">
									<option value="${cat.id}" <c:if test="${ cat.id == product.cat_id }">selected</c:if> >${cat.name }</option>
									</c:forEach>
								</select>
							</div>
							
							<div class="form-group">
								<label>Mô tả</label>
								<textarea class="form-control" rows="3" name="description">${product.description }</textarea>
							</div>
							
							<div class="form-group">
								<label for="name">Giá</label>
								 <input type="text" class="form-control" name="price" value="${product.price }">
							</div>
							
							<div class="form-group">
								<label for="name">Số lượng</label>
								 <input type="text" class="form-control" name="number" value="${product.number }">
							</div>
							
							<div class="form-group">
								<label>Thêm hình ảnh</label>
								<input type="file" class="btn btn-default" name="imagef" multiple="multiple" >
								<p class="help-block">
									<em>Định dạng: jpg, png, jpeg,...</em>
								</p>
							</div>
							
							<div class="form-group">
								<label>Màu sắc </label> 
								<select class="form-control" name="color" multiple>
									<c:forEach items="${listcolors}" var="color">
									<option value="${ color.id }">${ color.name }</option>
									</c:forEach>
								</select>
							</div>
							
							<div class="form-group">
								<label>Kích cỡ </label> 
								<select class="form-control" name="size" multiple>
									<c:forEach items="${listsizes}" var="size">
									<option value="${ size.id }">${ size.size }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-sm-12">
							<input type="submit" value="Thêm" class="btn btn-success" /> <input
								type="reset" value="Nhập lại" class="btn btn-default" />
						</div>
					</div>
				</div>
				</form>
				</c:when>
				<c:otherwise></c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- /.row col-size -->

</div>