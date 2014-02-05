/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package az.yoldas.database;

/**
 *
 * @author raminorujov
 */
public class SqlQuery {
    public static final String LOGIN = "SELECT id, name, surname, email FROM Yoldas.Yoldas_User WHERE username = ? AND passwd = ?";
    
    public static final String CHECK_USERNAME = "SELECT id FROM Yoldas.Yoldas_User WHERE username = ?";
    
    public static final String REGISTER_USER = "INSERT INTO Yoldas.Yoldas_User(id, name, surname, username, passwd, email) VALUES(null, ?, ?, ?, ?, ?);";
    
    public static final String ADD_TRIP = "INSERT INTO Yoldas.Users_Trip(user_id, fromlat, fromlng, tolat, tolng, yol2lat, yol2lng, yol3lat, yol3lng, yol4lat, yol4lng, yol5lat, yol5lng, yol6lat, yol6lng) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
}
