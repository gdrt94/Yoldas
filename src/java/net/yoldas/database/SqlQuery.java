/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.yoldas.database;

/**
 *
 * @author raminorujov
 */
public class SqlQuery {
    public static final String LOGIN = "SELECT id, name, surname, email FROM Yoldas.Yoldas_User WHERE username = ? AND passwd = ?";
    
    public static final String CHECK_USERNAME = "SELECT id FROM Yoldas.Yoldas_User WHERE username = ?";
    
    public static final String REGISTER_USER = "INSERT INTO Yoldas.Yoldas_User(id, name, surname, username, passwd, email) VALUES(null, ?, ?, ?, ?, ?);";
}
