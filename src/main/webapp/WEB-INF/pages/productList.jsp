<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
  
   <fmt:setLocale value="en_IN" scope="session"/>
 
   <div class="page-title">Product List</div>
 
 
 
   <c:forEach items="${paginationProducts.list}" var="prodInfo">
       <div class="product-preview-container">
           <ul>
               <li><img class="product-image" src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" /></li>
               <li> <b>Product Name: ${prodInfo.name}</b></li>
               
               <li> Product ID: ${prodInfo.code}</li>
               
               <%SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyy");
				Calendar calendar = Calendar.getInstance();
				//subtract 10 days
				calendar.add(Calendar.DATE, -((int)(Math.random() * 10)));
				%>
				
               <li> Date of Manufacture: <%= sdf.format(calendar.getTime()) %></li>
               
               <%calendar.add(Calendar.DATE, (int)(Math.random() * 30)); %>
			   <li> Best Before date: <%= sdf.format(calendar.getTime()) %> </li> 
			   <li> Basic details of the product: ${prodInfo.name} is the fresh quality product brought to you by Grocery Store.</li><br>

			   <c:set var="rand"><%= java.lang.Math.round(java.lang.Math.random() * 5) %></c:set>
			   <li> Discount on the product: <fmt:formatNumber value="${rand}" /> %</li>
			  
			   <c:set var="first" scope="session" value="${prodInfo.price}" />
			   <c:set var="last" scope="session" value="${rand}" />			   
			   <c:set var="sum" scope="session" value="${ ((last/100)*first) }" />
			   
               <li> <strike>Price: <fmt:formatNumber value="${(first+sum)}" type="currency"/></strike></li>
               <li> <h2>Price: <fmt:formatNumber value="${prodInfo.price}" type="currency"/></h2></li>
               
               <c:set var="instock"><%= java.lang.Math.round(java.lang.Math.random() * 1) %></c:set>
               <c:if test="${instock > 0}">
			       <li><a href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">Buy Now</a></li>
			   </c:if>
			   <c:if test="${instock < 1}">
			       <li><a href="#">Out of stock</a></li>
			   </c:if>
               
               <!-- For Manager edit Product -->
               <security:authorize  access="hasRole('ROLE_MANAGER')">
                 <li><a style="color:red;"
                     href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
                       Edit Product</a></li>
               </security:authorize>
           </ul>
       </div>
 
   </c:forEach>
   <br/>
  
 
   <c:if test="${paginationProducts.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationProducts.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="productList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
          </c:forEach>
          
       </div>
   </c:if>
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>
