<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%-- 参数 --%>
<c:set var="currentPage" value="${result.paging.page}" />
<c:set var="totalPage" value="${result.paging.totalPage}" />
<c:set var="actionUrl" value="${ctx}${pageUrl}/" />

<c:if test="${urlParas == null}">
	<c:set var="urlParas" value="" />
</c:if>
<%-- 1..3,4,5..7 --%>
<c:if test="${(totalPage > 0) && (currentPage <= totalPage)}">
	<c:set var="startPage" value="${currentPage - 1}" />
	<c:if test="${startPage < 1}" >
		<c:set var="startPage" value="1" />
	</c:if>
	<c:set var="endPage" value="${currentPage + 1}" />
	<c:if test="${endPage > totalPage}" >
		<c:set var="endPage" value="totalPage" />
	</c:if>

	<div class="page">
		<c:if test="${currentPage <= 2}">
			<c:set var="startPage" value="1" />
		</c:if>
		
		<c:if test="${(totalPage - currentPage) < 2}">
			<c:set var="endPage" value="${totalPage}" />
		</c:if>
		
		<%-- 是否显示上一页 --%>
		<c:choose>
			<c:when test="${currentPage == 1}">
				<%-- <span class="disabled prev_page">上一页</span> --%>
			</c:when>
			<c:otherwise>
				<a class="prev-page" href="${actionUrl}${currentPage - 1}${urlParas}">上一页</a>
			</c:otherwise>
		</c:choose>
		
		<%-- 显示第一页 --%>
		<c:if test="${currentPage > 2}">
			<a href="${actionUrl}${1}${urlParas}">${1}</a>
			<i>…</i>
		</c:if>
		<%-- 左右相邻的2页--%>
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<c:choose>
				<c:when test="${currentPage == i}">
					<b>&nbsp;${i}&nbsp;</b>
				</c:when>
				<c:otherwise>
					<a href="${actionUrl}${i}${urlParas}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<%-- 显示最后一页 --%>
		<c:if test="${(totalPage - currentPage) >= 2}">
			<i>…</i>
			<a href="${actionUrl}${totalPage}${urlParas}">${totalPage}</a>
		</c:if>
		
		<%-- 显示下一页 --%>
		<c:choose>
			<c:when test="${currentPage == totalPage}">
				<%-- <span class="disabled next_page">下一页</span> --%>
			</c:when>
			<c:otherwise>
				<a class="page-next"  href="${actionUrl}${currentPage + 1}${urlParas}" rel="next">下一页</a>
			</c:otherwise>
		</c:choose>
	</div>
</c:if>