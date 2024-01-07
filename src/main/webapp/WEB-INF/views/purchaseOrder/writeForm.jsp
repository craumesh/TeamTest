<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/js.jsp"%>

<div class="card my-4">
	<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
		<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
			<h6 class="text-white text-capitalize ps-3">발주 신청서</h6>
		</div>
	</div>	
	<div class="card-body px-0 pb-2">
		<div class="card-body">
			<!-- 폼테그 시작  -->
			<form role="form" method="post">
				<!-- 거래처 정보 -->
				<div class="row mb-4">
					<div class="card">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-7">
									<h6>거래처</h6>
								</div>
								<div class="col-lg-6 col-5 my-auto text-end">
									<div class="dropdown float-lg-end pe-4">
										<button class="btn btn-dark border-radius-lg p-2 mt-n4 mt-md-0" type="button" onclick="openSearchCompany()">
											<i class="material-icons p-2">search</i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">담당자</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">회사 정보</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">주소</th>
										</tr>
									</thead>
									<tbody>	
										<tr>
											<td>
												<input type="hidden" name="employee_no" value="${memberVO.employee_no }">
												<div class="d-flex px-2 py-1">
													<div>
														<img src="${memberVO.photo_paths }" class="avatar avatar-sm me-3" alt="">
													</div>
													<div class="d-flex flex-column justify-content-center">
														<h6 class="mb-0 text-sm">${memberVO.name }</h6>
														<p class="text-xs text-secondary mb-0">${memberVO.contact }</p>
													</div>
												</div>
											</td>								
											<td>											
												<input type="hidden" id="company_no" name="company_no" value="${companyVO.company_no }">												
												<div class="d-flex px-2 py-1">
													<div>
														<img src="" id="companyImg" class="avatar avatar-sm me-3" alt="">
													</div>
													<div class="d-flex flex-column justify-content-center">
														<h6 class="mb-0 text-sm" id="company_name">거래처를 선택해주세요.</h6>
														<p class="text-xs text-secondary mb-0" id="companyTel"></p>
													</div>
												</div>
											</td>
											<td class="text-center">
												<h6 class="text-sm font-weight-bold pt-3" id="companyAddress"></h6>
											</td>																						
										</tr>
									</tbody>									
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 상품 정보 -->
				<div class="row mb-4">
					<div class="card">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-7">
									<h6>주문상품</h6>
								</div>
								<div class="col-lg-6 col-5 my-auto text-end">
									<div class="dropdown float-lg-end pe-4">
										<button class="btn btn-dark border-radius-lg p-2 mt-n4 mt-md-0" type="button" onclick="openSearchProduct()">
											<i class="material-icons p-2">search</i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-2">
												<div class="form-check form-check-info text-start ps-0">
													<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-gtm-form-interact-field-id="0">
												</div>
											</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제품</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">수량</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">재고량</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">수정/삭제</th>
										</tr>
									</thead>
									
									
									
									
									
									<tbody id="productTable">
										
										<tr>
										
										
										

											
											
											
											
										</tr>
								
									</tbody>
									
									
									
									
									
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 고객 요청 사항 -->
				<div class="row mb-4">
					<div class="card">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-7">
									<h6>희망 납기일</h6>
								</div>
								<div class="input-group input-group-outline mb-3">
									<input class="form-control" type="date" name="due_date">
								</div>
								<div class="col-lg-6 col-7">
									<h6>요청사항</h6>
								</div>
								<div class="input-group input-group-outline mb-3">
									<textarea class="form-control" rows="7" placeholder="요청사항을 입력하세요" name="comments"></textarea>
								</div>	
							</div>
						</div>
					</div>
				</div>
				<!-- 버튼 -->
				<div class="text-center">
					<button type="submit" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0">신청하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>

	// 거래처 검색창 
    function openSearchCompany() {
        window.open('/purchaseOrder/searchCompany', '_blank', 'width=800,height=600');
    }

    // 상품 검색창
    function openSearchProduct() {
        window.open('/purchaseOrder/searchProduct', '_blank', 'width=800,height=600');
    }
    
    // 거래처 변경
    function updateCompanyInfo(data) {

    	var address = "(" + data.company_zip_code + ") " + data.company_address + " " + data.company_address_detail;

        $("#company_no").val(data.company_no);
        $("#company_name").html(data.company_name);
        $("#companyImg").html(data.photo_paths);
        $("#companyTel").html(data.company_tel);
        $("#companyAddress").html(address);
    }

</script>