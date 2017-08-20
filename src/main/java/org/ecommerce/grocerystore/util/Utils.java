package org.ecommerce.grocerystore.util;

import javax.servlet.http.HttpServletRequest;

import org.ecommerce.grocerystore.model.CartInfo;

public class Utils {

    // Products in Cart, stored in Session.
    public static CartInfo getCartInSession(HttpServletRequest request) {

        // Get Cart from Session.
        CartInfo cartInfo = (CartInfo) request.getSession().getAttribute("myCart");
       
        // If null, create it.
        if (cartInfo == null) {
            cartInfo = new CartInfo();
           
            // And store to Session.
            request.getSession().setAttribute("myCart", cartInfo);
        }

        return cartInfo;
    }

    public static void removeCartInSession(HttpServletRequest request) {
        request.getSession().removeAttribute("myCart");
    }

    public static void storeLastOrderedCartInSession(HttpServletRequest request, CartInfo cartInfo) {
        request.getSession().setAttribute("lastOrderedCart", cartInfo);
    }
   
    public static CartInfo getLastOrderedCartInSession(HttpServletRequest request) {
        return (CartInfo) request.getSession().getAttribute("lastOrderedCart");
    }

}
