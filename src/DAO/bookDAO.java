package DAO;

import entity.Books;

import java.util.List;


public interface bookDAO {
    public boolean addBook(Books b);

    public List<Books> getAllbooks();

    public Books getBookbyID(int id);

    public boolean editbook(Books b);

    public boolean DeleteBook(int id);

    public List<Books> getNewBooks();

    public List<Books> getRecentBooks();

    public List<Books> getOldBooks();

    public List<Books> getUserOldBooks(String useremail, String cate);

    public boolean OldBookDelete(int bid);

    public List<Books> Searchbooks(String search);


}
