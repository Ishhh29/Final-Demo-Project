<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ page import="com.infinite.jsf.provider.model.Doctors" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Doctor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #E0F7FA;
            color: #333;
             display: flex;
            flex-direction: column;
           
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .footer {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            bottom: 20px;
            width: 100%;
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
            width: 30%;
            padding: 8px;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #B2DFDB;
            background-color: #f1f8f6;
            margin-bottom: 15px;
        }
        .search-btn {
            background-color: #00796B;
            color: white;
            padding: 	10px 20px;
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
    </style>
</head>
<body>
    <f:view>
        <div class="container">
            <h2>Enter Doctor ID</h2>

            <!-- Step 1: Input Doctor ID -->
            <h:form>
                <h:outputLabel for="doctorId" value="Doctor ID:" />
                <h:inputText id="doctorId" value="#{doctorController.doctor.doctorId}" required="true">
                    <f:attribute name="placeholder" value="Enter Doctor ID" />
                </h:inputText>
				
                <!-- Search Button -->
                <h:commandButton value="Get Doctor Details" action="#{doctorController.showDoctorDetails}" styleClass="search-btn">
                    <!-- Pass doctorId as a parameter to the next page -->
                    <f:param name="doctorId" value="#{doctorController.doctor.doctorId}" />
                </h:commandButton>
               
            </h:form>
			      <!-- Error Message (If any) -->
            <h:outputText value="#{doctorController.errorMessage}" rendered="#{not empty doctorController.errorMessage}" styleClass="error" />

            <!-- JSF validation message handling -->
            <h:messages styleClass="error" globalOnly="true" />

            </div>
        <div class="footer">
            <p>&copy;  2025 Infinite Computer Solution. All rights reserved.</p>
        </div>
        
      
    </f:view>
</body>

</html>
