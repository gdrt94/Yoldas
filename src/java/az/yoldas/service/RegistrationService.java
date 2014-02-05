/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package az.yoldas.service;

import az.yoldas.domain.RegistrationForm;

/**
 *
 * @author raminorujov
 */
public interface RegistrationService {
 
    public boolean isUniqueUsername(String username);
    
    public boolean register(RegistrationForm form);
    
}
