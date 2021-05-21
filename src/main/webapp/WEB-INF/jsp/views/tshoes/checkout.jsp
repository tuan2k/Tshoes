<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>

	 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/tshoes/css/css2/bootstrap.min.css">
    <!-- Site CSS -->
   <%--  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/tshoes/css/css2/responsive.css"> --%>
    <!-- Custom CSS -->
    <a href="${pageContext.request.contextPath}/" style="margin-left:120px;">Home</a>
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Color</th>
                                    <th>Size</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody id="bodycart">
                            	<c:choose>
                            	<c:when test="${not empty listCarts }">
                            	<c:forEach items="${listCarts }" var="cart">
                            	<tr>
                                    <td class="name-pr">
                                    	<c:set var="p" value="1"></c:set>
                                    	<c:forEach items="${listProducts }" var="product">
                                    	<c:if test="${ cart.product_id == product.id && p==1 }">${ product.name}
                                    	<c:set var="p" value="2"></c:set>
                                    	</c:if>
                                    	</c:forEach>
                                    </td>
                                    <td class="price-pr">
                                        <c:forEach items="${listColors }" var="color">
                                    	<c:if test="${ cart.color_id ==color.id }">${ color.name}</c:if>
                                    	</c:forEach>
                                    </td>
                                    <td class="price-pr">
                                        <c:forEach items="${listSizes }" var="size">
                                    	<c:if test="${ cart.size_id == size.id }">${ size.size}</c:if>
                                    	</c:forEach>
                                    </td>
                                    <td class="price-pr">
                                   		<c:set var="check" value="1"></c:set>
                                        <c:forEach items="${listProducts }" var="product">
                                    	<c:if test="${ cart.product_id == product.id  && check ==1}">
                                    	${product.price}
                                    	<c:set var="check" value="2"></c:set>
                                    	</c:if>
                                    	</c:forEach>
                                    </td>
                                    
                                    <td class="cart_quantity text-center">
                                    <div class="cart1-plus-minus-button">
                                    <button onclick="changeNumber(
                                    <c:set var="ck0" value="1"></c:set>
                                    <c:forEach items="${listProducts }" var="product">
                                    	<c:if test="${ cart.product_id == product.id && ck0==1 }">${product.price}
                                    	<c:set var="ck0" value="2"></c:set>
                                    	</c:if>
                                    </c:forEach>,
                                    ${cart.product_id},${cart.color_id},${cart.size_id},1)">+
                                    </button>
                                	<input class="cart-plus-minus" type="text" name="qtybutton" id="icounter_${cart.product_id}_${cart.color_id}_${cart.size_id}" value="${cart.number }">
                                    <button onclick="changeNumber(
                                    <c:set var="ck1" value="1"></c:set>
                                    <c:forEach items="${listProducts }" var="product">
                                    <c:if test="${ cart.product_id == product.id && ck1==1}">${product.price}
                                    <c:set var="ck1" value="2"></c:set>
                                    </c:if>
                                    </c:forEach>,
                                    ${cart.product_id},${cart.color_id},${cart.size_id},0)">-</button>
                                    </div>
                                     
                                    </td>
                                    <td class="total-pr" id ="price_${cart.product_id}_${cart.color_id}_${cart.size_id}">
                                    	<c:set var="ck" value="1"></c:set>
                                         <c:forEach items="${listProducts }" var="product">
                                    	<c:if test="${ cart.product_id == product.id  && ck==1}">${product.price*cart.number}
                                    	<c:set var="ck" value="2"></c:set>
                                    	</c:if>
                                    	</c:forEach>
                                    </td>
                                    
                                <td class="remove-pr">
                                <a href="javascript:void(0)" onclick="deleteCart(${cart.product_id},${cart.size_id},${cart.color_id})">
									<i class="fas fa-times">X</i>
									<script>
		function deleteCart(pid,sid,cid){
			let check = confirm("Bạn có chắc chắn muốn xóa không?");
			if(check){
				$.ajax({
					url: '<%=request.getContextPath()%>/num',
					type: 'GET',
					data: {
						"pid": pid ,
						"sid": sid,
						"cid": cid
						},
					success: function(){
						$('table').load(' table');
						$('#checkout').load(' #checkout');
						$('#sizecart').load(' #sizecart');
						$('#total').load(' #total');
					},
					error: function (){
						alert('Có lỗi xảy ra');
					}
				})
			}
		}
		</script>
								</a>
                                 </td>
                                    
                                </tr> 
                                
                                </c:forEach>
                            	</c:when>
                            	<c:otherwise>
                            	Empty Cart
                            	</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    
                </div>
                <div class="col-12 d-flex shopping-box"><a href="<%= request.getContextPath()%>/order" class="ml-auto btn hvr-hover">PLACE ORDER</a> </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->
    <!-- End Instagram Feed  -->
   <script type="text/javascript">
    function changeNumber(price,idPro,cId,sId,check){
		$.ajax({
			url: '<%=request.getContextPath()%>/num',
			type: 'POST',
			data: {
				"aidPro": idPro, 
				"cId": cId,
				"sId": sId,
				"check": check
			},
			success: function(data){
				let listNumber = JSON.parse(data);
				if(listNumber.length > 0){
					$("#icounter_"+idPro+"_"+cId+"_"+sId).val(listNumber[0]);
					$("#price_"+idPro+"_"+cId+"_"+sId).text(price*listNumber[0]);
					$("#total").text(listNumber[1]);
				}
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		})
	}	
		</script>
    
   
