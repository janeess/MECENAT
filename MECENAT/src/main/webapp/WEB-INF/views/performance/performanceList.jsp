<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



  <c:forEach var="p" items="${pList }">
            <li tabindex="0" style="display: inline-block;">
               <div class="a">            
<%--                   <input type="hidden" value="${p.rentalCode }"> --%>
                  <div class="img">
                     <c:choose>
	                  <c:when test="${not empty p.originName}">
	                     <img src="${p.changeName}" width="150px" height="200px">
	                  </c:when>
	                  <c:otherwise>
	                     <img src="resources/performanceFiles/nocover.png" width="150px"
	                        height="200px">
	                  </c:otherwise>
               		</c:choose>
                  </div>
                  <div class="cont">
                     <strong class="t">${p.perfoTitle}</strong>
                     <div class="add">${p.perfoContent }</div>
                     <div class="etc clearfix">
                        <span class="date">${p.perfoEventDate }</span>
                        <span class="place">${p.genreName }</span>
                     </div>
   
                  </div>
                  <div class="hover" style="display: none;">
                     <div class="table">
                        <div class="vertical">
                              <a href="detail.perf?rno=${p.rentalCode}" class="d">상세</a>
                        </div>
                     </div>
                  </div>
               </div>
            </li>   
         </c:forEach>
         
         
         <script type="text/javascript">
	// 리스트별 예매 및 상세 페이지 반응형 UI
	$(".bbs-today_thumb li").hover(function(){
		$(this).find(".hover").stop().fadeIn(150);
	},function(){
		$(this).find(".hover").stop().fadeOut(150);
	})
	$(".bbs-today_thumb li").focus(function(){
		$(this).find(".hover").stop().fadeIn(150);
	})
	$(".bbs-today_thumb a:last-child").focusout(function(){
		$(this).closest(".hover").stop().fadeOut(150);
	})
</script>