package DAO;

import entity.Books;
import entity.Order;

import java.util.List;

public interface OrderDAO {


    public boolean saveorder(List<Order> olist);

    public List<Order> getAllOrder();

    public List<Order> getUserOrder(String email);

    public boolean DeleteOrder(int id);

}
