<%-- 
    Document   : newjsp
    Created on : 26.01.2014, 19:53:11
    Author     : Gudrat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>

<script type="text/javascript" src="jquery-validation-1.11.1/dist/jquery.validate.js" charset="utf-8"></script>       
<script type="text/javascript" src="jquery-validation-1.11.1/dist/additional-methods.js" charset="utf-8"></script>       
<script type="text/javascript" charset="utf-8">
$.validator.setDefaults({
	submitHandler: function() { alert("submitted!"); }
});

$().ready(function() {
            //form validation rules
            $("#register").validate({
                rules: {
                    email: {
                        required: true,
                        email: true,
                        maxlength: 50
                    },
                    name: {
                        required: true,
                        lettersonly: true,
                        minlength: 2,
                        maxlength : 30
                    },
                    surname: {
                        required: true,
                        lettersonly: true,
                        minlength: 2,
                        maxlength: 30
                    },
                    username: {
                        required: true,
                        alphanumeric: true,
                        minlength: 4,
                        maxlength: 30
                    },  
                    password: {
                        required: true,
                        minlength: 6,
                        maxlength: 30
                    },
                    passwordConfirmation: {
                        required: true,
                        equalTo: "#password"
                    }
                },
                messages: {
                    email: {
                        required: "Emailinizi daxil edin",
                        email: "Düzgün email daxil edin",
                        maxlength: "Emailiniz çox uzundur"
                    },
                    name: {
                        required: "Adınızı daxil edin",
                        lettersonly: "Adınız yalnız hərflərdən ibarət olmalıdır",
                        minlength: "Daxil etdiyiniz ad çox qısadır",
                        maxlength : "Daxil etdiyiniz ad çox uzundur"
                    },
                    surname: {
                        required: "Soyadınızı daxil edin",
                        lettersonly: "Soyadınız yalnız hərflərdən ibarət olmalıdır",
                        minlength: "Daxil etdiyiniz soyadı çox qısadır",
                        maxlength : "Daxil etdiyiniz soyadı çox uzundur"
                    },
                    username: {
                        required: "İstifadəçi adı daxil edin",
                        alphanumeric: "İstifadəçi adınız yalnız latın hərflərindən, rəqəmlərdən və alt xətdən ibarət ola bilər",
                        minlength: "İstifadəçi adınız ən azı 4 simvoldan ibarət olmalıdır",
                        maxlength: "İstifadəçi adınız ən çoxu 30 simvoldan ibarət ola bilər"
                    },                    
                    password: {
                        required: "Şifrə daxil edin",
                        minlength: "Şifrəniz ən azı 6 simvoldan ibarət olmalıdır",
                        maxlength: "Şifrəniz ən çoxu 30 simvoldan ibarət ola bilər"
                    },
                    passwordConfirmation:  {
                        required: "Şifrənizi təkrar daxil edin",
                        equalTo: "Daxil etdiyiniz şifrələr eyni olmalıdırlar"       
                    }
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
            
            $("#login").validate({
                rules: {
                    username: {
                        required: true,
                        minlength: 4,
                        maxlength: 30
                    },
                    password: {
                        required: true,
                        minlength: 6,
                        maxlength: 30
                    }
                },
                messages: {
                    username: {
                        required: "İstifadəçi adınızı daxil edin",
                        minlength: "Belə istifadəçi mövcud deyil",
                        maxlength: "Belə istifadəçi mövcud deyil"
                    },
                    password: {
                        required: "Şifrənizi daxil edin",
                        minlength: "Şifrənizi düzgün daxil edin",
                        maxlength: "Şifrənizi düzgün daxil edin"
                    }
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });	
});
</script>
</head>
<%@include file="includes/header2.jsp" %>

      <div class="menu">
        <ul>
          <li><a href="<c:url value='index.jsp' />" class="active"><span>Ana səhifə</span></a></li>
          <li><a href="services.html"><span>Xidmətlər</span></a></li>
          <li><a href="about.html"><span>Haqqımızda</span></a></li>
          <li><a href="contact.html"><span>Əlaqə</span></a></li>
        </ul>
      </div>

<%@include file="includes/header3.jsp" %>

  <div class="body">
      <link rel="stylesheet" href="login_files/formoid1/formoid-default-green.css" type="text/css" />          

    <div class="body_resize">
      <div class="left">
      <div class="loginRegister">      
          <form id="register" class="formoid-default-green" style="font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#005500;max-width:480px;min-width:150px" method="post" action="cs?action=register">
            <div class="title"><h2>Qeydiyyatdan keç</h2></div>
            <c:if test="${requestScope.message!=null}">
                ${requestScope.message} <br />
            </c:if>
            <c:choose>
                <c:when test="${not empty sessionScope.registrationErrors.email}">
                    <div class="element-input"  title="Mövcud emailinizi daxil edin">
                        <input class="large" type="text" name="email" value="${sessionScope.registrationForm.email}" placeholder="Emailiniz" />
                    </div>
                    <c:forEach var="err" items="${sessionScope.registrationErrors.email}">
                        ${err} <br/>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="element-input"  title="Mövcud emailinizi daxil edin">
                        <input class="large" type="text" name="email" placeholder="Emailiniz" />
                    </div>
                </c:otherwise>
            </c:choose>
                    
            <c:choose>
                <c:when test="${not empty sessionScope.registrationErrors.name}">
                    <div class="element-input"  title="Əsl adınızı daxil edin">
                        <input class="large" type="text" name="name" value="${sessionScope.registrationForm.name}" placeholder="Adınız" />
                    </div>
                    <c:forEach var="err" items="${sessionScope.registrationErrors.name}">
                        ${err} <br/>
                    </c:forEach>              
                </c:when>
                <c:otherwise>
                    <div class="element-input"  title="Əsl adınızı daxil edin">
                        <input class="large" type="text" name="name" placeholder="Adınız" />
                    </div>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${not empty sessionScope.registrationErrors.surname}">
                    <div class="element-input"  title="Əsl soyadınızı daxil edin">
                        <input class="large" type="text" name="surname" value="${sessionScope.registrationForm.surname}" placeholder="Soyadınız" />
                    </div>
                    <c:forEach var="err" items="${sessionScope.registrationErrors.surname}">
                        ${err} <br/>
                    </c:forEach>              
                </c:when>
                <c:otherwise>
                    <div class="element-input"  title="Əsl soyadınızı daxil edin">
                        <input class="large" type="text" name="surname" placeholder="Soyadınız" />
                    </div>
                </c:otherwise>
            </c:choose>
                        
            <c:choose>
                <c:when test="${not empty sessionScope.registrationErrors.username}">
                    <div class="element-input"  title="İstifadəçi adınız yalnız latın hərflərindən, rəqəmlərdən və alt xətdən ibarət ola bilər">
                        <input id="username" class="large" type="text" name="username" value="${sessionScope.registrationForm.username}" placeholder="İstifadəçi adınız" />
                    </div> 
                    <c:forEach var="err" items="${sessionScope.registrationErrors.username}">
                        ${err} <br/>
                    </c:forEach>              
                </c:when>
                <c:otherwise>
                    <div class="element-input"  title="İstifadəçi adınız yalnız latın hərflərindən, rəqəmlərdən və alt xətdən ibarət ola bilər">
                        <input id="username" class="large" type="text" name="username" placeholder="İstifadəçi adınız" />
                    </div>            
                </c:otherwise>
            </c:choose>
                                                
            <div class="element-password"  title="Etibarlı şifrə seçin">
                <input id="password" class="large" type="password" name="password" value="" placeholder="Şifrəniz" />
            </div>
            <c:if test="${not empty sessionScope.registrationErrors.password}">
                <c:forEach var="err" items="${sessionScope.registrationErrors.password}">
                    ${err} <br/>
                </c:forEach>
            </c:if>
                                        
            <div class="element-password"  title="Şifrənizi yenidən daxil edin">
                <input class="large" type="password" name="passwordConfirmation" value="" placeholder="Şifrənizi yenidən daxil edin" />
            </div>
                    
            <div class="submit"><input type="submit" value="Qeydiyyatı tamamla"/></div>
            
        </form>          
      </div>
      </div>
      <div class="right">        
      <div class="loginRegister">
        <form id="login" class="formoid-default-green" style="font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#005500;max-width:300px;min-width:150px" method="post" action="login">
            <div class="title"><h2>Daxil ol</h2></div>
            <c:if test="${requestScope.loginMessage!=null}">
                ${requestScope.loginMessage} <br />
            </c:if>
            <div class="element-input" title="İstifadəçi adınızı daxil edin"><input class="large" type="text" name="username" placeholder="İstifadəçi adı" /></div>
            <div class="element-password"  title="Şifrənizi daxil edin"><input class="large" type="password" name="password" value="" placeholder="Şifrə" /></div>
            <div class="submit"><input type="submit" value="Giriş"/></div>
        </form>
      </div>  
      </div>    
      <div class="left">
        <h2>Template License<br />
          <span> March 16, 2010 | Posted by Owner | Filed under templates, internet</span> </h2>
        <img src="images/img_1.jpg" alt="" width="585" height="156" />
        <div class="clr"></div>
        <p>This is a free CSS website template by HotWebsiteTemplates.net. This work is distributed under the <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 License</a>, which means that you are free to use it for any personal or commercial purpose provided you credit me in the form of a link back to HotWebsiteTemplates.net.</p>
        <p> <a href="#">Read more | Comments (5)</a><br />
        </p>
        <h2>Aliquam Risus Justo<br />
          <span>March 16, 2010 | Posted by Owner | Filed under templates, internet</span></h2>
        <img src="images/img_2.jpg" alt="" width="585" height="156" />
        <div class="clr"></div>
        <p><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a> Sed euismod aliquet nunc vel porta. Morbi non mi id diam mattis consequat. Mauris pharetra fermentum tortor quis sagittis. Fusce rutrum ipsum lectus, vel congue velit. Nulla ultrices pretium congue. Mauris metus nibh, pulvinar vel vehicula eu, pharetra id ante. Vivamus tincidunt semper sapien ut fermentum. Nullam facilisis, nulla eu suscipit vulputate, libero nisl pellentesque tellus, ac scelerisque metus mauris ut quam. Nulla facilisi. Quisque rhoncus dolor et dolor lobortis accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse at nulla ante, at hendrerit mi. Aenean in ipsum massa. Pellentesque semper elit quis mauris ultricies ultrices. Sed sit amet felis tellus. Suspendisse potenti.</p>
        <p><a href="#">Read more | Comments (5)</a></p>
      </div>
      <div class="right">
        <h2>Sidebar Menu</h2>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">TemplateInfo</a></li>
          <li><a href="#">Style Demo</a></li>
          <li><a href="#">Blog</a></li>
          <li><a href="#">Archives</a></li>
        </ul>
        <h2>Sponsors</h2>
        <ul class="sponsors">
          <li class="sponsors"><a href="http://www.dreamtemplate.com">DreamTemplate</a><br />
            Over 6,000+ Premium Web Templates</li>
          <li class="sponsors"><a href="http://www.templatesold.com/">TemplateSOLD</a><br />
            Premium WordPress &amp; Joomla Themes</li>
          <li class="sponsors"><a href="http://www.imhosted.com">ImHosted.com</a><br />
            Affordable Web Hosting Provider</li>
          <li class="sponsors"><a href="http://www.csshub.com/">CSS Hub</a><br />
            Premium CSS Templates</li>
          <li class="sponsors"><a href="http://www.evrsoft.com">Evrsoft</a><br />
            Website Builder Software &amp; Tools</li>
          <li class="sponsors"><a href="http://www.myvectorstore.com">MyVectorStore</a><br />
            Royalty Free Stock Icons</li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
<%@include file="includes/footer.jsp" %>
