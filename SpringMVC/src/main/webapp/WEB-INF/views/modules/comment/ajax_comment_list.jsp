<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="commentVO" staticJavascript="false" xhtml="true" cdata="false"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img02"></div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    <article>
                        <!-- 글작성폼 시작 -->
                        <div class="row">
                            <div class="col-md-12">
                            
                            
                               <h2><spring:message code="bbs.title.write"/></h2>
                               <form id="commentForm" name="commentForm">
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
                                                    <td class="text-left"><input id="userid" name="userid" type="text" placeholder="UserID" class="wfull"/> <form:errors path="userid" /></td>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                    <td class="text-left"><input id="pass" name="pass" type="password" placeholder="Password" class="wfull"/> <form:errors path="pass" /> </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"><spring:message code="label.name"/></label></th>
                                                    <td class="text-left"><input id="name" name="name" type="text"  placeholder="Name" class="wfull"/> <form:errors path="name" /></td>
                                                    <th scope="row"><label for="email"><spring:message code="label.email"/></label></th>
                                                    <td class="text-left"><input id="email" name="email" type="text" placeholder="Email" class="wfull"/> <form:errors path="email" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="10" class="text-left">
                                                        <textarea  name="content" id="content" placeholder="Content"></textarea> <form:errors path="content"/>
                                                        <script>
                                                            CKEDITOR.replace('content',{height:150, customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});
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
												<li><input type="button" value="<spring:message code="button.create"/>" onClick="$(this.form).submit();"/></li>												
											</ul>
										</nav>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                        <!-- 글작성폼 종료 -->
                        <!-- 글목록폼 시작 -->
                        <div id="replies"></div>
                        <!-- 글목록폼 종료 -->
                        <!-- 페이징 시작 -->
                        <nav class="paging-group">
                            <ul class="pagination"></ul>
                        </nav>
                        <!-- 페이징 종료 -->
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>

<c:import url="ajax_comment_reply.jsp"/>

<script type="text/javascript">
$(document).ready(function() {

    var board_idx = 1;

    //초기화
    getPageList(1);

    //댓글목록
    function getCommentList() {

        $.getJSON("${path}/modules/comment/ajaxlist/all/" + board_idx, function(data) {

            var str = "";

            $(data).each(function() {
                str += "<div class='row'>" +
                    "<div class='col-sm-12 col-md-12 col-lg-12'>" +
                    "<ul class='content-data-1'>" +
                    "<li data-rno='" + this.comment_idx + "'>" +
                    "<div class='text-left'>" +
                    "<h1 class='title'><p class='modifyname'>" + this.name + "</p></h1>" +
                    "<div class='modifycontent'>" + this.content + "</div>" +
                    "<h3 class='desc text-left' style='padding-top:20px;'>" + this.regdate + "</h3>" +
                    "<input type='button' value='수정하기' class='modal-open-btn'> " +
                    "<input type='button' value='삭제하기' id='deleteBtn'> " +
                    "<input type='button' value='댓글달기' id='replyBtn'>" +
                    "</div>" +
                    "</li>" +
                    "</ul>" +
                    "</div>" +
                    "</div>" +
                    "<hr>";
            });

            $("#replies").html(str);

        });
    }

    //댓글목록페이징
    function getPageList(page) {

        $.getJSON("${path}/modules/comment/ajaxlist/" + board_idx + "/" + page, function(data) {

            var str = "";

            $(data.list).each(function() {

                if (this.depth > 0) {
                    var icon = "<i class='fas fa-comment-alt'></i>&nbsp;";
                } else {
                    var icon = "";
                }

                str += "<div class='row'>" +
                    "<div class='col-sm-12 col-md-12 col-lg-12'>" +
                    "<ul class='content-data-1'>" +
                    "<li data-rno='" + this.comment_idx + "'>" +
                    "<div class='text-left'>" +
                    "<h1 class='title'><p class='modifyname'>" + icon + this.name + "</p></h1>" +
                    "<div class='modifycontent'>" + this.content + "</div>" +
                    "<h3 class='desc text-left' style='padding-top:20px;'>" + this.regdate + "</h3>" +
                    "<input type='button' value='수정하기' id='modifyBtn'> " +
                    "<input type='button' value='삭제하기' id='deleteBtn'> " +
                    "<input type='button' value='댓글달기' id='replyBtn'>" +
                    "</div>" +
                    "</li>" +
                    "</ul>" +
                    "</div>" +
                    "</div>" +
                    "<hr>";
            });

            $("#replies").html(str);

            //페이징 
            printPaging(data.pageMaker);

        });
    }

    //페이징함수 
    function printPaging(pageMaker) {

        var str = "";

        if (pageMaker.prev) {
            str += "<li><a href='" + (pageMaker.page) + "'><i class='fa fa-angle-double-left' aria-hidden='true'></i></a></li>";
            str += "<li><a href='" + (pageMaker.startPage - 1) + "'><i class='fa fa-angle-left' aria-hidden='true'></i></a></li>";
        }

        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
            var strClass = pageMaker.criteria.page == i ? 'class=active' : '';
            str += "<li><a href='" + i + "' " + strClass + ">" + i + "</a></li> ";
        }

        if (pageMaker.next && pageMaker.endPage > 0) {
            str += "<li><a href='" + (pageMaker.endPage + 1) + "'><i class='fa fa-angle-right' aria-hidden='true'></i></a></li>";
            str += "<li><a href='" + (pageMaker.totalPage) + "'><i class='fa fa-angle-double-right' aria-hidden='true'></i></a></li>";
        }

        $(".pagination").html(str);

        //페이징 번호클릭시 처리 
        var replyPage = 1;

        $(".pagination").on("click", "li a", function(event) {
            event.preventDefault();
            replyPage = $(this).attr("href");
            getPageList(replyPage);
        });
    }
	
    //댓글등록    
    $("#commentForm").validate({
    	ignore : '*:not([name])',
        debug: false,
        onfocusout: false,
        // 규칙설정
        rules: {
            userid: {
                required: true,
                minlength: 2,
                alphanumeric: true                
            },
            name: {
                required: true,
                minlength: 2
            },
            pass: {
                required: true,
                rangelength: [4,15],
                passwordCk: true
            },
            email: {
                required: true,
                minlength: 2
            },          
            content: {
            	//https://dzone.com/articles/using-jquery-validate-plugin 참고사이트
                required: function(textarea) {
                	CKEDITOR.instances[textarea.id].updateElement(); // update textarea
			        var editorcontent = textarea.value.replace(/<[^>]*>/gi, ''); // strip tags					
			        return editorcontent.length === 0;
                },
                minlength: 5
            },
			answer: {
				required : true,
				numeric : true,
				maxlength : 6
			}          
        },
        messages: { //규칙체크 실패시 출력될 메시지 설정
            userid: {
                required: "아이디를 입력하세요.",
                minlength: $.validator.format("아이디는 최소{0}글자 이상 입력하세요."),
                alphanumeric: "알파벳과 숫자만 사용 가능합니다."
            },
            name: {
                required: "이름을 입력하세요",
                minlength: $.validator.format("이름은 최소{0}글자 이상 입력하세요.")

            },
            pass: {
                required: "비밀번호를 입력하세요",
                rangelength: $.validator.format("패스워드는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                passwordCk: "비밀번호는 영문대소문자,숫자,특수문자를 반드시 입력해주시기 바랍니다."

            },
            email: {
                required: "이메일을 입력하세요",
                minlength: $.validator.format("이메일은 최소{0}글자 이상 입력하세요."),
                email: "올바른 이메일 주소가 아닙니다."
            },			
            content: {
				required: "내용을 입력하세요.",
                minlength: $.validator.format("내용은 최소{0}글자 이상 입력하세요.")
            },
			answer: {
				required: "자동등록방지를 입력하세요.",
				numeric: $.validator.format("자동등록방지는 숫자만 입력하세요.")
			}
        },
		// 달력옆에 메세지 출력 
        errorPlacement: function(error, element) {           
			// content에 내용입력시 에러메세지 안보임처리 
			CKEDITOR.instances.content.on('change', function() {    
			    if(CKEDITOR.instances.content.getData().length >  0) {
			      $('label[for="content"]').hide();
			    } else {
				  $('label[for="content"]').show();
				}
			});
        }, 
		// 에러메세지 표시 설정 : 주석처리하면 에러메세지 보여짐 
		/* errorPlacement: function(error, element) {
           $(element).removeClass('error');
        }, */
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            	// 팝업알림처리 
                // alert(validator.errorList[0].message);
				// 필드아래처리 
                // validator.errorList[0].element.focus();
            }
        },
        submitHandler: function(form) {  

        	CKupdate();

            //화면입력값 변수처리
            var userid = $("#userid").val();
            var pass = $("#pass").val();
            var name = $("#name").val();
            var email = $("#email").val();
            var content = $("#content").val();
            
        	//ajax
            $.ajax({
                type: "POST",
                url: "ajaxInsert",
                headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
                dataType: "text",
                async:false,
                data: JSON.stringify({ // stringify는 json개체를 string개체로 변환
                    userid: userid,
                    pass: pass,
                    name: name,
                    email: email,
                    content: content,
                    board_idx: 1
                }),
                success: function(result) {

                    //서비스 성공 시 처리 할 내용
                    if (result == "insertSuccess") {
                        alert("댓글등록 완료");
                    }

                    //댓글목록출력
                    getPageList(1);

                    //댓글입력폼 초기화
                    $("#userid").val("");
                    $("#pass").val("");
                    $("#name").val("");
                    $("#email").val("");
                    $("#answer").val("");
                    CKreset();
                },
                error: function(request, status, error) {
                    // 서비스 실패 시 처리 할 내용
                    alert("댓글등록 실패");
                }
            });
   
        }
    });	

    //댓글목록에서 수정하기 버튼 클릭시 
    $("#replies").on("click", "#modifyBtn", function() {

        // 모달창 뛰우기 
        $('.modal-box').addClass('modal-on');
        $('.modal-back').addClass('back-on');
        $('body').addClass('body-lock');

        var comment = $(this).parent().parent();
        var comment_idx = comment.attr("data-rno");

        //ajax통신
        $.ajax({
            type: "GET",
            url: "${path}/modules/comment/ajaxlist/read/" + comment_idx,
            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "GET" },
            dataType: "json",
            success: function(result) {

                //서비스 성공 시 처리 할 내용                  
                $("#replycomment_idx").val(result.comment_idx);
                $("#replyuserid").val(result.userid);
                $("#replypass").val(result.pass);
                $("#replyname").val(result.name);
                $("#replyemail").val(result.email);
                var html = $("#replyeditor").val(result.content);
                CKEDITOR.instances['replyeditor'].setData(html);
            },
            error: function(request, status, error) {

                //서비스 실패 시 처리 할 내용              
                alert("댓글보기 실패");
            }
        });
    });

    //모달댓글수정
    $("#modifyBtn").on("click", function() {

        CKupdate();

        //화면입력값 변수처리
        var comment_idx = $("#replycomment_idx").val();
        var email = $("#replyemail").val();
        var content = $("#editor1").val();

        //ajax통신
        $.ajax({
            type: "PUT",
            url: "${path}/modules/comment/ajaxlist/modify/" + comment_idx,
            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "PUT" },
            dataType: "text",
            data: JSON.stringify({ //stringify는 json개체를 string개체로 변환
                comment_idx: comment_idx,
                email: email,
                content: content
            }),
            success: function(result) {

                //서비스 성공 시 처리 할 내용
                if (result == "modifySuccess") {
                    alert("댓글수정 완료");
                    $('.modal-box').removeClass('modal-on');
                    $('.modal-back').removeClass('back-on');
                    $('body').removeClass('body-lock');
                }

                //댓글목록출력
                getPageList(1);
            },
            error: function(request, status, error) {

                //서비스 실패 시 처리 할 내용
                alert("댓글수정 실패");
            }
        });
    });

    //목록댓글삭제 
    $("#replies").on("click", "#deleteBtn", function() {

        //화면입력값 변수처리
        var comment = $(this).parent().parent();
        var comment_idx = comment.attr("data-rno");

        //ajax 통신
        $.ajax({
            type: "DELETE",
            url: "${path}/modules/comment/ajaxlist/delete/" + comment_idx,
            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "DELETE" },
            dataType: "text",
            data: JSON.stringify({
                comment_idx: comment_idx
            }),
            success: function(result) {

                //서비스 성공 시 처리 할 내용
                if (result == "deleteSuccess") {
                    alert("댓글삭제 완료");
                }

                //댓글목록출력
                getPageList(1);
            },
            error: function(request, status, error) {

                // 서비스 실패 시 처리 할 내용
                alert("댓글삭제 실패");
            }
        });
    });

    //댓글목록에서 답글하기 버튼 클릭시 답글등록창 실행 
    $("#replies").on("click", "#replyBtn", function() {

        // 모달창 뛰우기 
        $('.modal-box').addClass('modal-on');
        $('.modal-back').addClass('back-on');
        $('body').addClass('body-lock');

        var comment = $(this).parent().parent();
        var comment_idx = comment.attr("data-rno");

        //ajax통신
        $.ajax({
            type: "GET",
            url: "${path}/modules/comment/ajaxlist/read/" + comment_idx,
            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "GET" },
            dataType: "json",
            success: function(result) {

                //서비스 성공 시 처리 할 내용                  
                $("#replycomment_idx").val(result.comment_idx);
                $("#replyparent").val(result.parent);
                $("#replydepth").val(result.depth);
                $("#replysortno").val(result.sortno);
            },
            error: function(request, status, error) {

                //서비스 실패 시 처리 할 내용              
                alert("댓글보기 실패");
            }
        });
    });

    //답글달기 
    $("#replyBtn").on("click", function() {

        CKupdate();

        //화면입력값 변수처리
        var comment_idx = $("#replycomment_idx").val();
        var parent = $("#replyparent").val();
        var depth = $("#replydepth").val();
        var sortno = $("#replysortno").val();
        var userid = $("#replyuserid").val();
        var pass = $("#replypass").val();
        var name = $("#replyname").val();
        var email = $("#replyemail").val();
        var content = $("#replyeditor").val();

        //ajax
        $.ajax({
            type: "POST",
            url: "ajaxInsert",
            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
            dataType: "text",
            data: JSON.stringify({ // stringify는 json개체를 string개체로 변환
                comment_idx: comment_idx,
                parent: parent,
                depth: depth,
                sortno: sortno,
                userid: userid,
                pass: pass,
                name: name,
                email: email,
                content: content,
                board_idx: 1
            }),
            success: function(result) {

                //서비스 성공 시 처리 할 내용
                if (result == "insertSuccess") {
                    alert("답글등록 완료");
                    $('.modal-box').removeClass('modal-on');
                    $('.modal-back').removeClass('back-on');
                    $('body').removeClass('body-lock');
                }

                //댓글목록출력
                getPageList(1);

                //화면입력폼 초기화 
                $("#replyuserid").val("");
                $("#replypass").val("");
                $("#replyname").val("");
                $("#replyemail").val("");
                CKreset();
            },
            error: function(request, status, error) {

                // 서비스 실패 시 처리 할 내용
                alert("댓글등록 실패");
            }
        });
    });

    //AJAX 로 폼의 데이터를 전송할 때 CKEDITOR로 변환 된 textarea값을 다시 변경해줘야 데이터가 전달된다.
    function CKupdate() {
        for (instance in CKEDITOR.instances)
            CKEDITOR.instances[instance].updateElement();
    }

    function CKreset() {
        for (instance in CKEDITOR.instances)
            CKEDITOR.instances[instance].setData("");
    }

});
</script>