<%-- 
    Document   : tester
    Created on : 30.01.2014, 19:06:22
    Author     : Gudrat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <title>JSP Page</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="jquery-validation-1.11.1/lib/jquery.js"></script>
        <script type="text/javascript" src="jquery-validation-1.11.1/dist/jquery.validate.js"></script>       
        <script type="text/javascript" src="jquery-validation-1.11.1/dist/additional-methods.js"></script>     
        <script type="text/javascript">
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
                        minlength: 4                   
                    },  
                    email: {
                        required: true,
                        email: true
                    },
                    sifre: {
                        required: true,
                        minlength: 6
                    },
                    tesdiqle: {
                        required: true,
                        equalTo: "#sifre"
                    }
                },
                messages: {
                    username: {
                        required: "Please enter your username",
                        alphanumeric: "fuck you motherfucker@@1111%^%%&*%",
                        minlength: "cox balacadir"
                    },
                    sifre: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 6 characters long"
                    },
                    email: "Please enter a valid email address",
                    tesdiqle:  "Daxil etdiyiniz şifrələr tutuşmurlar"                    
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
            
            $("#login").validate({
                rules: {
                    login: {
                        required: true,
                        minlength: 4
                    },
                    parol: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    login: {
                        required: "İstifadəçi adı və ya emailinizi daxil edin",
                        minlength: "Belə istifadəçi mövcud deyil"
                    },
                    parol: {
                        required: "Şifrənizi daxil edin",
                        minlength: "Şifrənizi düzgün daxil edin"
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
            <link rel="stylesheet" href="login_files/formoid1/formoid-default-green.css" type="text/css" />
            <script type="text/javascript" src="login_files/formoid1/jquery.min.js"></script>
            <script type="text/javascript" src="login_files/formoid1/formoid-default-green.js"></script>  
      
        <form id="register" class="formoid-default-green" style="font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#005500;max-width:480px;min-width:150px" method="post" action="register">
            <div class="title"><h2>Qeydiyyatdan keç</h2></div>
            <div class="element-input"  title="İstifadəçi adınız yalnız latın hərflərindən və rəqəmlərdən ibarət ola bilər"><input class="large" type="text" name="username" placeholder="İstifadəçi adınız" /></div>
            <div class="element-input"  title="Mövcud emailinizi daxil edin"><input class="large" type="text" name="email" placeholder="Emailiniz" /></div>
            <div class="element-input"  title="Əsl adınızı daxil edin"><input class="large" type="text" name="ad" placeholder="Adınız" /></div>
            <div class="element-input"  title="Əsl soyadınızı daxil edin"><input class="large" type="text" name="soyad" placeholder="Soyadınız" /></div>
            <div class="element-password"  title="Etibarlı şifrə fikirləşin"><input id="sifre" class="large" type="password" name="sifre" value="" placeholder="Şifrəniz" /></div>
            <div class="element-password"  title="Şifrənizi yenidən daxil edin"><input id="tesdiqle" class="large" type="password" name="tesdiqle" value="" placeholder="Təkrar şifrəniz" /></div>
            <div class="submit"><input type="submit" value="Qeydiyyatı tamamla"/></div>
        </form>  
        
         <form id="login" class="formoid-default-green" style="font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#005500;max-width:300px;min-width:150px" method="post" action="login">
            <div class="title"><h2>Daxil ol</h2></div>
            <div class="element-input" ><input class="large" type="text" name="login" placeholder="İstifadəçi adı və ya email" /></div>
            <div class="element-password"  title="Şifrəniz"><input class="large" type="password" name="parol" value="" placeholder="Şifrə" /></div>
            <div class="submit"><input type="submit" value="Giriş"/></div>
        </form>
    </body>
</html>
