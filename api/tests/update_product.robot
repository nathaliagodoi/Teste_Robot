*** Settings ***
Resource    ../resources/baseAPI.robot

Test Setup    Run Keywords
...           Login API User                   AND
...           Create Test Product              AND
...           Get Product Data API

Test Teardown    Run Keywords
...              Delete Test Product

*** Test Cases ***
Update Product Details
    [Tags]                 update_product
    ${new_name}=           Set Variable    Name Updated
    ${new_price}=          Set Variable    1000
    ${new_description}=    Set Variable    Description Updated
    ${new_amount}=         Set Variable    1000

    Update Product API        ${product_id}    ${new_name}    ${new_price}    ${new_description}    ${new_amount}
    Verify Response Status    200
    Verify Product Updated    ${product_id}    ${new_name}    ${new_price}    ${new_description}    ${new_amount}