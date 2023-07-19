package DAO;

import entity.PdfBook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class pdfDAOImpl {

    private Connection con;

    public pdfDAOImpl(Connection con) {
        this.con = con;
    }

    public boolean addpdf(PdfBook p){
        boolean f=false;

        try{

            String sql = "insert into bpdf (bname, author, photo, pdf, uname) values (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);


            ps.setString(1, p.getBname());
            ps.setString(2, p.getAuthor());
            ps.setString(3, p.getPhoto());
            ps.setString(4, p.getPdf());
            ps.setString(5, p.getUname());

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }


        return f;
    }

    public List<PdfBook> getAllPdf(){
        List<PdfBook> list = new ArrayList<PdfBook>();
        PdfBook p = null;

        try {
            String sql = "select * from bpdf";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p = new PdfBook();

                p.setPid(rs.getInt(1));
                p.setBname(rs.getString(2));
                p.setAuthor(rs.getString(3));
                p.setPhoto(rs.getString(4));
                p.setPdf(rs.getString(5));
                p.setUname(rs.getString(6));

                list.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean DeletePDF(int id){
        boolean f = false;
        try {
            String sql = "delete from bpdf where pid=?";
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

    public List<PdfBook> SearchPDF(String ch){
        List<PdfBook> list = new ArrayList<PdfBook>();
        PdfBook p = null;
        try{

            String sql = "select * from bpdf where concat(bname, author, uname) like '%"+ch+"%'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                p = new PdfBook();

                p.setPid(rs.getInt(1));
                p.setBname(rs.getString(2));
                p.setAuthor(rs.getString(3));
                p.setPhoto(rs.getString(4));
                p.setPdf(rs.getString(5));
                p.setUname(rs.getString(6));

                list.add(p);
            }

        }catch(Exception e){
            e.printStackTrace();
        }


        return list;
    }

}
