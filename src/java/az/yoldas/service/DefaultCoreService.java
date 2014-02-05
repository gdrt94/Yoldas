/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package az.yoldas.service;

import az.yoldas.database.CoreDao;

/**
 *
 * @author Gudrat
 */
public class DefaultCoreService implements CoreService {
    
    private CoreDao coreDao;
    
    public DefaultCoreService(CoreDao coreDao) {
        this.coreDao = coreDao;
    }  
    
    @Override
    public boolean addTrip(long user_id, double[] dLats, double[] dLngs) {
        return coreDao.addTrip(user_id, dLats, dLngs);
    }
}
