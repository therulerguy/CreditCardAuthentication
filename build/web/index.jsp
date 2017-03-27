<%-- 
    Document   : index
    Created on : Feb 17, 2017, 11:13:33 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample Order Form</title>
    </head>
    <body>
        <h2>A Sample Order Form</h2>

        <%
            // out.println(session.getAttribute("hello"));
            String pl = "";
            String price = "";
            String quant = "";
            String first = "";
            String last = "";
            String shipping = "";
            String cc = "";
            String repeated = "";
            

            String message11 = (String) request.getAttribute("hello");

            if (!(request.getAttribute("product-id") == null)) {
                pl = (String) request.getAttribute("product-id");
            }

            if (!(request.getAttribute("quantity") == null)) {
                quant = (String) request.getAttribute("quantity");
            }

            if (!(request.getAttribute("price") == null)) {
                price = (String) request.getAttribute("price");
            }

            if (!(request.getAttribute("first-name") == null)) {
                first = (String) request.getAttribute("first-name");
            }

            if (!(request.getAttribute("last-name") == null)) {
                last = (String) request.getAttribute("last-name");
            }

            if (!(request.getAttribute("shipping-address") == null)) {
                shipping = (String) request.getAttribute("shipping-address");
            }

            if (!(request.getAttribute("creditcard") == null)) {
                cc = (String) request.getAttribute("creditcard");
            }

            if (!(request.getAttribute("repeated-creditcard") == null)) {
                repeated = (String) request.getAttribute("repeated-creditcard");
            }

            if (message11 != null) {


        %>

        <h1 style="color:red"><%= message11%></h1>

        <% } %>


        <form action="VerifyInformation" method='POST'>
            Product ID: <br>
            <input type="text" id="product-id" name="product-id" value=<%= pl%>><br>

            Quantity: <br>
            <input type="text" id="quantity" name="quantity" value=<%= quant%>><br>

            Unit Price: <br>
            <input type="text" id="unit-price" name="unit-price" value=<%= price%>><br>

            First Name: <br>
            <input type="text" id="first-name" name="first-name" value=<%= first%>><br>

            Last Name: <br>
            <input type="text" id="last-name" name="last-name" value=<%= last%>><br>

            Shipping Address: <br>
            <textarea rows="3" cols="50" <input type="text" id="shipping-address" name="shipping-address" value=<%= shipping%>></textarea><br>

            <%
                String whichButton = "";
                String visaChecked = "";
                String mastercardChecked = "";
                String amexChecked = "";
                String discoverChecked = "";
                
                if ((request.getAttribute("cc-type") != null)) {
                whichButton = (String) request.getAttribute("cc-type");
                }

                if (whichButton.equals("visa")) {
                    visaChecked = " checked";
                }

                if (whichButton.equals("mastercard")) {
                    mastercardChecked = " checked";
                }

                if (whichButton.equals("american-express")) {
                    amexChecked = " checked";
                }

                if (whichButton.equals("discover")) {
                    discoverChecked = " checked";
                }

            %>

            Credit Card: <br>
            <input type="radio" name="cc-type" id="visa" value="visa" <%= visaChecked%>> Visa<br>
            <input type="radio" name="cc-type" id="mastercard" value="mastercard" <%= mastercardChecked%>> Master Card<br>
            <input type="radio" name="cc-type" id="american-express" value="american-express" <%= amexChecked%>> American Express<br>
            <input type="radio" name="cc-type" id="discover" value="discover" <%= discoverChecked%>> Discover<br>

            Credit Card Number: <br>
            <input type="text" id="creditcard" name="creditcard" value=<%= cc%>><br>

            Repeated Credit Card Number: <br>
            <input type="text" id="repeated-creditcard" name="repeated-creditcard" value=<%= repeated%>><br>

            <input type="submit" value="Submit Order">



        </form>

    </body>
</html>
