package entity;

public class PdfBook {

    private int pid;
    private String bname;
    private String author;
    private String photo;
    private String pdf;
    private String uname;

    public PdfBook() {

    }

    public PdfBook(String bname, String author, String photo, String pdf, String uname) {
        this.bname = bname;
        this.author = author;
        this.photo = photo;
        this.pdf = pdf;
        this.uname = uname;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPdf() {
        return pdf;
    }

    public void setPdf(String pdf) {
        this.pdf = pdf;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    @Override
    public String toString() {
        return "PdfBook{" +
                "pid=" + pid +
                ", bname='" + bname + '\'' +
                ", author='" + author + '\'' +
                ", photo='" + photo + '\'' +
                ", pdf='" + pdf + '\'' +
                ", uname='" + uname + '\'' +
                '}';
    }
}
