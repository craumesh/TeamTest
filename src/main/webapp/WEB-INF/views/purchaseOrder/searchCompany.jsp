<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/js.jsp"%>

	<div class="col-12">
		<div class="card my-4">		
			<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">				
				<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pe-3 d-flex">			
					<h6 class="text-white text-capitalize pt-3 ps-3">거래처 검색</h6>					
					<form action="" class="ms-md-auto bg-white rounded p-2 d-flex align-items-center">
						<div class="align-items-center d-flex flex-column">					
							<div class="input-group input-group-outline">
           						<input type="text" class="form-control" id="query" name="query" value="${param.query }" placeholder="거래처명을 입력하세요">							
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
									<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">거래처</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">번호</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">주소</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${companyVOList }">
									<tr>			
										<td>
											<div class="d-flex px-2 py-1">
												<div>
													<img src="${vo.photo_paths }" class="avatar avatar-sm me-3" alt="">
												</div>
												<div class="d-flex flex-column justify-content-center">
													<h6 class="mb-0 text-sm">${vo.company_name }</h6>
												</div>
											</div>
										</td>
										<td class="align-middle text-center">
											<div class="d-flex align-items-center justify-content-center">
												<h6 class="mb-0 text-sm">${vo.company_tel }</h6>
											</div>
										</td>
										<td class="align-middle text-center">
											<div class="d-flex align-items-center justify-content-center">
												<h6 class="mb-0 text-sm">(${vo.company_zip_code }) ${vo.company_address } ${vo.company_address_detail }</h6>
											</div>
										</td>
										<td class="align-middle text-center text-md">
											<button id="selectCompany" class="btn btn-primary btn-sm mb-0 py-1 ms-2" onclick="selectCompany(${vo.company_no})">선택</button>
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

    function selectCompany(company_no) {
    	   
    	   $.ajax({
    	      url: "/purchaseOrder/selectCompany", 
    	      type: "POST",
    	      data: { "company_no": company_no },
    	      success: function(data) {
    	         alert("거래처가 선택되었습니다.");
    	         opener.location.reload();
    	         window.close();
    	      },
    	      error: function(error) {
    	         alert("데이터 전송 중 오류가 발생했습니다.");
    	      }
    	   });
    	   
    	}
    
</script>

