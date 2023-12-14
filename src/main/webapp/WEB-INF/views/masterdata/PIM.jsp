<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="icon" type="image/png" href="${path}/resources/img/logo.png">
  <title>
    	품목정보관리
  </title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <link href="${path}/resources/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/resources/css/nucleo-svg.css" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <link id="pagestyle" href="${path}/resources/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <style>
    /* 추가된 CSS */
    .form-horizontal .form-group {
        margin-bottom: 15px;
    }

    /* 수정된 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        width: 60%; /* 너비 조정 */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
     table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
    }

    /* 마지막 행의 버튼을 우측 정렬 */
    td:last-child {
        text-align: right;
    }
   .alert {
    padding: 20px;
    background-color: #f8d7da;
    color: #721c24;
    margin-bottom: 15px;
    border-radius: 5px;
    display: none;
    border: 1px solid #f5c6cb;
}

/* 닫기 버튼 스타일 */
.closebtn {
    margin-left: 15px;
    color: #721c24;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: #f44336;
}
</style>
  
</head>

<body class="g-sidenav-show  bg-gray-200">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="${path}/main">
        <span class="ms-1 font-weight-bold text-white">디저트카페 EatIt</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav" id="mn">
        <li class="nav-item">
          <a class="nav-link text-white active bg-gradient-primary" href="/">
            <span class="nav-link-text ms-1">메인</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white">
          	<span class="nav-link-text ms-1">기준정보 관리</span>
          </a>
          <!-- 기준정보 관리 서브메뉴 -->
		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/masterdata/BomMain">
		        <span class="nav-link-text ms-1">BOM관리</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
		</li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">자재 관리</span>
          </a>
          
  		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">설비&생산 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">창고 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">납품 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">인사 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
      </ul>
    </div>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
  
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <h6 class="font-weight-bolder mb-0">BOM관리메인</h6>
        </nav>
        
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
          </div>
          
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="<%= request.getContextPath() %>pages/sign-in.html" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">Login</span>
              </a>
            </li>
          </ul>
        </div>       
      </div>
      
    </nav>
    <!-- End Navbar -->
             
      <table border="1">
        <thead>
            <tr>
                <th>품목정보번호</th>
                <th>품목코드</th>
                <th>품목이름</th>
                <th>품목카테고리</th>
                <th>거래처번호</th>
                <th>단위</th>
                <th>납품 단가</th>
                <th>레시피</th>
            </tr>
        </thead>
        <tbody>          
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.product_no}</td>
                    <td>${product.product_code}</td>
                    <td>${product.product_name}</td>
                    <td>${product.product_category}</td>
                    <td>${product.company_no}</td>
                    <td>${product.product_unit}</td>
                    <td>${product.product_price}</td>
                    <td>${product.recipe }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button onclick="openModal()">품목정보등록</button>
    <button onclick="openEditModal()">품목정보수정</button>
    
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <form id="myForm" method="post">
            <table>
                <tr>
                    <td>품목코드:</td>
                    <td><input type="text" name="product_code"></td>
                </tr>
                <tr>
                    <td>품목이름:</td>
                    <td><input type="text" name="product_name"></td>
                </tr>
                <tr>
                    <td>품목카테고리:</td>
                    <td><input type="text" name="product_category"></td>
                </tr>
                <tr>
                    <td>거래처코드:</td>
                    <td><input type="text" name="company_no"></td>
                </tr>
                <tr>
                    <td>단위:</td>
                    <td><input type="text" name="product_unit"></td>
                </tr>
                <tr>
                    <td>납품단가:</td>
                    <td><input type="text" name="product_price"></td>
                </tr>
                <tr>
                    <td>레시피:</td>
                    <td><input type="text" name="recipe"></td>
                </tr>
                
                <tr>
                    <td colspan="2" style="text-align: right;">
                        <input type="submit" value="등록">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeEditModal()">&times;</span>
        <form id="editForm" method="post">
            <table>
            <tr>
                    <td>품목코드:</td>
                    <td><input type="text" name="product_code"></td>
                </tr>
                <tr>
                    <td>품목이름:</td>
                    <td><input type="text" name="product_name"></td>
                </tr>
                <tr>
                    <td>품목카테고리:</td>
                    <td><input type="text" name="product_category"></td>
                </tr>
                <tr>
                    <td>거래처코드:</td>
                    <td><input type="text" name="company_no"></td>
                </tr>
                <tr>
                    <td>단위:</td>
                    <td><input type="text" name="product_unit"></td>
                </tr>
                <tr>
                    <td>납품단가:</td>
                    <td><input type="text" name="product_price"></td>
                </tr>
                <tr>
                    <td>레시피:</td>
                    <td><input type="text" name="recipe"></td>
                </tr>
                
                <tr>
                    <td colspan="2" style="text-align: right;">
                        <input type="submit" value="수정">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

   <script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

   /*  function submitForm() {
        var form = document.getElementById("myForm");
        var formData = new FormData(form);
        console.log(formData);

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/masterdata/PIM", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 요청 성공 처리
                    closeModal(); // 성공 시 모달 닫기
                } else {
                    // 요청 실패 처리
                    alert('등록에 실패했습니다.');
                }
            }
        };
        xhr.send(formData);
    } */
    function openEditModal() {
        document.getElementById("editModal").style.display = "block";
    }

    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }
    function validateForm(formId) {
        const form = document.getElementById(formId);
        const inputs = form.getElementsByTagName('input');

        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value.trim() === '') {
                alert('입력하지 않은 칸이 있습니다!');
                return false;
            }
        }
        return true;
    }

    document.getElementById('myForm').addEventListener('submit', function (event) {
        if (!validateForm('myForm')) {
            event.preventDefault();
        }
    });

    document.getElementById('editForm').addEventListener('submit', function (event) {
        if (!validateForm('editForm')) {
            event.preventDefault();
        }
    });
</script>
      <footer class="footer py-4  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
               	 항상 여러분 곁에는
                <a href="${path}/main" class="font-weight-bold">EatIt</a>
                 <i class="fa fa-heart"></i> 
                                           이 함께합니다.
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
    </div>
  </main>
  <!--   Core JS Files   -->
  <script src="${path}/resources/js/core/popper.min.js"></script>
  <script src="${path}/resources/js/core/bootstrap.min.js"></script>
  <script src="${path}/resources/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/resources/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${path}/resources/js/plugins/jquery.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/smooth-scrollbar"></script>

  <script>
    var ctx = document.getElementById("chart-bars").getContext("2d");

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: ['2020', '2021', '2022', '2023'],
        datasets: [{
          label: "전체 납품량",
          tension: 0.4,
          borderWidth: 0,
          borderRadius: 4,
          borderSkipped: false,
          backgroundColor: "rgba(255, 255, 255, .8)",
          data: [500, 1200, 1700, 2300],
          maxBarThickness: 6
        }, ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5],
              color: 'rgba(255, 255, 255, .2)'
            },
            ticks: {
              suggestedMin: 0,
              suggestedMax: 500,
              beginAtZero: true,
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
              color: "#fff"
            },
          },
          x: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5],
              color: 'rgba(255, 255, 255, .2)'
            },
            ticks: {
              display: true,
              color: '#f8f9fa',
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });


    var ctx2 = document.getElementById("chart-line").getContext("2d");

    new Chart(ctx2, {
      type: "line",
      data: {
        labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12'],
        datasets: [{
          label: "이번달 납품액",
          tension: 0,
          borderWidth: 0,
          pointRadius: 5,
          pointBackgroundColor: "rgba(255, 255, 255, .8)",
          pointBorderColor: "transparent",
          borderColor: "rgba(255, 255, 255, .8)",
          borderColor: "rgba(255, 255, 255, .8)",
          borderWidth: 4,
          backgroundColor: "transparent",
          fill: true,
          data: [5900000, 4900000, 6800000,7300000,6900000],
          maxBarThickness: 6

        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5],
              color: 'rgba(255, 255, 255, .2)'
            },
            ticks: {
              display: true,
              color: '#f8f9fa',
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#f8f9fa',
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });

    var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");

    new Chart(ctx3, {
      type: "line",
      data: {
        labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12'],
        datasets: [{
          label: "이번달 납품량",
          tension: 0,
          borderWidth: 0,
          pointRadius: 5,
          pointBackgroundColor: "rgba(255, 255, 255, .8)",
          pointBorderColor: "transparent",
          borderColor: "rgba(255, 255, 255, .8)",
          borderWidth: 4,
          backgroundColor: "transparent",
          fill: true,
          data: [100, 200,500,300,320],
          maxBarThickness: 6

        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5],
              color: 'rgba(255, 255, 255, .2)'
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#f8f9fa',
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#f8f9fa',
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });
  </script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  
	<script>
	$(document).ready(function () {
	  $("#sm").hide();
	
	  $("ul#mn > li").mouseenter(function () {
	    $("#sm").stop().hide(); // 다른 메뉴 항목에 대한 서브메뉴 감추기
	    $(this).find("#sm").show().css({ height: "0px" }).animate({ height: "125px" });
	  });
	
	  // 마우스가 메뉴 항목에서 벗어날 때 서브메뉴 감추기
	  $("ul#mn > li").mouseleave(function () {
	    $(this).find("#sm").stop().hide();
	  });
	});
	</script>
</body>
</html>