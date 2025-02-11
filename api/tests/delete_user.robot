*** Settings ***
Resource    ../resources/baseAPI.robot


Test Setup    Run Keywords
...           Generate Fake User Data    AND
...           Create User API            AND
...           Get User informations

*** Test Cases ***
Delete User
    [Tags]                        delete_user
    Delete User API               
    Verify Response Status        200
    Verify User Deleted Msg
