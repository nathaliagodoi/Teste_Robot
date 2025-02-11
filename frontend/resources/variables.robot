*** Settings ***

*** Variables ***
#Shared Variables
${FRONTEND_URL}           https://front.serverest.dev

#Acessos Admin
${ADMIN_NAME}             NathaliaAdmin
${ADMIN_EMAIL}            godoi_santos+adminTesteAmbev@hotmail.com
${ADMIN_PASSWORD}         Pass@123

#Acessos User
${USER_NAME}              NathaliaUser
${USER_EMAIL}             godoi_santos+userTesteAmbev@hotmail.com
${USER_PASSWORD}          Pass@123
${PRODUCT_NAME}           Produto Teste


*** Keywords ***
Generate Fake User Data
    ${FAKER_NAME}=        FakerLibrary.Name
    Set Suite Variable    ${FAKER_NAME}
    ${FAKER_EMAIL}=       FakerLibrary.Email
    Set Suite Variable    ${FAKER_EMAIL}
    ${FAKER_PASSWORD}=    FakerLibrary.Password    special_chars=False    length=12
    Set Suite Variable    ${FAKER_PASSWORD}

Generate Fake Product Data
    ${FAKE_PRODUCT_NAME}=      FakerLibrary.Name
    Set Suite Variable    ${FAKE_PRODUCT_NAME}
    ${FAKE_PRODUCT_PRICE}=    FakerLibrary.Pyint    min_value=1    max_value=100
    Set Suite Variable    ${FAKE_PRODUCT_PRICE}
    ${FAKE_PRODUCT_DESCRIPTION}=    FakerLibrary.Sentence    nb_words=10
    Set Suite Variable    ${FAKE_PRODUCT_DESCRIPTION}
    ${FAKE_PRODUCT_QUANTITY}=    FakerLibrary.Pyint    min_value=1    max_value=100
    Set Suite Variable    ${FAKE_PRODUCT_QUANTITY}