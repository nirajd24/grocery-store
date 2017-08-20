package org.ecommerce.grocerystore.dao;

import java.util.List;

import org.ecommerce.grocerystore.model.CartInfo;
import org.ecommerce.grocerystore.model.OrderDetailInfo;
import org.ecommerce.grocerystore.model.OrderInfo;
import org.ecommerce.grocerystore.model.PaginationResult;

public interface OrderDAO {

    public void saveOrder(CartInfo cartInfo);

    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
   
    public OrderInfo getOrderInfo(String orderId);
   
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);

}
