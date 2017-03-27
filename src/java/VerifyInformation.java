/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jwang
 */

public class VerifyInformation extends HttpServlet {
   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse 
                         response) throws ServletException, IOException {
        
        boolean error = false;
        
        
        String message = "";
        
        String productId = request.getParameter("product-id");
        String quantity = request.getParameter("quantity");
        String unitPrice = request.getParameter("unit-price");
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String shippingAddress = request.getParameter("shipping-address");
        
        String ccType = request.getParameter("cc-type");
        
        String creditCard = request.getParameter("creditcard");
        String repeatedCreditCard = request.getParameter("repeated-creditcard");       
        
        //check for not entered and non matching credit cards
       
        if (request.getParameter("creditcard") == null || 
            request.getParameter("repeated-creditcard") == null || 
            request.getParameter("creditcard").isEmpty() || 
            request.getParameter("repeated-creditcard").isEmpty()) {
            
            //post message to html page later
            message += "Credit cards are not entered.<br>";
            error = true;
        } 
        
        if (!creditCard.equals(repeatedCreditCard)){
            
            message += "Please enter the same credit card number.<br>";
            error = true;
        }
        
        //check if quantity is not valid
       
        if (quantity == null || request.getParameter("quantity").isEmpty()) {
            
            message += "Please enter a quantity.<br>";
            error = true;
        } else {
            char[] array = request.getParameter("quantity").toCharArray();
            
            for (int i = 0; i < array.length; i++) {
                if (!Character.isDigit(array[i])) {
                    message += "Please enter a valid number.<br>";
                    error = true;
                    break;
                }
            }
        }
        
        //check is price is valid
        
        if (request.getParameter("unit-price") == null || request.getParameter("unit-price").isEmpty()) {
            
            message += "Please enter a unit price.<br>";
            error = true;
        } else {
            
            String[] array = request.getParameter("unit-price").split("\\.");
            
            if (array.length == 2) {
                
                if (checkLengthAfterDecimal(array[1])) {
                    if (checkDigits(array[0]) == false || checkDigits(array[1]) == false) {
                        message += "Please enter digit instead of a character.<br>";
                        error = true;
                    } 
                } else {
                    message += "Please only enter 2 digits after the decimal point.<br>";
                    error = true;
                }
            } else if (array.length == 1) {
                if (!checkDigits(array[0])) {
                    
                    message += "Please enter valid digits.<br>";
                    error = true;
                }
            } else {
                message += "Please only input one decimal point.<br>";
                error = true;
            }
            
        }
        
        if (shippingAddress == null || shippingAddress.isEmpty()) {
            
            message += "Please enter a shipping address.<br>";
            error = true;
        }
            
        
        
        //split string char "." result will return 2 
        //chec latter string length, if greater than 2 test failed
        //else 
        
        //method to check length
       
        request.setAttribute("hello", message);
        
        
        request.setAttribute("product-id", productId);
        request.setAttribute("quantity", quantity);
        request.setAttribute("price", unitPrice);
        request.setAttribute("first-name", firstName);
        request.setAttribute("last-name", lastName);
        request.setAttribute("shipping-address", shippingAddress);
        
        request.setAttribute("cc-type", ccType);
        
        request.setAttribute("creditcard", creditCard);
        request.setAttribute("repeated-creditcard", repeatedCreditCard);
        
        
        
        if (error == true) {
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);
        }
      
        
    } 
    
     private boolean checkLengthAfterDecimal(String s) {
         
         boolean x = false;
            
            if (s.length() <= 2) {
                x = true;
            } 
            return x;
        }
     
     private boolean checkDigits(String s) {
         
         char[] array = s.toCharArray();
         
         for (int i = 0; i < s.length(); i++) {
                    if (!Character.isDigit(array[i])) {
                        
                        return false;
                    }   
                }
           return true;
        } 
}
