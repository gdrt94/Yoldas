/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package az.yoldas.database;

import az.yoldas.domain.User;

/**
 *
 * @author raminorujov
 */
public interface LoginDao {
    User login(String username, String password); 
    
}
