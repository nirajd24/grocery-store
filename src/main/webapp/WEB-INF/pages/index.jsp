<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Grocery Store</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
 
   <div class="page-title"><h3>Online Grocery Ordering</h3></div>
  
   <div class="demo-container">
   		<br>
		An e-commerce store selling Grocery products.<br><br>
	    It takes orders of only those products which are available in the store.<br><br>
	    The store, in the beginning, is following the model of Cash on Delivery. <br><br>
	    It takes online orders of registered customers.<br><br>
	    
	    
	    An order includes <br>
	    <li>Order number,</li>
	    <li>Customer Name of the customer who placed the order,</li>
	    <li>Address where order is to be delivered,</li> 
	    <li>Date of order,</li>
	    <li>List of products and</li>
	    <li>Their quantities and the </li>
	    <li>Amount to be paid by the customer.</li>  <br>
	  	
	    The basic product information that is displayed online includes 
	    <li> Product ID,</li>
	    <li> Product Name,</li>
	    <li> Date of Manufacture,</li>
	    <li> Best Before date,</li> 
	    <li> Price,</li>
	    <li> Basic details of the product and </li>
	    <li> Discount on that product, if any.</li><br> 
	    
   </div>
  
   <jsp:include page="_footer.jsp" />
 
</body>
</html>
