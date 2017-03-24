package com.nr.fc.controller.navigation;

/**
 *
 * @author Amith
 */
public class NavigationPath {

    /**
     * Admin Role Folder
     */
    public static final String ADMIN_PREFIX = "/admin";

    //##################################
    //LOGIN
    //##################################
    public static final String LOGIN = "/login";

    public static final String Forgot = "/forgot";

    public static final String DASHBOARD = "/dashboard";

    public static final String FirstTimeLogin = "/first-login";

    //##################################
    //FILE UPLOAD
    //##################################
    public static final String FILE_UPLOAD = "/file-upload";//not use

    //##################################
    //Group creation
    //##################################
    public static final String CREATE_GROUP = "/create-group";
    public static final String SEARCH_GROUP = "/search-group";

    //##################################
    //Member creation
    //##################################
    public static final String CREATE_MEMBER = "/create-member";
    public static final String CREATE_MEMBER_MODIFY = "/member-details-enrollment-modify";

    //##################################
    //Member Business Details creation
    //##################################
    public static final String CREATE_MEMBER_BUSINESS_DETAILS = "/create-member-business-details";
}
