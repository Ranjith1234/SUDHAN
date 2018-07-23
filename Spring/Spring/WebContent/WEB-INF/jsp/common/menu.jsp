<%-- 
    Document   : menu
    Created on : 7 Mar, 2016, 9:37:06 AM
    Author     : rajkumar.s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Page Sidebar Header-->
<div class="sidebar-header-wrapper">
    <input type="text" class="searchinput" />
    <i class="searchicon fa fa-search"></i>
    <div class="searchhelper">Search Reports, Charts, Emails or Notifications</div>
</div>
<!-- /Page Sidebar Header -->
<!-- Sidebar Menu -->
<ul class="nav sidebar-menu">

    <c:if test="${not empty moduleList}">

        <c:forEach var="module" items="${moduleList}">
            <c:if test="${module.parent == null}">
                <li class="">
                    <a href="${module.pageName}" ${(not empty module.subModules)? "class='menu-dropdown'":""}>
                        <i class="${module.moduleIcon}"></i>
                        <span class="menu-text"> ${module.moduleName} </span>
                        ${(not empty module.subModules)? "<i class='menu-expand'></i>":""}
                    </a>
                    <c:if test="${not empty module.subModules}">
                        <ul class="submenu">
                            <c:forEach var="submodule" items="${module.subModules}">
                                <li class="">
                                    <a href="${submodule.pageName}">
                                        <i class="${submodule.moduleIcon}"></i>
                                        <span class="menu-text"> ${submodule.moduleName} </span>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </li>
            </c:if>
        </c:forEach>
    </c:if>
</ul>
<!-- /Sidebar Menu -->

