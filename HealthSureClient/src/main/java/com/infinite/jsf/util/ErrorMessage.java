/**
* ErrorMessage.java
*
* Singleton class to hold all application-wide message constants. Ensures only
* one instance is created and accessed in a thread-safe manner.
*
* Copyright © 2025 Infinite Computer Solution. All rights reserved.
*/
package com.infinite.jsf.util;

public class ErrorMessage {

    // Validation Messages
    public static final String PROVIDER_NAME_EMPTY = "Provider Name Can Not Be Empty.";
    public static final String INVALID_EMAIL = "Invalid Email Id.";
    public static final String INVALID_TELEPHONE = "Invalid Telephone number. It should contain exactly 10 digits.";
    public static final String INVALID_ZIPCODE = "Invalid ZIPCODE.";
    public static final String SUCCESSFUL_VALIDATION = "Validation Successful.";
    public static final String PROVIDER_APPROVED = "Provider Approved.";
    public static final String PROVIDER_REJECTED = "Provider Rejected.";

    // Provider Status Messages
    public static final String PROVIDER_NOT_FOUND = "Provider Not Found.";
    public static final String INVALID_SEARCH_CRITERIA = "Invalid Search Criteria.";

    // Search Validation Messages
    public static final String INVALID_DOCTOR_ID = " Invalid Doctor ID. Must Begin With 'D' followed by 3 digits.";
    public static final String INVALID_DOCTOR_NAME = "Invalid Doctor Name. Must Contain Minimum 5 Letters.";
    public static final String INVALID_DOCTOR_NAME_LENGTH = "Invalid Doctor Name.";
    public static final String INVALID_SPECIALIZATION = "No Specialization Not Found.";
    public static final String INVALID_LICENSE_NO = "Invalid License Number. Must Begin With 'L' followed by 3 digits.";
    public static final String INVALID_PROVIDER_ID = "Invalid Provider ID. Must Begin With 'P' followed by 3 digits.";
    public static final String PROVIDER_NAME_LENGTH = "Provider Name should be Minimum 5 Letters.";
    public static final String PROVIDER_NAME_NUMBER = "Invalid Provider Name";
    
    // Update Validation Messages
    public static final String ERROR_UPDATE_DOCTOR = "Invalid Doctor Name";
    public static final String DOCTOR_NOT_FOUND_BY_ID = "Invalid Doctor ID. No Doctor Found With This ID";
    public static final String ERROR_UPDATE_PROVIDER = "Invalid Provider Name";
    public static final String INVALID_PROVIDER_NAME = "Invalid Provider Name. Must Contain Minimum 5 Letters.";
    public static final String EMPTY_PROVIDERID = "Please Enter A Provider ID";
    public static final String EMPTY_DOCTORID = "Please Enter A Doctor ID";


   
}
