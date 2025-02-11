*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

Resource    variables.robot
Resource    page_objects.robot
Resource    keywords.robot


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${FRONTEND_URL}    chrome
    Maximize Browser Window

Enter Credentials
    [Arguments]        ${email}    ${password}
    Input Text         ${INPUT_EMAIL}      ${email}
    Input Password     ${INPUT_PASSWORD}   ${password}

Submit Login Form
    Click Element  ${BUTTON_LOGIN}

Verify Admin Login Success
    Run Keyword And Ignore Error    Wait Until Page Contains Element     ${ALERT_ERROR} 
    ${CHECK_ALERT_ERROR}=    Run Keyword And Return Status    Page Should Contain Element    ${ALERT_ERROR}
    IF    ${CHECK_ALERT_ERROR}==True
        Create Admin User
    ELSE
        Location Should Be    ${FRONTEND_URL}/admin/home
    END

Verify User Login Success
    Run Keyword And Ignore Error    Wait Until Page Contains Element     ${ALERT_ERROR} 
    ${CHECK_ALERT_ERROR}=    Run Keyword And Return Status    Page Should Contain Element    ${ALERT_ERROR}
    IF    ${CHECK_ALERT_ERROR}==True
        Create User
    ELSE
        Location Should Be    ${FRONTEND_URL}/home
    END


Login Plataform
    [Arguments]    ${email}    ${password}
    Enter Credentials    ${email}    ${password}
    Submit Login Form

Logout Plataform
    Click Element    ${BUTTON_LOGOUT}
    Location Should Be    ${FRONTEND_URL}/login
