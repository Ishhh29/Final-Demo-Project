
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ page import="com.infinite.jsf.provider.model.LoginStatus"%>
<f:view>
	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>Provider Review Table</title>
<style>
/* Pastel Green Aesthetic Styling */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #E8F5E9;
	color: #333;
	margin: 0;
	padding: 0;
}

.table-container {
	display: flex;
	justify-content: center; /* Center horizontally */
	align-items: center; /* Center vertically */
	height: 100vh; /* Full height of the viewport */
	margin: 0; /* Remove any default margin */
	padding: 40px;
	background-color: #ffffff;
	border-radius: 16px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
	border: 2px solid #B2DFDB;
}

h\\:dataTable {
	width: 100%;
	border-collapse: collapse; /* Remove space between cells */
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
	text-align:center;
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

.message-box {
	background-color: #A5D6A7;
	color: #004D40;
	padding: 16px;
	border: 1px solid #81C784;
	border-radius: 8px;
	margin: 20px auto;
	font-size: 15px;
	width: 90%;
	max-width: 1200px;
	text-align: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

h2 {
	text-align: center;
	color: #00796B;
}

#loader {
	display: none;
	margin-bottom: 20px;
	text-align: center;
}

#loader p {
	color: #00796B;
	font-size: 18px;
	font-weight: bold;
	margin: 0;
}

th a, th a:visited {
	color: #ffffff !important;
	text-decoration: none;
}

/* Additional style for the messages */
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

.search-btn {
	background-color: #00796B;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1.1em;
}

.search-btn:hover {
	background-color: #004D40;
}

.error {
	color: red;
	font-size: 0.9em;
}

.footer {
	font-size: 14px;
	color: #666;
	margin-top: 20px;
	text-align: center;
}
/* Styling for Disabled Buttons */
.disabled-button {
	background-color: #B2DFDB !important; /* Lighter background */
	color: black;
	cursor: not-allowed !important;
	/* Change cursor to indicate it's not clickable */
	border: 1px solid #A5D6A7 !important; /* Light border */
	opacity: 0.6 !important; /* Reduce opacity */
}

.disabled-button:hover {
	background-color: #B2DFDB !important;
	/* Ensure background stays the same */
	color: black;
	transform: none !important;
	/* Disable any hover effects (like scaling) */
}
/* Styling for Validated Buttons */
.validated-button {
	background-color: #B2DFDB !important;
	/* Lighter background similar to disabled */
	color: black;
	cursor: not-allowed !important;
	/* Change cursor to indicate it's not clickable */
	border: 1px solid #A5D6A7 !important; /* Light border */
	opacity: 0.6 !important; /* Reduce opacity */
}
/* Prevent hover effect on validated buttons */
.validated-button:hover {
	background-color: #B2DFDB !important;
	/* Ensure background stays the same */
	color: black;
	transform: none !important;
	/* Disable any hover effects (like scaling) */
}

.h-panelgroup {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 6px;
}
</style>
</head>
<body>

	<!-- ✅ Loader Message -->
	<div id="loader"
		style="display: none; position: fixed; top: 20px; left: 50%; transform: translateX(-50%); background-color: #00796B; color: white; padding: 12px 24px; border-radius: 8px; font-size: 16px; font-weight: bold; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); z-index: 9999;">
		Validating, please wait...</div>

	<h:messages id="globalMessages" globalOnly="true"
		style="position: fixed; top: 70px; left: 50%; transform: translateX(-50%);
           background-color: #A5D6A7; color: #004D40; padding: 12px 24px;
           border: 1px solid #81C784; border-radius: 8px; font-size: 15px;
           z-index: 9999; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); text-align: center;
           width: auto; max-width: 90%;" />

	<!-- ✅ Provider Table -->
	<div class="table-container">
		<h:form>
			<h2>Provider Review And Approval</h2>
			<h:dataTable value="#{doctorController.paginatedProviders}"
				var="provider" border="1">

				<!-- Provider ID -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Provider ID" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('providerId')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('providerId')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.providerId}" />
				</h:column>

				<!-- Provider Name -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Provider Name" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('providerName')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('providerName')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.providerName}" />
				</h:column>

				<!-- Email -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Email" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('email')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('email')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.email}" />
				</h:column>

				<!-- Hospital Name -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Hospital Name" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('hospitalName')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('hospitalName')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.hospitalName}" />
				</h:column>

				<!-- Telephone -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Telephone" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('telephone')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('telephone')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.telephone}" />
				</h:column>

				<!-- Address -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Address" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('address')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('address')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.address}" />
				</h:column>

				<!-- City -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="City" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('city')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('city')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.city}" />
				</h:column>

				<!-- Zipcode -->
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Zipcode" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('zipcode')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('zipcode')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.zipcode}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Validation" />
					</f:facet>
					<h:commandButton
						value="#{provider.status eq 'APPROVED' ? 'Validated' : 'Validate'}"
						action="#{doctorController.validateProvider(provider)}"
						disabled="#{provider.status eq 'APPROVED' or provider.status eq 'REJECTED' or doctorController.validatedProviders[provider.providerId]}"
						onclick="showLoader()"
						styleClass="action-button #{provider.status eq 'APPROVED' ? 'validated-button' : ''}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:panelGroup layout="block" styleClass="h-panelgroup">
							<h:outputText value="Status" />
							<h:panelGroup layout="block" styleClass="sort-icons-container">
								<h:commandLink value="▲"
									action="#{doctorController.sortByAsc('status')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">
								</h:commandLink>
								<h:commandLink value="▼"
									action="#{doctorController.sortByDesc('status')}"
									style="color: white; font-size: 10px; line-height: 10px; text-decoration: none; border: none; background: none;">

								</h:commandLink>
							</h:panelGroup>
						</h:panelGroup>
					</f:facet>
					<h:outputText value="#{provider.status}" />
				</h:column>
			</h:dataTable>

			<!-- Pagination Controls -->
			<div style="text-align: center; margin-top: 30px;">
				<h:outputText
					value="Page #{doctorController.page + 1} of #{doctorController.totalPages}"
					style="margin-right: 20px; font-weight: bold;" />

				<!-- Previous Button -->
				<h:commandButton value="Previous"
					action="#{doctorController.previousPage}"
					disabled="#{doctorController.page eq 0}"
					style="margin-right: 10px;"
					styleClass="action-button #{doctorController.page eq 0 ? 'disabled-button' : ''}" />

				<!-- Next Button -->
				<h:commandButton value="Next" action="#{doctorController.nextPage}"
					disabled="#{doctorController.page + 1 ge doctorController.totalPages}"
					style="margin-left: 10px;"
					styleClass="action-button #{doctorController.page + 1 ge doctorController.totalPages ? 'disabled-button' : ''}" />
			</div>
			<!-- Back to Homepage Button -->
			<h:commandButton value="Back to Homepage"
				action="#{doctorController.backtoadmindashboard}"
				styleClass="action-button" style="margin-top: 20px;" />


			<div class="footer">
				<p>&copy; 2025 Infinite Computer Solution. All rights reserved.</p>
			</div>

		</h:form>

	</div>

</body>
	</html>
</f:view>
