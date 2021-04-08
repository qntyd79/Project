<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div class="video-box">
    <video muted autoplay loop id="video-full-bg">
        <!--  <source src="/jhbbs/images/wingtra.mp4" type="video/mp4"> -->
    </video>
</div>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                   <%@ include file="../include/content_header.jsp"%>
                    <article>
                        <h2>Database</h2>
                        <div class="lead">샘플로 제공되는 데이터베이스를 보실 수 있습니다.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-2">
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-road fa-fw"></i></p>
                                            <h1 class="title">차량 장착용 파노라마 이미지 수집</h1>
                                            <h2 class="subtitle">nebula-DSLR은 Nikon D810과 Nikon D850 카메라에 대응하는 거리뷰 촬영 시스템</h2>
                                            <ul class="list">
                                                <li>Nikon D850 카메라 기반 고화질 영상 (4575만 화소)</li>
                                                <li>Applanix AP-20E의 고정밀 GNSS/INS DATA</li>
                                                <li>정확한 거리 산정을 위한 DMI 활용</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-street-view fa-fw"></i></p>
                                            <h1 class="title">차량 장착용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">FOG타입의 고정밀 관성항법장치와 LiDAR 센서가 완벽하게 결합되도록 개발된 제품</h2>
                                            <ul class="list">
                                                <li>Velodyne HDL-32E, Quanergy M8 등 LiDAR DATA 수집</li>
                                                <li>Applanix AP-20E의 고정밀 항법장치 및 POSPac을 통한 데이터 후처리</li>
                                                <li>거리뷰 영상 및 Point Cloud 동시 취득</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-layer-group"></i></p>
                                            <h1 class="title">드론 장착용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">드론용 MMS에서 얻을 수 있는 최상의 데이터 획득이 가능
                                            </h2>
                                            <ul class="list">
                                                <li>DJI Phantom4 PRO, Inspire2 등 촬영 환경에 적합한 UAV 투입</li>
                                                <li>8,000/20,000px의 항공뷰 구축</li>
                                                <li>항공뷰 촬영을 위한 국방부 승인과 서비스를 위한 보안성 검토 실시</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-chess-board"></i></p>
                                            <h1 class="title">UAV형 항공영상 수집</h1>
                                            <h2 class="subtitle">최대 40분 비행시간 최소GSD 0.7cm/px급 정사영상 확보, GSD3cm/px급 최대 4.0㎢ 면적 촬영</h2>
                                            <ul class="list">
                                                <li>수직이착륙형 WingtraOne으로 공간이 협소한 도심의 정사영상 촬영 유리</li>
                                                <li>4,240만 화소의 Sony RX1RII 카메라</li>
                                                <li>최소 GSD 0.7cm/px의 고해상도 영상 및 GSD 3cm/px, 4㎢ 촬영</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-database"></i></p>
                                            <h1 class="title">실내용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">고정밀 IMU기반 관성항법시스템, SLAM 기반 실내매핑장치 대비 우수한 품질의 데이터 획득</h2>
                                            <ul class="list">
                                                <li>Applanix TIMMS Indoor Mapping 장비 보유</li>
                                                <li>Ladybug Spherical Camera와 FARO LiDAR System</li>
                                                <li>23,000㎡/day이상 Mapping 가능</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-qrcode"></i></p>
                                            <h1 class="title">MMS DATA 구축</h1>
                                            <h2 class="subtitle">영상정보, 점군정보, 위치정보 기반 데이터를 구축</h2>
                                            <ul class="list">
                                                <li>Applanix TIMMS Indoor Mapping 장비 보유</li>
                                                <li>Ladybug Spherical Camera와 FARO LiDAR System</li>
                                                <li>23,000㎡/day이상 Mapping 가능</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>