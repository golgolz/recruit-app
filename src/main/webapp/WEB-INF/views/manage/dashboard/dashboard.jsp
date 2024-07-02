<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>    
	<style>
    .chart-container 
    {
        height: 320px;
        margin-bottom: 10px; 
    }
    .bg-gradient-primary{
    	background-image: linear-gradient(195deg, #ec407a, #d81b60) !important;
    }
    
    .chart.fullscreen {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    z-index: 9999;
    background: white;
}

.chart.fullscreen + .card-body {
    display: none;
}

    </style>
    <!-- AdminLTE CSS -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css"> -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- AdminLTE JS -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script> -->
    <!-- ChartJS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
    <jsp:include page="../../assets/layout/admin/lib.jsp" />
    <script type="text/javascript">
        $(function(){
            $("#dashboard_menu").addClass("bg-gradient-primary");
        });
    </script>
</head>
<body class="hold-transition sidebar-mini">
    <jsp:include page="../../assets/layout/admin/header.jsp" />
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
        <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
            <div class="container-fluid py-1 px-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                        <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">관리자 기능</a></li>
                        <li class="breadcrumb-item text-sm text-dark active" aria-current="page">대시보드</li>
                    </ol>
                    <h6 class="font-weight-bolder mb-0">대시보드</h6>
                </nav>
            </div>
        </nav>
        <!-- golgolz start -->
		<div class="container-fluid">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-12 chart-container">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex">
                                <p class="d-flex flex-column">
                                    <span>회원 가입자 수</span>
                                    <span class="text-bold text-lg">820 명</span>
                                </p>
                            </div>
                            <div class="position-relative mb-4">
                                <canvas id="visitors-chart"></canvas>
                            </div>
                            <div class="d-flex flex-row justify-content-end">
                                <span class="mr-2">
                                    <i class="fas fa-square text-primary"></i> 이번 주
                                </span>
                                <span>
                                    <i class="fas fa-square text-gray"></i> 지난 주
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 chart-container">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex">
                                <p class="d-flex flex-column">
                                    <span>등록 기업 수</span>
                                    <span class="text-bold text-lg">150 개</span>
                                </p>
                            </div>
                            <div class="position-relative mb-4">
                                <canvas id="companies-chart"></canvas>
                            </div>
                            <div class="d-flex flex-row justify-content-end">
                                <span class="mr-2">
                                    <i class="fas fa-square text-primary"></i> 이번 주
                                </span>
                                <span>
                                    <i class="fas fa-square text-gray"></i> 지난 주
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">기술 스택</h3>
                        </div>
                        <div class="card-body">
                            <canvas id="techStack-chart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">등록 리뷰 수</h3>
                        </div>
                        <div class="card-body">
                            <canvas id="reviewCount-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
    
    //회원가입자 수
    $(function () {
        var signupCounts = ${signupCountsLastWeek};
        var labels = [];
        var data = [];

        for (var i = 0; i < signupCounts.length; i++) {
            labels.push(signupCounts[i].signupDate);
            data.push(signupCounts[i].signupCount);
        }

        var ctxSignup = document.getElementById('signup-chart').getContext('2d');
        var signupChart = new Chart(ctxSignup, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: '가입자 수',
                    backgroundColor: 'rgba(60,141,188,0.1)',
                    borderColor: 'rgba(60,141,188,1)',
                    pointRadius: false,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(60,141,188,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: data
                }]
            },
            options: {
                maintainAspectRatio: false,
                responsive: true,
                tooltips: {
                    mode: 'index',
                    intersect: true
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            max: 200
                        }
                    }]
                }
            }
        });
    });

            var ctxCompanies = document.getElementById('companies-chart').getContext('2d');
            var companiesChart = new Chart(ctxCompanies, {
                type: 'line',
                data: {
                    labels: ['18th', '20th', '22nd', '24th', '26th', '28th', '30th'],
                    datasets: [{
                        label: '이번 주',
                        backgroundColor: 'rgba(0,128,0,0.1)',
                        borderColor: 'rgba(0,128,0,1)',
                        pointRadius: false,
                        pointColor: '#008000',
                        pointStrokeColor: 'rgba(0,128,0,1)',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(0,128,0,1)',
                        data: [50, 60, 70, 80, 90, 100, 110]
                    },
                    {
                        label: '지난 주',
                        backgroundColor: 'rgba(210, 214, 222, 0.1)',
                        borderColor: 'rgba(210, 214, 222, 1)',
                        pointRadius: false,
                        pointColor: 'rgba(210, 214, 222, 1)',
                        pointStrokeColor: '#c1c7d1',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(220,220,220,1)',
                        data: [40, 50, 60, 70, 80, 90, 100]
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    tooltips: {
                        mode: 'index',
                        intersect: true
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                max: 200
                            }
                        }]
                    }
                }
            });
            
            // 기술 스택 차트 설정
            var ctxTechStack = document.getElementById('techStack-chart').getContext('2d');
            var techStackChart = new Chart(ctxTechStack, {
                type: 'doughnut',
                data: {
                    labels: ['C언어', '자료구조', '알고리즘', '네트워크', '운영체제'],
                    datasets: [{
                        data: [30, 20, 15, 25, 10],
                        backgroundColor: ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#ff851b']
                    }]
                },
                options: {
                    responsive: true,
                    legend: {
                        position: 'right'
                    }
                }
            });
            
            var ctxReviewCount = document.getElementById('reviewCount-chart').getContext('2d');
            var reviewCountChart = new Chart(ctxReviewCount, {
                type: 'bar',
                data: {
                    labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
                    datasets: [{
                        label: '리뷰 수',
                        data: [12, 19, 3, 5, 2, 3],
                        backgroundColor: 'rgba(255,215,0,0.5)',
                        borderColor: 'rgba(255,215,0,1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
    </script>
    </div>
  	</main>
</body>
</html>
