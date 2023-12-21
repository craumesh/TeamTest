<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/js.jsp"%>

	<div class="col-12">
		<div class="card my-4">
			<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
				<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
					<h6 class="text-white text-capitalize ps-3">발주 내역</h6>
				</div>
			</div>
			<div class="card-body px-0 pb-2">
				<div class="table-responsive p-0">
					<table class="table align-items-center mb-0">
					
						<thead>
							<tr>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
									<div class="form-check form-check-info text-start ps-0">
										<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-gtm-form-interact-field-id="0">
									</div>
								</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">발주 번호</th>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제품 정보</th>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">지점 정보</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">발주 일자</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">처리 상태</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="vo" items="${purchaseVOList }">
								<tr>
									<td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
										<div class="form-check form-check-info text-start ps-0">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-gtm-form-interact-field-id="0">
										</div>
									</td>
									<td class="align-middle text-center">
                      					<span class="text-secondary font-weight-bold">${vo.order_id }</span>
                     				</td>
									<td>
				                    	<div class="d-flex px-2 py-1">
				                        	<div>
				                            	<img src="../assets/img/team-2.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
				                     		</div>
				                          	<div class="d-flex flex-column justify-content-center">
				                           		<h6 class="mb-0 text-sm">${vo.product_no }</h6>
				                            	<p class="text-xs text-secondary mb-0">quantity: 999개</p>
				                        	</div>
				                    	</div>
			                        </td>
									<td>
				                        <p class="text-xs font-weight-bold mb-0">${vo.company_no }</p>
				                        <p class="text-xs text-secondary mb-0">member_name: 신청자</p>
                      				</td>
									<td class="align-middle text-center">
										<span class="text-secondary text-xs font-weight-bold">
									    	<fmt:formatDate value="${vo.order_date}" pattern="yyyy-MM-dd" />
									    </span>
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
		</div>
	</div>

<%@ include file="../include/footer.jsp"%>