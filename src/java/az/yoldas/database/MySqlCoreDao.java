/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package az.yoldas.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.sql.DataSource;

/**
 *
 * @author Gudrat
 */
public class MySqlCoreDao implements CoreDao {
    
    private DataSource dataSource;

    public MySqlCoreDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    @Override
    public boolean addTrip(long user_id, double[] dLats, double[] dLngs) {
        boolean success = false;
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = dataSource.getConnection();
            ps = con.prepareStatement(SqlQuery.ADD_TRIP);
            ps.setLong(1, user_id);
            for(int i = 0; i < 7; i++)
                ps.setDouble(2*i+2, dLats[i]);
            for(int i = 0; i < 7; i++)
                ps.setDouble(2*i+3, dLngs[i]);
            
            int count = ps.executeUpdate();
            if(count == 1)
                success = true;
            con.commit();
        } catch(Exception e) {
            try {
                con.rollback();
                e.printStackTrace();
            } catch(SQLException sqle) {
                sqle.printStackTrace();
            }            
        } finally {
            DatabaseUtility.close(null, ps, con);
        }
        return success;
    }
        
}
