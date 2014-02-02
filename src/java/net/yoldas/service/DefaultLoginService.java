/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.yoldas.service;

import net.yoldas.database.LoginDao;
import net.yoldas.domain.User;

/**
 *
 * @author raminorujov
 */
public class DefaultLoginService implements LoginService {
    
    private LoginDao loginDao;
    
    public DefaultLoginService(LoginDao loginDao) {
        this.loginDao = loginDao;
    }
    
    @Override
    public User login(String username, String password) {
        return loginDao.login(username, password);
    }           
}
