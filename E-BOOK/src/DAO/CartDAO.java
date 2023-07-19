package DAO;

import entity.Books;
import entity.Cart;

import java.util.List;

public interface CartDAO {

    public boolean addCart(Cart c);

    public List<Cart> getBooksbyUser(int uid);

    public boolean RemoveBook(int bid, int uid, int cid);

}
