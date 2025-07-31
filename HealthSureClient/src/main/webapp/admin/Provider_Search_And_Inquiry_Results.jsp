<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Results</title>
<style>
/* Pastel Green Aesthetic Styling */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #E8F5E9;
	color: #333;
	margin: 0;
	padding: 0;
}

h2 {
	text-align: center;
	color: #00796B;
}

.table-container {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	height: 100vh;
	margin: 0;
	padding: 40px;
	padding-top: 60px;
	background-color: #ffffff;
	border-radius: 16px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
	border: 2px solid #B2DFDB;
}

h\\:dataTable {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	border-spacing: 0;
}

h\\:column, th, td {
	padding: 0; /* Reduced padding to minimize space */
	border: 1px solid #B2DFDB;
	text-align: center;
	font-size: 15px;
}

th {
	background-color: #00796B;
	color: white;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

td {
	background-color: #F1F8F6;
	color: #333;
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
	margin-top: 300px;
	text-align: center;
}
</style>
</head>
<body>
	<f:view>
		<h:form>
		
			<div class="table-container">
				<div class="container">
					<h2>Search Results</h2>
				
					<!-- Table for Doctor Results -->
					<h:dataTable value="#{doctorController.searchResults}" var="doctor"
						rendered="#{not empty doctorController.searchResults}">
						<h:column rendered="#{doctorController.searchType eq 'doctor'}">
							<f:facet name="header">
								<h:outputText value="Doctor ID" />
							</f:facet>
							<h:outputText value="#{doctor.doctorId}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Provider ID" />
							</f:facet>
							<h:outputText value="#{doctor.providers.providerId}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Doctor Name" />
							</f:facet>
							<h:outputText value="#{doctor.doctorName}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Specialization" />
							</f:facet>
							<h:outputText value="#{doctor.specialization}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Qualification" />
							</f:facet>
							<h:outputText value="#{doctor.qualification}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="License Number" />
							</f:facet>
							<h:outputText value="#{doctor.licenseNo}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Email" />
							</f:facet>
							<h:outputText value="#{doctor.email}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Phone Number" />
							</f:facet>
							<h:outputText value="#{doctor.phoneNumber}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Address" />
							</f:facet>
							<h:outputText value="#{doctor.address}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Doctor Type" />
							</f:facet>
							<h:outputText value="#{doctor.type}" />
						</h:column>
					</h:dataTable>


					<!-- Table for Provider Results -->


					<h:dataTable value="#{doctorController.searchResultsP}"
						var="provider"
						rendered="#{not empty doctorController.searchResultsP}">
						<h:column rendered="#{doctorController.searchType eq 'provider'}">
							<f:facet name="header">
								<h:outputText value="Provider ID" />
							</f:facet>
							<h:outputText value="#{provider.providerId}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Provider Name" />
							</f:facet>
							<h:outputText value="#{provider.providerName}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Hospital Name" />
							</f:facet>
							<h:outputText value="#{provider.hospitalName}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="City" />
							</f:facet>
							<h:outputText value="#{provider.city}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Address" />
							</f:facet>
							<h:outputText value="#{provider.address}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Email" />
							</f:facet>
							<h:outputText value="#{provider.email}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Status" />
							</f:facet>
							<h:outputText value="#{provider.status}" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Telephone" />
							</f:facet>
							<h:outputText value="#{provider.telephone}" />
						</h:column>
					</h:dataTable>

					<!-- If no results, show message -->

					<h:panelGrid rendered="#{empty doctorController.searchResults and empty doctorController.searchResultsP}">
					
						<h:outputText value="No results found." />
					</h:panelGrid>
					
					
					<!-- Back to Homepage Button -->
					<h:commandButton value="Back to Admin Dashboard"
						action="#{doctorController.backtoadmindashboard}"
						styleClass="action-button" style="margin-top: 20px;" />
					<div class="footer">
						<p>&copy; 2025 Infinite Computer Solution. All rights
							reserved.</p>
					</div>
				</div>
			</div>

		</h:form>
	</f:view>
</body>
</html>
