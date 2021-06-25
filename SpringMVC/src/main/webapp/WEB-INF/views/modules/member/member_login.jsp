<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    <article>
                        <h2>회원로그인</h2>
                        <form>
                            <fieldset>
                                <legend>Member Login Form</legend>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="div-hcenter">
                                            <ul class="content-data-2">
                                                <li>
                                                    <div class="panel">
                                                        <h1 class="logo-box"><a href="/index.do"><img src="/resources/images/logo/logo.png" /></a></h1>
                                                        <div class="form-group">
                                                            <label for="name"> 회원아이디</label>
                                                            <input type="text" id="name" name="name" class="btn-block" placeholder="아이디를 입력해주세요">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="pw"> 비밀번호 </label>
                                                            <input type="password" id="pass" name="pass" class="btn-block" placeholder="비밀번호를 입력해주세요">
                                                        </div>
                                                        <div class="text-left"><input type="checkbox" name="state" value="1" id="state"> 로그인 상태유지</div>
                                                        <div class="btn-group-m">
                                                            <input type="button" value="Login" onclick="location.href='login.do'" 
                                                            class="btn-block danger" style="font-size:20px; height:57px;">
                                                        </div>
                                                        <div class="social-box">
                                                            <a href="#"><i class="fab fa-facebook"></i></a>
                                                            <a href="#"><i class="fab fa-google"></i></a>
                                                            <a href="#"><i class="fab fa-linkedin"></i></a>
                                                            <a href="#"><i class="fab fa-vimeo"></i></a>
                                                            <a href="#"><i class="fab fa-yahoo"></i></a>
                                                            <a href="#"><i class="fab fa-snapchat-ghost"></i></a>
                                                        </div>
                                                        <div class="btn-group-m">
                                                            <input type="button" value="홈" onclick="location.href='index.do'" />
                                                            <input type="button" value="회원가입" onclick="location.href='agree.do'">
                                                            <input type="button" value="아이디/비밀번호찾기" class="modal-open-btn">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="panel">
                                                        <div class="thumbnail">
                                                            <img src="/resources/images/add/s02.jpg" />
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp"/>
<c:import url="/WEB-INF/views/modules/member/member_find.jsp"/>