<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Login</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
 
 
 
   <div class="page-title">Login (For Customer, Manager)</div>
 
   <div class="login-container">
 
       <h3>Enter username and password</h3>
       <br>
       <!-- /login?error=true -->
       <c:if test="${param.error == 'true'}">
           <div style="color: red; margin: 10px 0px;">
 
               Login Failed!!!<br /> Reason :
               ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
 
           </div>
       </c:if>
 
       <form method="POST"
           action="${pageContext.request.contextPath}/j_spring_security_check">
           <table>
               <tr>
                   <td>User Name *</td>
                   <td><input name="userName" /></td>
               </tr>
 
               <tr>
                   <td>Password *</td>
                   <td><input type="password" name="password" /></td>
               </tr>
 
               <tr>
                   <td>&nbsp;</td>
                   <td>
                   
                   <input type="submit" value="Login" /> 
					<input type="reset"  value="Reset" /></td>
               </tr>
           </table>
       </form>
 
       <span class="error-message">${error }</span>
 
   </div>
 
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>
