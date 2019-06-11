<%{%>
 <!-- header -->
	<div class="header">
		<div class="container">
			<div class="header-grid">
				<div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<ul>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:fat2fit@gmail.com">fat2fit@gmail.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 892</li>
						<% if(session.getAttribute("adminname")!=null)
                                                {
                                                  out.print("<li><i class='glyphicon glyphicon-log-in' aria-hidden='true'></i>Welcome Admin </a></li>");
                                                out.print("<li><i class='glyphicon glyphicon-book' aria-hidden='true'></i><a href='logout.jsp'>Logout</a></li>");
                                                
                                                
                                                }
                                                
                                                 else                                              
                                                { 
                                                    response.sendRedirect("login.jsp");
                                                }	%>
					</ul>
				</div>
				
				<div class="clearfix"> </div>
			</div>
			<div class="logo-nav">
				<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
					<h1><a href="index.jsp">FAT2FIT <span>MyFitnessHub</span></a></h1>
				</div>
				<div class="logo-nav-left1">
					<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div> 
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<!-- Mega Menu -->
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Users <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-1">
									<div class="row1">
										<div class="col-sm-3">
											<ul class="multi-column-dropdown">
												
												<li><a href="activeusers.jsp">Active</a></li>
												<li><a href="seerequest.jsp">Requests</a></li>
											</ul>
										
										
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>	
							<!-- Mega Menu -->
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">ADD  <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-1">
									<div class="row1">
										<div class="col-sm-3">
											<ul class="multi-column-dropdown">
												<h6>Add </h6>
												<li><a href="admin.jsp">Add Category</a></li>
												<li><a href="admin2.jsp">Add Subcategory</a></li>
												<li><a href="admin3.jsp">Add products</a></li>
												<li><a href="type.jsp">Add Service</a></li>
                                                                                                <li><a href="plandetails.jsp">Add Plans</a></li>
											</ul>
										
										
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
                                                        <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">List <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-1">
									<div class="row1">
										<div class="col-sm-3">
											<ul class="multi-column-dropdown">
												<h6> List </h6>
												<li><a href="listofcategory.jsp">List of Category</a></li>
												<li><a href="listofsubcategory.jsp">List of Subcategory</a></li>
												<li><a href="listofproducts.jsp">List of Products</a></li>
                                                                                               <li><a href="listoftypes.jsp">List of Services</a></li>
                                                                                                <li><a href="listofplans.jsp">List of Plans</a></li>
                                                                                                
											</ul>
										
										
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
<!--							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">ADD SERVICE <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-1">
									<div class="row1">
										<div class="col-sm-3">
											<ul class="multi-column-dropdown">
												<h6>Add </h6>
												<li><a href="admin.jsp">Add Category</a></li>
												<li><a href="admin2.jsp">Add Service</a></li>
												
												
											</ul>
										
										
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
							-->
							
							<li><a href="orderdetails.jsp">Orders</a></li>

                                                        <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-1">
									<div class="row1">
										<div class="col-sm-3">
											<ul class="multi-column-dropdown">
												
												<li><a href="addblog.jsp">Add Blog</a></li>
												<li><a href="listofblogsadmin.jsp">UPDATE/DELETE</a></li>
												
												
											</ul>
										
										
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
                                                        
						</ul>
					</div>
					</nav>
				</div>
				<div class="logo-nav-right">
					
						<!-- search-scripts -->
						
						<!-- //search-scripts -->
				</div>
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //header -->
<%}%>