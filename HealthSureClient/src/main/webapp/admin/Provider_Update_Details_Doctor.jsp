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
<title>Update Doctor Details</title>
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
			<h2>Edit Doctor Details</h2>

			<!-- Doctor details form -->
			<h:form>
				<h:inputHidden value="#{doctorController.doctor.doctorId}" />


				<h:outputLabel for="doctorName" value="Doctor Name:" />
				<h:inputText id="doctorName"
					value="#{doctorController.doctor.doctorName}" required="true" />


				<h:outputLabel for="providerId" value="Provider ID:" />
				<h:inputText id="providerId"
					value="#{doctorController.doctor.providers.providerId}"
					required="true" />


				<h:outputLabel for="qualification" value="Qualification:" />
				<h:inputText id="qualification"
					value="#{doctorController.doctor.qualification}" required="true" />

				<h:outputLabel for="specialization" value="Specialization:" />
				<h:inputText id="specialization"
					value="#{doctorController.doctor.specialization}" required="true" />

				<h:outputLabel for="licenseNo" value="License No:" />
				<h:inputText id="licenseNo"
					value="#{doctorController.doctor.licenseNo}" required="true" />

				<h:outputLabel for="email" value="Email:" />
				<h:inputText id="email" value="#{doctorController.doctor.email}"
					required="true" />

				<h:outputLabel for="phoneNumber" value="Phone Number:" />
				<h:inputText id="phoneNumber"
					value="#{doctorController.doctor.phoneNumber}" required="true" />

				<h:outputLabel for="address" value="Address:" />
				<h:inputText id="address" value="#{doctorController.doctor.address}"
					required="true" />






				<!-- Update Button -->
				<h:commandButton value="Update Details"
					action="#{doctorController.updateDoctorDetails}"
					styleClass="update-btn" />



					
			 <!-- Success message (rendered only if update is successful) -->
            <h:outputText value="Doctor details updated successfully..." rendered="#{doctorController.updateSuccess}" styleClass="success" />

            <!-- Error message (rendered only if error message exists) -->
            <h:outputText value="#{doctorController.errorMessage}" rendered="#{not empty doctorController.errorMessage}" styleClass="error" />
			 


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
