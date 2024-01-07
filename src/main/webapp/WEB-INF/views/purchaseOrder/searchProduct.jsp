<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
									<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제품</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">재고량</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">수량</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${productVOList }">
									
									<tr>
										<td>
											<div class="d-flex px-2 py-1">
												<div>
													<img src="" class="avatar avatar-sm me-3" alt="">
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
										<td class="align-middle text-center text-sm">
											<div class="input-group input-group-outline">
												<input type="number" id="quantity_${vo.product_no}" class="form-control" placeholder="수량을 입력하세요">
											</div>
										</td>
										<td class="align-middle text-center text-md" id="product_${vo.product_no }">
											<button id="addCart" class="btn btn-primary btn-sm mb-0 py-1 ms-2" onclick="addToCart(${vo.product_no})">선택</button>
											
											
											
											
											<input type="hidden" name="product_no_${vo.product_no }" value="${vo.product_no }"/>			
											<input type="hidden" name="product_code_${vo.product_no }" value="${vo.product_code }"/>									
											<input type="hidden" name="product_name_${vo.product_no }" value="${vo.product_name }"/>									
											<input type="hidden" name="product_category_${vo.product_no }" value="${vo.product_category }"/>									
											<input type="hidden" name="product_category_detail_${vo.product_no }" value="${vo.product_category_detail }"/>									
											<input type="hidden" name="company_no_${vo.product_no }" value="${vo.company_no }"/>									
											<input type="hidden" name="product_unit_${vo.product_no }" value="${vo.product_unit }"/>									
											<input type="hidden" name="product_price_${vo.product_no }" value="${vo.product_price }"/>									
											<input type="hidden" name="recipe_${vo.product_no }" value="${vo.recipe }"/>									
										
										
										
										
										
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

//     function addToCart(product_no) {

//         // 필요한 정보를 수집
//         var quantity = $("#quantity_" + product_no).val();
    	
//         //
//     	var productVO = {
//     			"product_no": $("#product_no_" + product_no).val(),
//                 "product_code": $("#product_code_" + product_no).val(),
//                 "product_name": $("#product_name_" + product_no).val(),
//                 "product_category": $("#product_category_" + product_no).val(),
//                 "product_category_detail": $("#product_category_detail_" + product_no).val(),
//                 "company_no": $("#company_no_" + product_no).val(),
//                 "product_unit": $("#product_unit_" + product_no).val(),
//                 "product_price": $("#product_price_" + product_no).val(),
//                 "recipe": $("#recipe_" + product_no).val()
//     	};

//         // AJAX를 사용하여 서버에 데이터 전송
//         $.ajax({
//             url: "/purchaseOrder/addCart",
//             type: "POST",
//             contentType : "application/json",
//             data: JSON.stringify(productVO),
//             success: function (data) {
//                 // 성공적으로 처리된 경우의 동작
//                 console.log(data);
//             },
//             error: function () {
//                 // 실패한 경우의 동작
              
//             }
//         });
        
//         window.close();
        
//     }


	function addToCart(product_no) {
		
	    // 필요한 정보를 수집
	    var quantity = $("#quantity_" + product_no).val();
	    
	    // product_no에 해당하는 히든 필드의 값을 가져오기
	    var product_no_value = $("input[name='product_no_" + product_no + "']").val();
	    var product_code_value = $("input[name='product_code_" + product_no + "']").val();
	    var product_name_value = $("input[name='product_name_" + product_no + "']").val();
	    var product_category_detail_value = $("input[name='product_category_detail_" + product_no + "']").val();
	    var product_price_value = $("input[name='product_price_" + product_no + "']").val();
	
	    // productVO에 히든 필드의 값을 추가
	    var productVO = {
	        "product_no": product_no_value,
	        "product_code": product_code_value,
	        "product_name": product_name_value,
	        "product_category_detail": product_category_detail_value,
	        "product_price": product_price_value,
	        "quantity": quantity
	    };
	
	    // AJAX를 사용하여 서버에 데이터 전송
	    $.ajax({
	        url: "/purchaseOrder/addCart",
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify(productVO),
	        success: function (data) {
	        	alert(JSON.stringify(data));
	            console.log(data);
	            window.opener.addProductData(productVO);
	        },
	        error: function (data) {
	            // 실패한 경우의 동작
	            console.log(JSON.stringify(data));
	        }
	    });
	}
    
</script>

