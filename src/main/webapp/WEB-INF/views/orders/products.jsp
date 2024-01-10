<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/js.jsp"%>

	<div class="col-12">
		<div class="card my-4">		
			<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">				
				<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pe-3 d-flex">			
					<h6 class="text-white text-capitalize pt-3 ps-3">상품 검색</h6>					
					<form action="" class="ms-md-auto bg-white rounded p-2 d-flex align-items-center">
						<div class="align-items-center d-flex flex-column">					
							<div class="input-group input-group-outline">
           						<input type="text" class="form-control" id="query" name="query" value="${param.query }" placeholder="상품명을 입력하세요">							
							</div>						
						</div>						
						<div class="align-items-center d-flex flex-column py-1">
							<input type="submit" value="검색" class="btn btn-outline-primary btn-sm mb-0 py-1 ms-2">						
						</div>											
					</form>							
				</div>				
			</div>			
			<div class="card-body px-0 pb-2">			
				<div class="table-responsive">
						<table class="table align-items-center mb-0">
							<thead>
								<tr>
									<th class="text-center text-secondary font-weight-bolder col-1">제품</th>
									<th class="text-center text-secondary font-weight-bolder col-1">재고량</th>
									<th class="text-center text-secondary font-weight-bolder col-1"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${productVOList }">
									<tr>
										<td>
											<div class="d-flex px-2 py-1 ms-5">
					                        	<div>
					                            	<img src="${vo.photo_paths }" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
					                     		</div>
					                          	<div class="d-flex flex-column justify-content-center">
					                           		<h6 class="mb-0 text-sm">${vo.product_name }</h6>
					                        	</div>
					                    	</div>
										</td>									
										<td class="align-middle text-center">
											<div class="d-flex align-items-center justify-content-center">
												<span class="me-2 text-xs font-weight-bold">60%</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
													</div>
												</div>
											</div>
										</td>
										<td class="align-middle text-center text-md">
											<button id="addCart" class="btn btn-primary btn-sm mb-0 py-1 ms-2" onclick="addToCart(${vo.product_no})">선택</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp"%>

<script>

    function addToCart(product_no) {

        // AJAX를 사용하여 서버에 데이터 전송
        $.ajax({
            url: "/orders/productSelect",
            type: "POST",
            data: {
            	product_no: product_no,
            },
            success: function (data) {
            	swal({
					title: "상품이 선택되었습니다.",
					text: "상품: " + data.product_name,
					icon: "success",
					buttons: "선택",
   				}).then(function(){
   					var parentWindow = window.opener;
   	                var quantityInput = parentWindow.document.querySelector('input[name="quantity"]');
   	                if (quantityInput) {
   	                    quantityInput.removeAttribute('readonly');
   	                }

   	                parentWindow.selectProduct(data);
   	                window.close();  
   				})	
            },
            error: function () {
            	swal({
					title: "상품이 선택에 실패했습니다.",
					text: "상품: " + data.product_name,
					icon: "error",
					buttons: "실패",
   				})
            }
        });
     
    }

</script>

