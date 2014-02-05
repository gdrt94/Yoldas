/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package az.yoldas.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import az.yoldas.domain.RegistrationForm;
import org.apache.commons.validator.GenericValidator;

/**
 *
 * @author raminorujov
 */
public class ValidationUtility {
    
    public static Map<String, List<String>> validateRegistrationForm(RegistrationForm form) {
        Map<String, List<String>> errorMap = new HashMap<>();
        
        //GenericValidator.
        
        // TODO 1.validate username
        List<String> usernameErrors = new ArrayList<>();
        
        if(GenericValidator.isBlankOrNull(form.getUsername())) {
            usernameErrors.add("İstifadəçi adınızı daxil edin");
        }
        
        if(form.getUsername().length() < 4) {
            usernameErrors.add("İstifadəçi adınız ən azı 4 simvoldan ibarət olmalıdır");
        }
        
        if(form.getUsername().length() > 30) {
            usernameErrors.add("İstifadəçi adınız ən çoxu 30 simvoldan ibarət ola bilər");
        }
                       
        errorMap.put("username", usernameErrors);
        
        // TODO 2.validate name
        List<String> nameErrors = new ArrayList<>();   
        if(GenericValidator.isBlankOrNull(form.getName())) {
            nameErrors.add("Adınızı daxil edin");
        }
        
        if(form.getName().length() < 3) {
            nameErrors.add("Daxil etdiyiniz ad çox qısadır");
        }
        
        if(form.getName().length() > 30) {
            nameErrors.add("Daxil etdiyiniz ad çox uzundur");
        }
        errorMap.put("name", nameErrors);
        
        // TODO 3.validate surname
        List<String> surnameErrors = new ArrayList<>();        
        if(GenericValidator.isBlankOrNull(form.getSurname())) {
            surnameErrors.add("Soyadınızı daxil edin");
        }
        
        if(form.getSurname().length() < 3) {
            surnameErrors.add("Daxil etdiyiniz soyadı çox qısadır");
        }
        
        if(form.getSurname().length() > 30) {
            surnameErrors.add("Daxil etdiyiniz soyadı çox uzundur");
        }
        errorMap.put("surname", surnameErrors);
        
        // TODO 4.validate email
        List<String> emailErrors = new ArrayList<>();        
        if(!GenericValidator.isEmail(form.getEmail())) {
            emailErrors.add("Düzgün email daxil edin");
        }
        errorMap.put("email", emailErrors);
        
        // TODO 5.validate password
        List<String> passwordErrors = new ArrayList<>();       
        if(GenericValidator.isBlankOrNull(form.getPassword()) || GenericValidator.isBlankOrNull(form.getPasswordConfirmation())) {
            passwordErrors.add("Şifrəni və daxil edin və təsdiqləyin");
        }
        
        if(!form.getPassword().equals(form.getPasswordConfirmation())) {
            passwordErrors.add("Daxil etdiyiniz şifrələr eyni olmalıdırlar");
        }
        errorMap.put("password", passwordErrors);
        
        // TODO 6.validate captcha
       // List<String> captchaErrors = new ArrayList<>();
       // errorMap.put("captcha", captchaErrors);
        
        return errorMap;
    }
    
}
