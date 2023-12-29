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
							<input type="submit" class="btn btn-outline-primary btn-sm mb-0 py-1 ms-2">						
						</div>											
					</form>							
				</div>				
			</div>			
			<div class="card-body px-0 pb-2">	
				<div class="text-end pe-4 pb-3">
					<a class="btn bg-gradient-dark mb-0" href="">
						<i class="material-icons text-sm">add</i> 상품 추가하기
					</a>
				</div>	
				<div class="table-responsive">
					<table class="table align-items-center mb-0">
						<thead>
							<tr>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제품</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">재고량</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">재고량</th>
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
									<td class="align-middle text-center text-sm">
										<span class="text-xs font-weight-bold">XX개</span>
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


</script>