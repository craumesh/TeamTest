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
						<div class="align-items-center d-flex flex-column mx-1">	
							<div class="input-group input-group-outline">
								
							</div>
						</div>					
						<div class="align-items-center d-flex flex-column py-1 ct-example">
							
						</div>
					</form>			
				</div>				
			</div>			
			<div class="card-body px-0 pb-2">	
				<div class="text-end pe-4 pb-3">
				</div>	
				<div class="table-responsive p-0">
					<table id="order-table" class="table align-items-center mb-0">					
						<thead>
							<tr>
								<th class="ps-5 w-1">
									<div class="form-check form-check-info text-start ps-0">
										<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-gtm-form-interact-field-id="0">
									</div>
								</th>
								<th class="text-center text-secondary font-weight-bolder col-1">주문 번호</th>
								<th class="text-center text-secondary font-weight-bolder col-1">제품 정보</th>
								<th class="text-center text-secondary font-weight-bolder col-1">재고량</th>
								<th class="text-center text-secondary font-weight-bolder col-1">주문 일자</th>
								<th class="text-center text-secondary font-weight-bolder col-1">거래처 정보</th>
								<th class="text-center text-secondary font-weight-bolder col-1">작업 지시</th>
								<th class="text-center font-weight-bolder col-1">
									
								</th>
							</tr>
						</thead>					
						<tbody>
							<c:forEach var="vo" items="${ordersVOList }">				
								<tr>
									<td class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-5">
										<div class="form-check form-check-info text-start ps-0">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-gtm-form-interact-field-id="0">
										</div>
									</td>
									<td class="align-middle text-center identify-no modal-act">
                      					<a>
                   							<span class="text-secondary font-weight-bold">${vo.order_id }</span>
                      					</a>                  						
                     				</td>
									<td class="modal-act">
				                    	<div class="d-flex px-2 py-1 ms-5">
				                        	<div>
				                            	<img src="" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
				                     		</div>
				                          	<div class="d-flex flex-column justify-content-center">
				                           		<h6 class="mb-0 text-sm">${vo.product_name }</h6>
				                            	<p class="text-xs text-secondary mb-0">${vo.quantity }EA</p>
				                        	</div>
				                    	</div>
			                        </td>
                      				<c:choose>
							            <c:when test="${(vo.stock_quantity / 500) * 100 >= 50}">
							                <td class="align-middle text-center modal-act" id="progress-bar_${vo.order_id }">
												<div class="d-flex flex-sm-column align-items-center justify-content-center">
													<span class="me-2 text-xs font-weight-bold" id="prdInv_${vo.order_id}">${vo.stock_quantity }EA</span>
													<div>
														<div class="progress">
															<div class="progress-bar bg-gradient-info" id="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${(vo.stock_quantity / 500) * 100};"></div>
														</div>
													</div>
												</div>
											</td>
							            </c:when>
							            <c:when test="${(vo.stock_quantity / 500) * 100 == 0}">
							                <td class="align-middle text-center modal-act" id="progress-bar_${vo.order_id }">
												<div class="d-flex flex-sm-column align-items-center justify-content-center">
													<span class="me-2 text-xs font-weight-bold" id="prdInv_${vo.order_id}">재고 없음</span>
												</div>
											</td>
							            </c:when>
						          	  	<c:otherwise>
							                <td class="align-middle text-center modal-act" id="progress-bar_${vo.order_id }">
												<div class="d-flex flex-sm-column align-items-center justify-content-center">
													<span class="me-2 text-xs font-weight-bold" id="prdInv_${vo.order_id}">${vo.stock_quantity }EA</span>
													<div>
														<div class="progress">
															<div class="progress-bar bg-gradient-warning" id="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${(vo.stock_quantity / 500) * 100};"></div>
														</div>
													</div>
												</div>
											</td>
						            	</c:otherwise>
							        </c:choose>	                        		
									<td class="align-middle text-center modal-act">
										<span class="text-secondary text-xs font-weight-bold">
									    	<fmt:formatDate value="${vo.order_date}" pattern="yyyy-MM-dd" />
									    </span>
									</td>
									<td class="align-middle text-center modal-act">
				                        <p class="text-xs font-weight-bold mb-0">${vo.company_name }</p>
				                        <p class="text-xs text-secondary mb-0">${vo.company_tel }</p>
                      				</td>
                      				<c:choose>
							            <c:when test="${vo.quantity < vo.stock_quantity}">
							                <td class="align-middle text-center text-sm">
							                    <button class="btn bg-gradient-info fs-6 mb-0 py-1 px-3" onclick="openDeliveryForm()">출고 요청</button>
							                </td>
							            </c:when>
							            <c:otherwise>
							                <td class="align-middle text-center text-xs">
							                    <button class="btn bg-gradient-warning fs-6 mb-0 py-1 px-3" onclick="openProductionRequest()">생산 요청</button>
							                </td>
							            </c:otherwise>
							        </c:choose>  	
									<td class="align-middle text-center text-sm">
			                        	<span id="status-badge" class="badge badge-sm fs-6 mb-0 py-2 px-3 w-50">${vo.order_status }</span>
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
	
<%@ include file="../include/footer.jsp"%>

<script>

	$(document).ready(function() {
	
		
		$('table tr').each(function() {
            var statusText = $(this).find('td:last-child #status-badge').text();

            switch(statusText){
	            case "신청완료": $(this).find('td:last-child #status-badge').addClass("bg-gradient-primary"); break;
	            case "생산중": $(this).find('td:last-child #status-badge').addClass("bg-gradient-warning"); break;
	            case "생산완료": $(this).find('td:last-child #status-badge').addClass("bg-gradient-warning"); break;
	            case "배송중": $(this).find('td:last-child #status-badge').addClass("bg-gradient-info"); break;
	            case "배송완료": $(this).find('td:last-child #status-badge').addClass("bg-gradient-info"); break;
	            case "처리완료": $(this).find('td:last-child #status-badge').addClass("bg-gradient-success"); break;
	            case "취소": $(this).find('td:last-child #status-badge').addClass("bg-gradient-danger"); break;
            }
        });
		
		
			
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
		
		$(".dropdown-item").click(function(){
			$("#dropdown-selected").text($(this).text());
			$("#filter").val($("#dropdown-selected").text());
			$("#search-form").submit();
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
	
	// 배송 요청 페이지
    function openDeliveryForm() {
        window.open('/deliverys/forms', '_blank', 'width=800,height=600');
    }
	
	// 생산 요청 페이지
    function openProductionRequest() {
        window.open('/생산 지시/페이지', '_blank', 'width=800,height=600');
    }
	
</script>