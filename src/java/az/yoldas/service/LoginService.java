/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package az.yoldas.service;

import az.yoldas.domain.User;

/**
 *
 * @author raminorujov
 */
public interface LoginService {
    User login(String username, String password);
}
