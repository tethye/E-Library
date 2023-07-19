package DAO;

import entity.PdfBook;

import java.util.List;

public interface pdfDAO {

    public boolean addpdf(PdfBook p);
    public List<PdfBook> getAllPdf();
    public boolean DeletePDF(int id);
    public List<PdfBook> SearchPDF(String ch);

}
