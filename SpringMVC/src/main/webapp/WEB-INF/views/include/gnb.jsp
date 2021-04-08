<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="gnb-box">
    <nav class="gnb">
        <ul>
            <li><a href="/modules/login/login.do"><i class="fas fa-user-lock"></i> 로그인</a></li>
            <li><a href="/modules/member/member_auth.do"><i class="fas fa-address-card"></i> 회원가입</a></li>
            <li><a href="/index.do"><i class="fas fa-desktop"></i> 메인화면</a></li>
            <li><a href="/contents/sitemap.do"><i class="fas fa-sitemap"></i> 사이트맵</a></li>
            <li><a href="/modules/board/list.do"><i class="fas fa-users"></i> 고객센터</a></li>
            <li><a href="/contents/map.do" target="_blank"><i class="fas fa-map"></i> 지도서비스</a></li>
        </ul>
        <a href="#" id="pull"><i class="fas fa-bars"></i></a>
    </nav>
</div>