/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package az.yoldas.database;

/**
 *
 * @author Gudrat
 */
public interface CoreDao {

    public boolean addTrip(long user_id, double[] dLats, double[] dLngs);
}
