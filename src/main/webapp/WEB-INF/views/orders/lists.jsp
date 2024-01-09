<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/js.jsp"%>
	<div class="col-12">
		<div class="card my-4">		
			<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">				
				<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pb-3 pe-3 d-flex">			
					<h3 class="text-white text-capitalize ps-5 align-items-center mt-2 py-1">주문 내역</h3>					
					<form action="/orders/lists" id="search-form" class="ms-md-auto bg-white rounded p-2 mb-0 d-flex align-items-center">
						<div class="align-items-center d-flex flex-column mx-1">	
							<div class="input-group input-group-outline">
								<label class="form-label">검색어</label>
								<input type="text" id="query" name="query" class="form-control" value="${param.query }">
								<input type="hidden" id="filter" name="filter" value="${param.filter }">
							</div>
						</div>					
						<div class="align-items-center d-flex flex-column py-1 ct-example">
							<button type="button" id="searchbtn" class="btn btn-outline-primary mb-0 py-2 mx-1 fs-6">검색</button>
						</div>
					</form>			
				</div>				
			</div>			
			<div class="card-body px-0 pb-2">	
				<div class="text-end pe-4 pb-3">
					<a class="btn bg-gradient-dark mb-0" href="/orders/forms">
						<i class="material-icons text-sm">add</i> 주문서 작성하기
					</a>
				</div>	
				<div class="table-responsive p-0">
					<table id="order-table" class="table align-items-center mb-0">					
						<thead>
							<tr>
								<th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-2">
									<div class="form-check form-check-info text-start ps-0">
										<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-gtm-form-interact-field-id="0">
									</div>
								</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">주문 번호</th>
								<th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 w-15">제품 정보</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">재고량</th>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">거래처 정보</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">주문 일자</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작업 지시</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">처리 상태</th>
							</tr>
						</thead>					
						<tbody>
							<c:forEach var="vo" items="${ordersVOList }">
						
								
								<tr>
									<td class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-2">
										<div class="form-check form-check-info text-start ps-0">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-gtm-form-interact-field-id="0">
										</div>
									</td>
									<td class="align-middle text-center identify-no">
                      					<a href="/orders/orderDetail?order_id=${vo.order_id }">
                      						<span class="text-secondary font-weight-bold">${vo.order_id }</span>
                      					</a>                  						
                     				</td>
									<td>
				                    	<div class="d-flex px-2 py-1 ms-5">
				                        	<div>
				                            	<img src="" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
				                     		</div>
				                          	<div class="d-flex flex-column justify-content-center">
				                           		<h6 class="mb-0 text-sm">${vo.product_name }</h6>
				                            	<p class="text-xs text-secondary mb-0">${vo.quantity }개</p>
				                        	</div>
				                    	</div>
			                        </td>
			                        <td class="align-middle text-center">
										<div class="d-flex flex-sm-column align-items-center justify-content-center">
											<span class="me-2 text-xs font-weight-bold" id="prdInv_${vo.order_id}">${vo.io_quantities}ea</span>
											<div>
												<div class="progress">
													<div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${(vo.io_quantities / 100) * 100};"></div>
												</div>
											</div>
										</div>
									</td>
									<td>
				                        <p class="text-xs font-weight-bold mb-0">${vo.company_name }</p>
				                        <p class="text-xs text-secondary mb-0">${vo.company_tel }</p>
                      				</td>
									<td class="align-middle text-center">
										<span class="text-secondary text-xs font-weight-bold">
									    	<fmt:formatDate value="${vo.order_date}" pattern="yyyy-MM-dd" />
									    </span>
									</td>
									<td class="align-middle text-center text-sm">
			                        	<span class="badge badge-sm bg-gradient-success">작업 지시</span>
			                      	</td>
									<td class="align-middle text-center text-sm">
			                        	<span class="badge badge-sm bg-gradient-success">${vo.order_status }</span>
			                      	</td>
								</tr>
							</c:forEach>
						</tbody>												
					</table>
				</div>
			</div>
			<!-- 페이징 처리 -->			
			<div class="row">
				<div class="col-sm-5">
					<div class="ms-6">${pageVO.startPage } / ${pageVO.endPage }</div>
				</div>
				<div class="col-sm-5 mb-3">
					<ul class="pagination">
						<c:if test="${pageVO.prev }">
							<li class="page-link link-container"><a href="/orders/${listsUrl }?page=${pageVO.endPage-pageVO.displayPageNum }&query=${query}&filter=${filter}" class="link"><<</a></li>
						</c:if>
						<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
							<li ${pageVO.cri.page == i ? "class='link-container active'" : "class='link-container'"} >
								<a href="/orders/${listsUrl }?page=${i }&query=${query}&filter=${filter}" ${pageVO.cri.page == i ? "class='page-link rounded fw-bolder link-white'" : "class='page-link rounded fw-bolder'"}>${i }</a>
							</li>				
						</c:forEach>
						<c:if test="${pageVO.next }">
							<li class="page-link link-container"><a href="/orders/${listsUrl }?page=${pageVO.startPage+pageVO.displayPageNum }&query=${query}&filter=${filter}" class="link">>></a></li>
						</c:if>
					</ul>
				</div>
			</div>		
		</div>
	</div>
	<!-- 모달창 -->
	<div id="Modal" class="modal top-7 position-absolute h-auto">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header py-4">
					<button id="closebtn" class="btn bg-gradient-primary position-absolute py-1 px-2 mt-2 end-5">X</button>
					<h3 class="modal-title mx-auto">주문 정보</h3>
				</div>
				<div class="modal-body p-5">
					<div class="user-container d-flex align-items-center">
						<img class="img-thumbnail mb-4 me-4 max-width-200 w-30" alt="상품사진" id="photo_paths">
						<div class="user-info d-flex w-100">
							<table class="table">
								<tr>
									<th class="fs-5">주문번호</th>
									<td class="fs-5" id="order_id"></td>
								</tr>
								<tr>
									<th class="fs-5">상품이름</th>
									<td class="fs-5" id="product_name"></td>
								</tr>
								<tr>
									<th class="fs-5">수량</th>
									<td class="fs-5" id="quantity"></td>
								</tr>
							</table>
						</div>
					</div>	
					<div id="tableContainer" class="modal-body">
						<table id="view-table" class="table">
							<tr>
								<th class="fs-5">담당자</th>
								<td class="fs-5" id="member_name"></td>
							</tr>
							<tr>
								<th class="fs-5">거래처</th>
								<td class="fs-5" id="company_name"></td>
							</tr>
							<tr>
								<th class="fs-5">거래처 번호</th>
								<td class="fs-5" id="company_tel"></td>
							</tr>
							<tr>
								<th class="fs-5">거래처 주소</th>
								<td class="fs-5" id="company_address"></td>
							</tr>
							<tr>
								<th class="fs-5">요청사항</th>
								<td class="fs-5" id="comments"></td>
							</tr>
							<tr>
								<th class="fs-5">납기일</th>
								<td class="fs-5" id="due_date"></td>
							</tr>
						</table>
					</div>			
					<div class="text-center">
						<button id="editbtn" class="btn bg-gradient-danger fs-6 mb-0 py-2 px-3">주문 수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp"%>

<script>

	$(document).ready(function() {
	
		var modal = document.getElementById("Modal");
		
		if($("#query").val()) {
			$(".input-group").addClass("focused is-focused");
		}
		
		$("#searchbtn").click(function(){
			var value = $("#query").val();
			location.href = '/orders/lists?query=' + value;
		});	
		
		$("#order-table").on("click", "tr td", function(event) {
			
	        var value = $(this).closest("tr").find("td.identify-no").text();

	        $.ajax({
	            url: '/orders/detail?order_id=' + value,
				method : 'GET',
				dataType: 'json',
				success : function(data) {
					console.log(data);
					$('#photo_paths').attr('src', data.photo_paths).attr('width', '100');
					$("#order_id").text(data.order_id);
					$("#product_name").text(data.product_name);
				    $("#quantity").text(data.quantity);
				    $("#member_name").text(data.name);
				    $("#company_name").text(data.company_name);
				    $("#company_tel").text(data.company_tel);
				    $("#company_address").text(data.company_address + ", " + data.company_address_detail);
				    $("#comments").text(data.comments);
				    $("#due_date").text(data.due_date);
				    modal.style.display = "block";
				},
				error : function(error) {
					console.log('실패:', error);
				}
			});
	    });
		
		$("#closebtn").click(function(){
			modal.style.display = "none";
			location.reload();
		});
		
		$("#closebtn").click(function(){
			var value = $("#query").val();
			modal.style.display = "none";
			location.reload();
		});
		
		$(window).click(function(event){
			if (event.target == modal) {
				modal.style.display = "none";
				location.reload();
			}
			
			if (!$(event.target).closest('.input-group').length) {
				if (!$("#query").val()) {
		       		$(".input-group").removeClass("focused is-focused");
				}
		    }
		});		
		
		$(".input-group").click(function(){
			$(this).addClass("focused is-focused");
		});
		
		$("#depart_name-select").on("change", function() {			
			updatePositionNameSelect();
		});	
				
	});
	
	var result = "${result}";
	
	if(result == "CREATEOK"){
		swal({
			title: "주문이 정상적으로 처리되었습니다.",
			icon: "success",
			buttons: "확인",
			});
	}
	
</script>