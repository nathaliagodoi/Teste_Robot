*** Settings ***
#Bibliotecas usadas
Library    RequestsLibrary
Library    Collections
Library    FakerLibrary

#Resourcers do projeto
Resource    keywords.robot
Resource    endpoints.robot
Resource    variables.robot


*** Keywords ***

# Shared Keywords
Generate Fake User Data
    ${name}=        FakerLibrary.Name
    Set Test Variable    ${name}
    ${email}=       FakerLibrary.Email
    Set Test Variable    ${email}
    ${password}=    FakerLibrary.Password    special_chars=False    length=12
    Set Test Variable    ${password}

Generate Fake Product Data
    ${name}=        FakerLibrary.Name
    Set Test Variable    ${name}
    ${description}=     FakerLibrary.Text    max_nb_chars=50
    Set Test Variable    ${description}
    #${price}=       FakerLibrary.Pyfloat    min_value=1    max_value=100    left_digits=3    right_digits=2
    ${price}=       FakerLibrary.Pyint    min_value=1    max_value=100
    Set Test Variable    ${price}
    ${amount}=      FakerLibrary.Pyint    min_value=1    max_value=100
    Set Test Variable    ${Amount}

Verify Response Status
    [Arguments]                   ${expected_status}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}


#Sessão de Login
Create User API
    Generate Fake User Data
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ${body}=       Create Dictionary    
    ...            nome=${name}    
    ...            email=${email}    
    ...            password=${password}    
    ...            administrador=true
    ${response}=   POST    ${API_BASE_URL}${USERS_ENDPOINT}    
    ...            json=${body}    
    ...            headers=${headers}
    Log                  ${response.json()}
    ${API_USER_ID}=    Get From Dictionary    ${response.json()}        _id
    Set Test Variable    ${API_USER_ID}
    Set Test Variable    ${response}

Get User API Informations
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ${response}=   GET    ${API_BASE_URL}${USERS_ENDPOINT}/${API_USER_ID}    
    ...                   headers=${headers}
    Log                   ${response.json()}    
    Set Test Variable     ${response}
    ${API_USER_ID}=          Get From Dictionary    ${response.json()}           _id
    Set Test Variable        ${API_USER_ID}
    ${API_USER_NAME}=        Get From Dictionary    ${response.json()}          nome
    Set Test Variable        ${API_USER_NAME}
    ${API_USER_EMAIL}=       Get From Dictionary    ${response.json()}          email
    Set Test Variable        ${API_USER_EMAIL}
    ${API_USER_PASSWORD}=    Get From Dictionary    ${response.json()}         password
    Set Test Variable        ${API_USER_PASSWORD}

Login API User
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}    accept=${ACCEPT_TYPE}
    ${body}=       Create Dictionary    email=${API_USER_EMAIL}    password=${API_USER_PASSWORD}
    ${response}=   POST    ${API_BASE_URL}${LOGIN_ENDPOINT}    
    ...            json=${body}    
    ...            headers=${headers}
    Set Test Variable    ${response}
    ${user_token}=    Get From Dictionary    ${response.json()}    authorization
    Set Test Variable    ${user_token}

Get User informations
    ${USER_ID}=     Get From Dictionary    ${response.json()}        _id
    Set Test Variable    ${USER_ID}
    ${USER_MSG}=    Get From Dictionary    ${response.json()}    message
    Set Test Variable    ${USER_MSG}
    
Verify User Creat Msg
    ${CREATE_USER_MSG}=    Get From Dictionary        ${response.json()}    message
    ${CREATE_USER_MSG_STRING}=    Convert To String   ${CREATE_USER_MSG}
    Should Be Equal    ${CREATE_USER_MSG_STRING}     Cadastro realizado com sucesso

Delete User API
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ${response}=   DELETE    ${API_BASE_URL}${USERS_ENDPOINT}/${API_USER_ID}    
    ...            headers=${headers}
    Set Test Variable    ${response}

Verify User Deleted Msg
    ${DELETE_USER_MSG}=    Get From Dictionary        ${response.json()}    message
    ${DELETE_USER_MSG_STRING}=    Convert To String   ${DELETE_USER_MSG}
    Should Be Equal    ${DELETE_USER_MSG_STRING}     Registro excluído com sucesso


