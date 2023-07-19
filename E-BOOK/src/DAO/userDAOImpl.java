package DAO;

import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userDAOImpl implements userDAO {

    private Connection con;

    public userDAOImpl(Connection con) {
        this.con = con;
    }

    @Override
    public boolean userReg(User us) {
        boolean f= false;

        try{
            String sql = "insert into user (name, email, phno, password) values (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getPassword());
            int i = ps.executeUpdate();
            if(i==1){
                f= true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }

    public User login(String email, String password){

        User us = null;

        try{
            String sql = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAdress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setZip(rs.getString(10));
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return us;
    }

    public boolean checkpass(int id, String pass){
        boolean f = false;
        try{

            String sql = "select * from user where id=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                f= true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }



        return f;
    }

    public boolean updateProfile(User us){
        boolean f = false;

        try{

            String sql = "update user set name=?, email=?, phno=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setInt(4, us.getId());

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }


    public boolean updatelocation(User us){
        boolean f = false;

        try {

            String sql = "update user set adress=?, landmark=?, city=?, state=?, zip=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, us.getAdress());
            ps.setString(2, us.getLandmark());
            ps.setString(3, us.getCity());
            ps.setString(4, us.getState());
            ps.setString(5, us.getZip());
            ps.setInt(6, us.getId());

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }



        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

}
