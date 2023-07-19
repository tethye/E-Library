package DAO;

import entity.Books;
import entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {

    private Connection con;

    public CartDAOImpl(Connection con){
        this.con = con;
    }

    public boolean addCart(Cart c){
        boolean f=false;

        try{

            String sql = "insert into cart (bid, uid, bname, author, price, totalprice) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUid());
            ps.setString(3, c.getBname());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalprice());

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }


    public List<Cart> getBooksbyUser(int uid){

        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;

        double totalPrice =0;

        try{

            String sql = "select * from cart where uid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, uid);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                c = new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUid(rs.getInt(3));
                c.setBname(rs.getString(4));
                c.setAuthor(rs.getString(5));
                c.setPrice(rs.getDouble(6));

                totalPrice += rs.getDouble(7);
                c.setTotalprice(totalPrice);

                list.add(c);
            }

        }catch(Exception e){
            e.printStackTrace();
        }
     return list;
    }


    public boolean RemoveBook(int bid, int uid, int cid){
        boolean f = false;
        try {
            String sql = "delete from cart where bid = ? and uid = ? and cid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setInt(3, cid);

            int i = ps.executeUpdate();

            if(i==1){
                f= true;
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }


        return f;
    }


}
