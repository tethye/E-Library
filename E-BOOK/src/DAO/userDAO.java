package DAO;

import entity.User;

import java.sql.SQLException;

public interface userDAO {

    public boolean userReg(User us);
    public User login(String email, String password);
    public boolean checkpass(int id, String pass);
    public boolean updateProfile(User us);
    public boolean updatelocation(User us);
}
