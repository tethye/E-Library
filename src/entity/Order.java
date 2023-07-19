package entity;

public class Order {

    private int id;
    private String oid;
    private String uname;
    private String email;
    private String phno;
    private String fullad;
    private String payment;
    private String bname;
    private String author;
    private String price;


    public Order() {
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getFullad() {
        return fullad;
    }

    public void setFullad(String fullad) {
        this.fullad = fullad;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
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

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", uname='" + uname + '\'' +
                ", email='" + email + '\'' +
                ", phno='" + phno + '\'' +
                ", fullad='" + fullad + '\'' +
                ", payment='" + payment + '\'' +
                '}';
    }
}
