<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
<validator:javascript formName="commentVO" staticJavascript="false" xhtml="true" cdata="false"/>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                            
                            
                                 <h2><spring:message code="bbs.title.write"/></h2>
                                 <form:form modelAttribute="commentVO" method="post" id="writeForm" name="writeForm" enctype="multipart/form-data" action="insert.do">
                                    <input type="hidden" name="msgStr" value="<c:out value="${msg}"/> ">
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.write"/>" class="board_detail">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="30%" />
                                                <col width="20%" />
                                                <col width="30%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th><label for="userid"><spring:message code="label.userid"/></label></th>
                                                    <td class="text-left"><form:input path="userid" type="text" placeholder="UserID" class="wfull"/> <form:errors path="userid" /></td>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                    <td class="text-left"><form:input path="pass" type="password" placeholder="Password" class="wfull"/> <form:errors path="pass" /> </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"><spring:message code="label.name"/></label></th>
                                                    <td class="text-left"><form:input path="name" type="text"  placeholder="Name" class="wfull"/> <form:errors path="name" /></td>
                                                    <th><label for="email"><spring:message code="label.email"/></label></th>
                                                    <td class="text-left"><form:input path="email" type="text" placeholder="Email" class="wfull"/> <form:errors path="email" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="10" class="text-left">
                                                        <form:textarea  path="content" id="content" placeholder="Content"/> <form:errors path="content"/>
                                                        <script>
                                                            CKEDITOR.replace('content',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});
                                                           	<!--CKEDITOR.instances.content.updateElement();-->
                                                        </script>
                                                        <!--<label for="content"><spring:message code="label.content"/></label>-->   
                                                     </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="code"><spring:message code="label.code"/></label></th>
                                                    <td colspan="3" class="text-left">
                                                        <img id="captchaImg" src="${path}/modules/comment/captchaImg.do" />
                                                        <div id="captchaAudio" style="display:none;"></div>                                                       
                                                        <input type="button" id="refreshBtn" value="<spring:message code="button.refresh"/>" >
                                                        <input type="button" id="audio" value="<spring:message code="button.voice"/>" >  
                                                        <input type="text" id="answer" name="answer" placeholder="CaptchaCode"/> 
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
											<ul>
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do'"/></li>
												<li><input type="button" value="<spring:message code="button.create"/>" onClick="$(this.form).submit();"/></li>												
											</ul>
										</nav>
                                    </fieldset>
                                </form:form>
                                
                                
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp"/>