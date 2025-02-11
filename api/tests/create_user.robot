*** Settings ***
Resource    ../resources/baseAPI.robot


*** Test Cases ***
Create New User
    [Tags]                    create_user
    ${name}=                  FakerLibrary.Name
    ${email}=                 FakerLibrary.Email 
    Create User API           
    Verify Response Status    201
    Verify User Creat Msg