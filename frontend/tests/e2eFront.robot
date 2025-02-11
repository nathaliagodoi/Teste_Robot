*** Settings ***
Resource    ../resources/baseFront.robot

Test Setup    Open Browser To Login Page

Test Teardown    Run Keywords
...              Logout Plataform    AND    
...              Close Browser

*** Test Cases ***
Create a New User as Admin
    [Tags]    create_user
    Enter Credentials    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    Submit Login Form
    Verify Admin Login Success
    Create User As Admin
    Verify User Created Successfully

Add Product to list as Admin
    [Tags]    create_product
    Enter Credentials    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    Submit Login Form
    Verify Admin Login Success
    Add Product To List
    Submit Product Registration
    Verify Product Added Successfully

Login as User and add product to cart
    [Tags]    add_product
    Login Plataform     ${FAKER_EMAIL}    ${FAKER_PASSWORD}
    Verify User Login Success
    Search Product ${FAKE_PRODUCT_NAME}
    Add Product To Cart
    Verify Product In Cart    ${FAKE_PRODUCT_NAME}


