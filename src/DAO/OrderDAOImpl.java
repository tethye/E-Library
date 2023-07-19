package DAO;

import com.oracle.wls.shaded.org.apache.xpath.operations.Or;
import entity.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.PropertyResourceBundle;

public class OrderDAOImpl implements OrderDAO {

    private Connection con;

    public OrderDAOImpl(Connection con) {
        this.con = con;
    }



    public List<Order> getAllOrder(){
        List<Order> list = new ArrayList<Order>();
        Order o = null;

        try{

            String sql = "select * from bookorder";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                o = new Order();

                o.setId(rs.getInt(1));
                o.setOid(rs.getString(2));
                o.setUname(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullad(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBname(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPayment(rs.getString(10));

                list.add(o);
            }

        }catch (Exception e){
            e.printStackTrace();
        }


        return list;
    }


    public boolean saveorder(List<Order> olist){
        boolean f = false;

        try{

            String sql = "insert into bookorder(oid, uname, email, address, phno, bname, author, price, payment) values(?,?,?,?,?,?,?,?,?)";
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sql);

            for(Order o : olist){
                ps.setString(1, o.getOid());
                ps.setString(2, o.getUname());
                ps.setString(3, o.getEmail());
                ps.setString(4, o.getFullad());
                ps.setString(5, o.getPhno());
                ps.setString(6, o.getBname());
                ps.setString(7, o.getAuthor());
                ps.setString(8, o.getPrice());
                ps.setString(9, o.getPayment());

                ps.addBatch();

            }

            int[] count = ps.executeBatch();
            con.commit();
            f=true;
            con.setAutoCommit(true);


        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    public List<Order> getUserOrder(String email){
        List<Order> list = new ArrayList<Order>();
        Order o =null;

        try{

            String sql = "select * from bookorder where email = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                o = new Order();

                o.setId(rs.getInt(1));
                o.setOid(rs.getString(2));
                o.setUname(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullad(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBname(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPayment(rs.getString(10));

                list.add(o);


            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public boolean DeleteOrder(int id){
        boolean f = false;
        try {
            String sql = "delete from bookorder where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

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
