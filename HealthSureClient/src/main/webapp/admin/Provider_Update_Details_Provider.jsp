<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>

<%@ page import="com.infinite.jsf.provider.model.Doctors"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Provider Details</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #E0F7FA;
	color: #333;
}

.container {
	width: 80%;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #00796B;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	font-size: 1.1em;
	display: block;
	margin-bottom: 8px;
}

input[type="text"] {
	width: 100%;
	padding: 8px;
	font-size: 1em;
	border-radius: 5px;
	border: 1px solid #B2DFDB;
	background-color: #f1f8f6;
}

.update-btn {
	background-color: #00796B;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1.1em;
}

.update-btn:hover {
	background-color: #004D40;
}

.success {
	color: green;
	font-size: 1.1em;
	text-align: center;
	margin-top: 20px;
}

.error {
	color: red;
	font-size: 0.9em;
	text-align: center;
}

.back-btn {
	background-color: #00796B;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1.1em;
	display: block;
	margin: 20px auto;
}

.back-btn:hover {
	background-color: #004D40;
}
    .action-button {
        background-color: #00796B;
        color: white;
        padding: 10px 20px;
        font-size: 14px;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .action-button:hover {
        background-color: #004D40;
        transform: scale(1.05);
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
			<h2>Edit Provider Details</h2>

			<!-- Provider details form -->
			<h:form>
				<h:inputHidden value="#{doctorController.provider.providerId}" />


				<h:outputLabel for="providerName" value="Provider Name:" />
				<h:inputText id="providerName"
					value="#{doctorController.provider.providerName}" required="true" />

				<h:outputLabel for="hospitalName" value="Hospital Name :" />
				<h:inputText id="hospitalName"
					value="#{doctorController.provider.hospitalName}" required="true" />

				<h:outputLabel for="telephone" value="Telephone:" />
				<h:inputText id="telephone"
					value="#{doctorController.provider.telephone}" required="true" />

				<h:outputLabel for="email" value="Email:" />
				<h:inputText id="email" value="#{doctorController.provider.email}"
					required="true" />

				<h:outputLabel for="city" value="City:" />
				<h:inputText id="city" value="#{doctorController.provider.city}"
					required="true" />

				<h:outputLabel for="address" value="Address:" />
				<h:inputText id="address"
					value="#{doctorController.provider.address}" required="true" />






				<!-- Update Button -->
				<h:commandButton value="Update Details"
					action="#{doctorController.updateProviderDetails}"
					styleClass="update-btn" />


				<!-- Success or error message -->
				<h:outputText value="Provider details updated successfully..."
					rendered="#{doctorController.updateSuccess}" styleClass="success" />
				<h:outputText value="#{doctorController.errorMessage}"
					rendered="#{not empty doctorController.errorMessage}"
					styleClass="error" />

				<!-- Back to homepage button -->
				<!-- Back to Homepage Button -->
				<h:commandButton value="Back to Homepage"
					action="#{doctorController.backtoadmindashboard}"
					styleClass="action-button" style="margin-top: 20px;" />
				<div class="footer">
					<p>&copy; 2025 Infinite Computer Solution. All rights reserved.</p>
				</div>
			</h:form>

		</div>
	</f:view>
</body>
</html>
