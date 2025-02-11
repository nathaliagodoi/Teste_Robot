*** Settings ***
Resource    ../resources/baseFront.robot

*** Keywords ***
Create User As Admin
    Click Element                          ${CREATE_USER_ADMIN_PAGE}
    Generate Fake User Data
    Enter Name                             ${FAKER_NAME}
    Set Suite Variable                     ${FAKER_NAME}
    Enter Email                            ${FAKER_EMAIL}
    Set Suite Variable                     ${FAKER_EMAIL}
    Enter Password                         ${FAKER_PASSWORD}
    Set Suite Variable                     ${FAKER_PASSWORD}
    Submit Admin User Registration         
    Verify User Created Successfully

Add Product To List
    Click Element  ${ADD_PRODUCT_PAGE}
    Generate Fake Product Data
    Input Text                  ${INPUT_PRODUCT_NAME}          ${FAKE_PRODUCT_NAME}
    Set Suite Variable         ${FAKE_PRODUCT_NAME}
    Input Text                  ${INPUT_PRODUCT_PRICE}         ${FAKE_PRODUCT_PRICE}
    Set Suite Variable         ${FAKE_PRODUCT_PRICE}
    Input Text                  ${INPUT_PRODUCT_DESCRIPTION}   ${FAKE_PRODUCT_DESCRIPTION}
    Set Suite Variable         ${FAKE_PRODUCT_DESCRIPTION}
    Input Text                  ${INPUT_PRODUCT_QUANTITY}      ${FAKE_PRODUCT_QUANTITY}
    Set Suite Variable         ${FAKE_PRODUCT_QUANTITY}
    
Submit Product Registration
    Click Element  ${BUTTON_PRODUCT_SUBMIT}

Verify Product Added Successfully
    Wait Until Page Contains Element    xpath=//button[text()='Editar']
    Location Should Be                  ${FRONTEND_URL}/admin/listarprodutos

Search Product ${PRODUCT_NAME_SERCH}
    Input Text  ${INPUT_PRODUCT_SEARCH}  ${PRODUCT_NAME_SERCH}
    Click Element  ${BUTTON_SEARCH}
    Wait Until Element Is Visible   ${BUTTON_ADD_TO_CART}

Verify User Created Successfully
    Wait Until Page Contains Element    xpath=//button[text()='Editar']
    Location Should Be                  ${FRONTEND_URL}/admin/listarusuarios
    Element Should Be Visible           xpath=//td[contains(text(), '${FAKER_EMAIL}')]


Add Product To Cart
    Click Element  ${BUTTON_ADD_TO_CART}

Verify Product In Cart
    [Arguments]    ${product_name}
    Element Should Contain  ${PRODUCT_DETAIL_NAME}          ${product_name}

Create Admin User
    Go To Registration Page
    Enter Name        ${ADMIN_NAME}
    Enter Email       ${ADMIN_EMAIL}
    Enter Password   ${ADMIN_PASSWORD}
    Check Admin Checkbox
    Submit Registration

Create User
    Go To Registration Page
    Enter Name        ${USER_NAME}
    Enter Email       ${USER_EMAIL}
    Enter Password   ${USER_PASSWORD}
    Submit Registration


Check Admin Checkbox
    Click Element  ${CHECKBOX_ADMIN}

Go To Registration Page
    Click Element  ${LINK_REGISTER}

Enter Name
    [Arguments]    ${name}
    Input Text     ${INPUT_REGISTER_NAME}  ${name}

Enter Email
    [Arguments]    ${email}
    Input Text     ${INPUT_REGISTER_EMAIL}  ${email}

Enter Password
    [Arguments]    ${password}
    Input Password     ${INPUT_REGISTER_PASSWORD}              ${password}

Submit Admin User Registration
    Click Element  ${BUTTON_SUBMIT_REGISTER_USER}

Submit Registration
    Click Element  ${BUTTON_SUBMIT_REGISTER}

Verify Registration Errors
    Element Should Be Visible  ${ALERT_ERROR}