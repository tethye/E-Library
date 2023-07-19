package entity;

public class Books {

    private int bid;
    private String bname;
    private String author;
    private String price;
    private String bcate;
    private String status;
    private String photo;
    private String useremail;

    public Books() {
    }

    public Books(String bname, String author, String price, String bcate, String status, String photo, String useremail) {
        this.bname = bname;
        this.author = author;
        this.price = price;
        this.bcate = bcate;
        this.status = status;
        this.photo = photo;
        this.useremail = useremail;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBcate() {
        return bcate;
    }

    public void setBcate(String bcate) {
        this.bcate = bcate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    @Override
    public String toString() {
        return "Books{" +
                "bid=" + bid +
                ", bname='" + bname + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", bcate='" + bcate + '\'' +
                ", status='" + status + '\'' +
                ", photo='" + photo + '\'' +
                ", useremail='" + useremail + '\'' +
                '}';
    }
}
