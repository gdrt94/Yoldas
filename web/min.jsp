<%-- 
    Document   : min
    Created on : 03.02.2014, 19:42:16
    Author     : Gudrat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
</head>
<%@include file="includes/header2.jsp" %>

      <div class="menu">
        <ul>
          <li><a href="<c:url value='main.jsp' />"><span>Şəxsi kabinetim</span></a></li>
          <li><a href="<c:url value='sur.jsp' />"><span>Marşrut təklif et</span></a></li>
          <li><a href="<c:url value='min.jsp' />" class="active"><span>Marşrut axtar</span></a></li>
          <li><a href="<c:url value='logout' />"><span>Çıxış</span></a></li>
        </ul>
      </div>
          
<%@include file="includes/header3.jsp" %>

<div class="FBG">
    <div class="FBG_resize">
        <div class="blok">
            <strong style="padding-left: 400px"> Hazırlanmaqdadır... </strong>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
