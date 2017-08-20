<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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
 
   <div class="page-title">Order Info</div>
 
   <div class="customer-info-container">
       <h3>Customer Information:</h3>
       <ul>
           <li>Name: ${orderInfo.customerName}</li>
           <li>Email: ${orderInfo.customerEmail}</li>
           <li>Phone: ${orderInfo.customerPhone}</li>
           <li>Address: ${orderInfo.customerAddress}</li>
       </ul>
       <h3>Order Summary:</h3>
       <ul>
           <li>Total:
           <span class="total">
           <fmt:formatNumber value="${orderInfo.amount}" type="currency"/>
           </span></li>
       </ul>
   </div>
    
   <br/>
    
   <table border="1" style="width:100%">
       <tr>
           <th>Product Code</th>
           <th>Product Name</th>
           <th>Quantity</th>
           <th>Price</th>
           <th>Amount</th>
       </tr>
       <c:forEach items="${orderInfo.details}" var="orderDetailInfo">
           <tr>
               <td>${orderDetailInfo.productCode}</td>
               <td>${orderDetailInfo.productName}</td>
               <td>${orderDetailInfo.quanity}</td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.price}" type="currency"/>
               </td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.amount}" type="currency"/>
               </td>  
           </tr>
       </c:forEach>
   </table>
   <c:if test="${paginationResult.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationResult.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="orderList?page=${page}" class="nav-item">${page}</a>
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
