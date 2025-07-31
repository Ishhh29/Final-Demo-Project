<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Provider And Doctor Search</title>

<style>
body {

   
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f1f8f6;
	color: #333;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	padding:0;
	height: 100vh;
}

.container {
	text-align: center;
	width: 450px;
	background-color: #ffffff;
	padding: 40px 30px 40px 43px;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.header {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 40px;
	color: #00796b; /* Elegant darker green */
	letter-spacing: 1px;
}

.form-group {
	width: 100%;
	margin-bottom: 20px;
}

.form-group label {
	font-size: 1.1em;
	display: block;
	margin-bottom: 8px;
}

.menu-button {
	width: 90%;
	padding: 8px;
	font-size: 1em;
	border-radius: 5px;
	border: 1px solid #B2DFDB;
	background-color: #f1f8f6;
	margin-bottom: 15px;
	align-items: center;
	display: flex;
}

.input-box {
	width: 82%;
	padding: 8px;
	font-size: 1em;
	border-radius: 5px;
	border: 1px solid #B2DFDB;
	background-color: #f1f8f6;
	margin-bottom: 15px;
	margin-left: 4px;
	align-items: center;
	display: flex;
}

.search-button {
	display: inline-block;
	width: 50%;
	padding: 8px;
	text-align: center;
	
	background-color: #00796B;
	color: white;
	align-items: center;
	display: flex;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1.1em;
	margin-left: 75px;
	
	
	
}

.search-button:hover {
	background-color: #004D40;
}

.error-message {
	color: red;
	font-size: 0.9em;
}

 .footer {
            font-size: 14px;
            color: #666;
            margin-top: 20px;
        }
</style>
</head>

<body>

	<f:view>
		<div class="container">
			<div class="header">Search Doctors and Providers</div>


			<h:form>
				<!-- Step 1: Category Dropdown (Doctors or Providers) -->
				<div class="form-group">
					<h:selectOneMenu id="category"
						value="#{doctorController.searchType}"
						onchange="this.form.submit();" styleClass="menu-button">
						<f:selectItem itemLabel="---Select Provider Type---" itemValue="" />
						<f:selectItem itemLabel="Doctor" itemValue="doctor" />
						<f:selectItem itemLabel="Provider" itemValue="provider" />
					</h:selectOneMenu>
				

				<!-- Step 2: Criteria Dropdown (appears after selecting category) -->
				<h:selectOneMenu id="criteria"
					value="#{doctorController.searchCriteria}" styleClass="menu-button">
					<f:selectItem itemLabel="---Select Criteria---" itemValue="" />
					<f:selectItems value="#{doctorController.searchCriteriaOptions}" />
				</h:selectOneMenu>
				

				<!-- Step 3: Input Box (appears after selecting criteria) -->
				<h:inputText value="#{doctorController.searchInput}"
					styleClass="input-box">
					<f:attribute name="placeholder" value="Enter Your Credentials" />
					
				</h:inputText>

				<!-- Step 4: Search Button (appears after input field) -->
				<h:commandButton value="Search" action="#{doctorController.search}"
					styleClass="search-button" />
				
				</div>
				<!-- Error Message (If any) -->
				<h:messages globalOnly="true" styleClass="error-message" />
				<div class="footer">
                <p>&copy;   2025 Infinite Computer Solution. All rights reserved.</p>
            </div>
			</h:form>
		</div>
	</f:view>

</body>
</html>
