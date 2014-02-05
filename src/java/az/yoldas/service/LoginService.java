/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.yoldas.service;

import net.yoldas.domain.User;

/**
 *
 * @author raminorujov
 */
public interface LoginService {
    User login(String username, String password);
}
