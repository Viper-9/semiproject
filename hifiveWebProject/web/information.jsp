<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User" %>
<% 
   User infoUser = (User)session.getAttribute("loginuser");
%>       

      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>information</title>

<script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">
 
</script> 
 
</head>
<body>
<div class="card" style="width: 250px;">
					<div class="card-body"> 

						<h4 class="card-title"><b><%= infoUser.getUser_Name() %></b> </h4>
						<br>
						<h6 class="card-subtitle mb-2 text-muted">(
						<%if(infoUser.getAddress() != null) { %>
						<%= infoUser.getAddress() %>
						<% } else { %>
						주소를 입력해주세요
						<% } %>
						)</h6>
						
						<p class="card-text">
							<br> <br> <br> <br> <br> <br>
							<br> <br> <br>
						</p>
							<table class="table table-borderless table-sm">
               <thead>
               </thead>
               <tbody>
               
                <tr>                
                    <td class="text-right" style="width:100px"><a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a></td>
                    <% if(infoUser.getSafety_check().toUpperCase().equals("N")) { %>
                    <td class="text-left mx-auto" style="width:40px" id="11b" >
                    <img src="/hifive/resources/image/uncheck.png" width="18px" height="18px"></td>
                    
                    <% } else { %>
                    <td class="text-left mx-auto" style="width:40px" id="11b" >
                    <img src="/hifive/resources/image/check.png" width="18px" height="18px"></td> 
                    <% } %>                    
                </tr> 
                   
               </tbody>
            </table>
					
					
					
				
					
					
					
					
					
					
					
					</div>
				</div>
</body>
</html>