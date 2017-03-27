<%-- 
    Document   : result
    Created on : Feb 20, 2017, 1:18:18 AM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
        <%
            
            String firstName = request.getParameter("first-name");
            String lastName = request.getParameter("last-name");
            String name = firstName + " " + lastName;
            
            String shippingAddress = request.getParameter("shipping-address");

            String productId = request.getParameter("product-id");
            String quantity = request.getParameter("quantity");
            
            String unitPrice = request.getParameter("unit-price");
            
            double totalPrice = 0;
            
            if (unitPrice != null && quantity != null) {
                
                totalPrice = Double.parseDouble(unitPrice) * Double.parseDouble(quantity);
                DecimalFormat df = new DecimalFormat("##.##");
                df.format(totalPrice);
            }
                  
        %>
        <p><%= name %>, your order will be shipped to <%= shippingAddress %>.<br>
            Product ID: <%= productId %><br>
            Quantity: <%= quantity %><br>
            Unit Price: <%= unitPrice %><br>
            Order Total: <%= totalPrice %></p>
    </body>
</html>
