<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


     
 <% String userId1 = (String)session.getAttribute("userId"); %>
 <% String userName1 = (String)session.getAttribute("userName"); %>
        

      
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

						<h5 class="card-title"> <%= userId1 %></h5>

						<h6 class="card-subtitle mb-2 text-muted">(<%= userName1 %>)</h6>
						<p class="card-text">
							......<br> <br> <br> <br> <br> <br>
							<br> <br> <br>
						</p>
							<table class="table table-borderless table-sm">
               <thead>
               </thead>
               <tbody>
               
                <tr>                
                    <td class="text-right" style="width:100px"><a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a></td>
                    <td class="text-left mx-auto" style="width:40px" id="11b" ><input type="checkbox" name="checkbox" style="width:20px;height:20px;"></td>                     
                </tr> 
                   
               </tbody>
            </table>
					
					
					
				
					
					
					
					
					
					
					
					</div>
				</div>
</body>
</html>