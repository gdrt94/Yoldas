<%-- 
    Document   : newjsp
    Created on : 26.01.2014, 19:53:11
    Author     : Gudrat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>YolDaş</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="images/favicon.ico" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

<%-- jquery form validation --%>
<script type="text/javascript" src="jquery-validation-1.11.1/lib/jquery.js" charset="utf-8"></script>
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
                    username: {
                        required: true,
                        alphanumeric: true,
                        minlength: 4,
                        maxlength: 25
                    },  
                    email: {
                        required: true,
                        email: true,
                        maxlength: 50
                    },
                    ad: {
                        required: true,
                        lettersonly: true,
                        minlength: 2,
                        maxlength : 25
                    },
                    soyad: {
                        required: true,
                        lettersonly: true,
                        minlength: 2,
                        maxlength: 25
                    },
                    sifre: {
                        required: true,
                        minlength: 6,
                        maxlength: 30
                    },
                    tesdiqle: {
                        required: true,
                        equalTo: "#sifre"
                    }
                },
                messages: {
                    username: {
                        required: "İstifadəçi adınızı daxil edin",
                        alphanumeric: "İstifadəçi adınız yalnız latın hərflərindən, rəqəmlərdən və alt xətdən ibarət ola bilər",
                        minlength: "İstifadəçi adınız ən azı 4 simvoldan ibarət olmalıdır",
                        maxlength: "İstifadəçi adınız ən çoxu 25 simvoldan ibarət ola bilər"
                    },
                    email: {
                        required: "Emailinizi daxil edin",
                        email: "Düzgün email daxil edin",
                        maxlength: "Emailiniz çox uzundur"
                    },
                    ad: {
                        required: "Adınızı daxil edin",
                        lettersonly: "Adınız yalnız hərflərdən ibarət olmalıdır",
                        minlength: "Daxil etdiyiniz ad çox qısadır",
                        maxlength : "Daxil etdiyiniz ad çox uzundur"
                    },
                    soyad: {
                        required: "Soyadınızı daxil edin",
                        lettersonly: "Soyadınız yalnız hərflərdən ibarət olmalıdır",
                        minlength: "Daxil etdiyiniz soyadı çox qısadır",
                        maxlength : "Daxil etdiyiniz soyadı çox uzundur"
                    },
                    sifre: {
                        required: "Şifrə daxil edin",
                        minlength: "Şifrəniz ən azı 6 simvoldan ibarət olmalıdır",
                        maxlength: "Şifrəniz ən çoxu 30 simvoldan ibarət ola bilər"
                    },
                    tesdiqle:  {
                        required: "Şifrənizi təkrar daxil edin",
                        equalTo: "Daxil etdiyiniz şifrələr tutuşmurlar"       
                    }
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
            
            $("#login").validate({
                rules: {
                    login: {
                        required: true,
                        minlength: 4,
                        maxlength: 25
                    },
                    parol: {
                        required: true,
                        minlength: 6,
                        maxlength: 30
                    }
                },
                messages: {
                    login: {
                        required: "İstifadəçi adı və ya emailinizi daxil edin",
                        minlength: "Belə istifadəçi mövcud deyil",
                        maxlength: "Belə istifadəçi mövcud deyil"
                    },
                    parol: {
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
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
        <table>
            <tr>
                <td>
                    <div class="logo">
                        <h1><a href="index.jsp"><span>Yol</span>Daş<br />
                        <small>Azərbaycanda İlk &nbsp;maşın paylaşımı saytı</small></a></h1>
                    </div>
                </td>
                <td>
                    <h3 style="padding-left: 20px; color:#8fc400; font:normal 13px/1.2em Arial, Helvetica, sans-serif;">Eyni yol ilə gedən sürücülərlə sərnişinləri birləşdiririk!</h3>
                </td>
                <td>
                    <a href="index.jsp">
                        <img src="images/carpool.jpg" width="180" height="84" style="padding-left: 50px"/>
                    </a>
                </td>
            </tr>
        </table>
      <div class="clr"></div>
      <div class="menu">
        <ul>
          <li><a href="index.html" class="active"><span>Ana səhifə</span></a></li>
          <li><a href="services.html"><span>Services</span></a></li>
          <li><a href="about.html"><span>About Us</span></a></li>
          <li><a href="contact.html"><span>Contact Us</span></a></li>
        </ul>
      </div>
  <!--    <div class="search">
        <form id="form1" name="form1" method="post" action="#">
          <label><span>
            <input name="q" type="text" class="keywords" id="textfield" maxlength="50" value="Search..." />
            </span>
            <input name="b" type="image" src="images/search.gif" class="button" />
          </label>
        </form>
      </div> -->
      <div class="clr"></div>
    </div>
     <!--   <div class="headert_text_resize"> <img src="images/img_main.jpg" alt="" width="970" height="338" /> </div> -->

    <div class="clr"></div>
  </div>
  <div class="body">
      <link rel="stylesheet" href="login_files/formoid1/formoid-default-green.css" type="text/css" />          

    <div class="body_resize">
      <div class="left">
      <div class="loginRegister">      
          <form id="register" class="formoid-default-green" style="font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#005500;max-width:480px;min-width:150px" method="post" action="register">
            <div class="title"><h2>Qeydiyyatdan keç</h2></div>
            <div class="element-input"  title="İstifadəçi adınız yalnız latın hərflərindən və rəqəmlərdən ibarət ola bilər"><input class="large" type="text" name="username" placeholder="İstifadəçi adınız" /></div>
            <div class="element-input"  title="Mövcud emailinizi daxil edin"><input class="large" type="text" name="email" placeholder="Emailiniz" /></div>
            <div class="element-input"  title="Əsl adınızı daxil edin"><input class="large" type="text" name="ad" placeholder="Adınız" /></div>
            <div class="element-input"  title="Əsl soyadınızı daxil edin"><input class="large" type="text" name="soyad" placeholder="Soyadınız" /></div>
            <div class="element-password"  title="Etibarlı şifrə fikirləşin"><input id="sifre" class="large" type="password" name="sifre" value="" placeholder="Şifrəniz" /></div>
            <div class="element-password"  title="Şifrənizi yenidən daxil edin"><input class="large" type="password" name="tesdiqle" value="" placeholder="Şifrənizi yenidən daxil edin" /></div>
            <div class="submit"><input type="submit" value="Qeydiyyatı tamamla"/></div>
        </form>          
      </div>
      </div>
      <div class="right">        
      <div class="loginRegister">
        <form id="login" class="formoid-default-green" style="font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#005500;max-width:300px;min-width:150px" method="post" action="login">
            <div class="title"><h2>Daxil ol</h2></div>
            <div class="element-input" ><input class="large" type="text" name="login" placeholder="İstifadəçi adı və ya email" /></div>
            <div class="element-password"  title="Şifrəniz"><input class="large" type="password" name="parol" value="" placeholder="Şifrə" /></div>
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
  <div class="FBG">
    <div class="FBG_resize">
      <div class="blok">
        <h2><span>Image</span> Gallery</h2>
        <img src="images/gallery_1.gif" alt="" width="68" height="68" /><img src="images/gallery_2.gif" alt="" width="68" height="68" /><img src="images/gallery_3.gif" alt="" width="68" height="68" /><img src="images/gallery_4.gif" alt="" width="68" height="68" /><img src="images/gallery_5.gif" alt="" width="68" height="68" /><img src="images/gallery_6.gif" alt="" width="68" height="68" />
        <div class="clr"></div>
        <h2>Contact Info </h2>
        <p><strong>Phone</strong>: +1234567<br />
          <strong>Address</strong>: 123 Put Your Address Here <br />
          <strong>E-mail:</strong> me@jungleland.com<br />
          <a href="#">contact page</a></p>
      </div>
      <div class="blok">
        <h2><span>Lorem</span> Ipsum</h2>
        <p>Lorem ipsum dolor Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. <br />
          Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam.</p>
        <ul>
          <li><a href="#">• consequat molestie</a></li>
          <li><a href="#">• sem justo</a></li>
          <li><a href="#">• semper</a></li>
          <li><a href="#">• magna sed purus</a></li>
        </ul>
      </div>
      <div class="blok">
        <h2>Lorem Ipsum</h2>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. llorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam.</p>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Learn more...</a></p>
        <p><br />
        </p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright <a href="#">MyWebSite</a>.</p>
      <p class="rf">Layout by Hot <a href="http://www.hotwebsitetemplates.net/">Website Templates</a></p>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>
