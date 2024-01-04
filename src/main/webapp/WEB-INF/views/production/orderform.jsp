<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/js.jsp"%>

	<div class="col-11 mx-auto">
	<div class="card my-4">
		<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 ">
			<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pb-3 pe-3 d-flex">
				<h3 class="text-white text-capitalize ps-5 align-items-center mb-0 py-1">발주 목록</h3>
				<div class="ms-md-auto bg-white rounded p-2 d-flex align-items-center">
					<div class="align-items-center d-flex flex-column">
						<div class="input-group input-group-outline">
							<label class="form-label">검색어</label>
							<input type="text" id="searchword" name="searchword" class="form-control" value="${param.searchword }">
						</div>
					</div>
					<div class="align-items-center d-flex flex-column py-1">
						<button id="searchbtn" class="btn btn-outline-primary btn-sm mb-0 py-1 ms-2">검색</button>
					</div>
				</div>
			</div>
		</div>		
	
		<div class="card-body mx-5 px-0 pb-4">
			<div class="table-responsive p-0">
				<form action="" method="post" id="checkbox_form">
				<table class="table align-items-center mb-0">
							<thead>
								<tr>
									<th></th>
									<th class="text-center font-weight-bolder col-1">주문 번호</th>
									<th class="text-center font-weight-bolder col-2">발주 번호</th>
									<th class="text-center font-weight-bolder col-2">제품명</th>
									<th class="text-center font-weight-bolder col-1">수량</th>
									<th class="text-center font-weight-bolder col-1">상태</th>
								</tr>
							</thead>
							<tbody id="employeeTableBody">
						<c:forEach var="ol" items="${orderlist}">
							<tr class="mllist">
								<td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 py-3"><input type="checkbox" name="code" value="${ml.machine_code}"></td>
								<td class="text-center">${ol.order_product_id }</td>
								<td class="text-center">${ol.order_id}</td>
								<td class="text-center">${ol.product_no}</td>
								<td class="text-center">${ol.quantity}</td>
								<td class="text-center">${ol.state}</td>
							</tr>
						</c:forEach>
					</tbody>
						</table>
		</form>
			</div>
		</div>
		<div class="col-6 w-100 text-end">
		
		</div>
		<div class="row">
			<div class="col-sm-5">
				
			</div>
			<div class="col-sm-5">
				<ul class="pagination">
					<c:if test="${pageVO.prev }">
						<li class="page-link link-container"><a href="/machine/${listUrl }?page=${pageVO.endPage-pageVO.displayPageNum }&searchword=${searchword}" class="link"><<</a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
						<li ${pageVO.cri.page == i ? "class='page-link link-container active'" : "class='page-link link-container'"} >
							<a href="/machine/${listUrl }?page=${i }&searchword=${searchword}" ${pageVO.cri.page == i ? "class='link-white'" : "class=''"}>${i }</a>
						</li>				
					</c:forEach>
					<c:if test="${pageVO.next }">
						<li class="page-link link-container"><a href="/machine/${listUrl }?page=${pageVO.startPage+pageVO.displayPageNum }&searchword=${searchword}" class="link">>></a></li>
					</c:if>
				</ul>
			</div>
		</div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>

    
    
</script>

