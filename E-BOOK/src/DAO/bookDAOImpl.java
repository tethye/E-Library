package DAO;

import entity.Books;


import java.lang.ref.PhantomReference;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class bookDAOImpl implements bookDAO {

    private Connection con;

    public bookDAOImpl(Connection con) {
        this.con = con;
    }



    @Override
    public boolean addBook(Books b) {
        boolean f = false;

        try{
            String sql = "insert into books (bname, author, price, bcate, status, photo, useremail ) values(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, b.getBname());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBcate());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhoto());
            ps.setString(7, b.getUseremail());

            int i = ps.executeUpdate();
            if(i==1){
                f= true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }


    public List<Books> getAllbooks(){
        List<Books> list = new ArrayList<Books>();
        Books b = null;

        try {
            String sql = "select * from books";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Books();

                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBcate(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));

                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public Books getBookbyID(int id){
        Books b = null;


        try{

            String sql = "select * from books where bid=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                b = new Books();

                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBcate(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }

    public boolean editbook(Books b){
        boolean f = false;

        try{
            String sql ="update books set bname =? , author =?, price =?, status=? where bid=?" ;
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, b.getBname());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5,  b.getBid());

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }

    public boolean DeleteBook(int id){
        boolean f = false;

        try{

            String sql = "delete from books where bid = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }


    public List<Books> getNewBooks(){
        List list = new ArrayList();

        Books b = null;

        try{
            String sql = "select * from books where bcate = ? and status =? order by bid desc";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                b = new Books();

                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBcate(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));

                list.add(b);

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public List<Books> getRecentBooks(){
        List list = new ArrayList();

        Books b = null;

        try{
            String sql = "select * from books where status =? order by bid desc";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                b = new Books();

                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBcate(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));

                list.add(b);

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }


    public List<Books> getOldBooks(){
        List list = new ArrayList();

        Books b = null;

        try{
            String sql = "select * from books where bcate = ? and status =? order by bid desc";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                b = new Books();

                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBcate(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));

                list.add(b);

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }


    public List<Books> getUserOldBooks(String useremail, String bcate){
        List<Books> list = new ArrayList<Books>();
        Books b = null;

        try{

            String sql = "select * from books where bcate = ? and useremail = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, bcate);
            ps.setString(2, useremail);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                b = new Books();

                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBcate(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));

                list.add(b);
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }



    public boolean OldBookDelete(int bid){
        boolean f = false;

        try{

            String sql = "delete from books where bid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bid);;

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }

    public List<Books> Searchbooks(String search){
        List<Books> list = new ArrayList<Books>();
        Books b = null;
        try{

            String sql = "select * from books where concat(bname, author, bcate) like '%"+search+"%'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                b = new Books();

                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBcate(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));

                list.add(b);
            }

        }catch(Exception e){
            e.printStackTrace();
        }


        return list;
    }

}
