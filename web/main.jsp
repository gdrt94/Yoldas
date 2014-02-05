<%-- 
    Document   : main
    Created on : 02.02.2014, 22:37:41
    Author     : Gudrat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
</head>
<%@include file="includes/header2.jsp" %>

      <div class="menu">
        <ul>
          <li><a href="<c:url value='main.jsp' />" class="active"><span>Şəxsi kabinetim</span></a></li>
          <li><a href="<c:url value='sur.jsp' />"><span>Marşrut təklif et</span></a></li>
          <li><a href="<c:url value='min.jsp' />"><span>Marşrut axtar</span></a></li>
          <li><a href="<c:url value='logout' />"><span>Çıxış</span></a></li>
        </ul>
      </div>
          
<%@include file="includes/header3.jsp" %>

  <div class="FBG">
    <div class="FBG_resize">
      <div class="blok">
    <%--     <h2><span>Image</span> Gallery</h2> --%><br />
    <c:if test="${requestScope.addResult}">
        <strong>${requestScope.addResult} </strong>
    </c:if>
        <img src="images/gallery_1.gif" alt="" width="68" height="68" /><img src="images/gallery_2.gif" alt="" width="68" height="68" /><img src="images/gallery_3.gif" alt="" width="68" height="68" /><img src="images/gallery_4.gif" alt="" width="68" height="68" /><img src="images/gallery_5.gif" alt="" width="68" height="68" /><img src="images/gallery_6.gif" alt="" width="68" height="68" />
        <div class="clr"></div>
        <h2>İstifadəçi məlumatları </h2>
        <p>
            <strong>Id: </strong> ${sessionScope.user.id} <br />
            <strong>İstifadəçi adı: </strong> ${sessionScope.user.username}<br />
          <strong>Adı, soyadı: </strong> ${sessionScope.user.name} ${sessionScope.user.surname}<br />
          <strong>E-mail: </strong> ${sessionScope.user.email}<br />
          <strong>Təklif etdiyi marşrutların sayı:</strong> <br />
          <strong>İstifadə etdiyi marşrutların sayı:</strong> <br />
          <strong>Login vaxtı:</strong> ${sessionScope.loginTime}<br />
        <%--   <a href="#">Facebook profile</a> --%>
        <%--   <a href="#">Əlaqə telefonu</a> --%>

        </p>
      </div>
      <div class="blok">
        <a href="<c:url value='sur.jsp' />"><h2 align="center"><span>Sürücü kimi</span> marşrut təklif et</h2></a>
        <a href="<c:url value='sur.jsp' />"><img src="images/driver2.png" /></a>
      </div>
      <div class="blok">
        <a href="<c:url value='min.jsp' />"><h2 align="center"><span>Sərnişin kimi</span> marşrut axtar</h2></a>
        <a href="<c:url value='min.jsp' />"><img align="center" width="250" height="250" src="images/pedestrian2.png" /></a>
      </div>
      <div class="clr"></div>
    </div>
  </div>


<%@include file="includes/footer.jsp" %>
