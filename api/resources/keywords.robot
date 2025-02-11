*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    FakerLibrary


*** Keywords ***

# Sessão de Produto
Create Test Product
    Generate Fake Product Data
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 accept=${ACCEPT_TYPE}
    ...                                 administrador=false
    ...                                 authorization=${user_token}
    ${body}=       Create Dictionary    nome=${name}
    ...                                 preco=${price}
    ...                                 descricao=${description}
    ...                                 quantidade=${amount} 
    ${response}=   POST    ${API_BASE_URL}${PRODUCTS_ENDPOINT}    
    ...                    json=${body}    
    ...                    headers=${headers}    
    Log                    ${response.json()}
    ${product_id}=    Get From Dictionary    ${response.json()}        _id
    Set Test Variable    ${product_id}

Get Product informations
    ${product_id}=     Get From Dictionary    ${response.json()}        _id
    Set Test Variable    ${product_id}
    ${product_msg}=    Get From Dictionary    ${response.json()}        message
    Set Test Variable    ${product_msg}

Get Product Data API
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 authorization=${user_token}
    ${response}=   GET    ${API_BASE_URL}${PRODUCTS_ENDPOINT}/${product_id}
    ...                   headers=${headers}
    Log                   ${response.json()}
    ${product_name}=    Get From Dictionary    ${response.json()}             nome
    Set Test Variable    ${product_name}
    ${product_price}=    Get From Dictionary    ${response.json()}            preco
    Set Test Variable    ${product_price}
    ${product_description}=    Get From Dictionary    ${response.json()}      descricao
    Set Test Variable    ${product_description}
    ${product_amount}=    Get From Dictionary    ${response.json()}           quantidade
    Set Test Variable    ${product_amount}

Update Product API
    [Arguments]    ${product_id}    ${new_name}    ${new_price}    ${new_description}    ${new_amount}
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 authorization=${user_token}
    ${body}=       Create Dictionary    nome=${new_name}
    ...                                 preco=${new_price}
    ...                                 descricao=${new_description}
    ...                                 quantidade=${new_amount}
    ${response}=   PUT    ${API_BASE_URL}${PRODUCTS_ENDPOINT}/${product_id}    
    ...                   json=${body}    
    ...                   headers=${headers}
    Log                  ${response.json()}
    Set Test Variable    ${response}

Verify Product Updated
    [Arguments]    ${product_id}    ${new_name}    ${new_price}    ${new_description}    ${new_amount}
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 authorization=${user_token}
    ${response}=   GET    ${API_BASE_URL}${PRODUCTS_ENDPOINT}/${product_id}
    ...                   headers=${headers}
    Log                   ${response.json()}
    Set Test Variable     ${response}
    ${PRODUCT_UPDATE}=    Get From Dictionary        ${response.json()}    nome
    ${PRODUCT_UPDATE_STRING}=    Convert To String   ${PRODUCT_UPDATE}
    Should Be Equal    ${PRODUCT_UPDATE_STRING}     ${new_name}
    ${PRODUCT_UPDATE}=    Get From Dictionary        ${response.json()}    preco
    ${PRODUCT_UPDATE_STRING}=    Convert To String   ${PRODUCT_UPDATE}
    Should Be Equal    ${PRODUCT_UPDATE_STRING}     ${new_price}
    ${PRODUCT_UPDATE}=    Get From Dictionary        ${response.json()}    descricao
    ${PRODUCT_UPDATE_STRING}=    Convert To String   ${PRODUCT_UPDATE}
    Should Be Equal    ${PRODUCT_UPDATE_STRING}     ${new_description}
    ${PRODUCT_UPDATE}=    Get From Dictionary        ${response.json()}    quantidade
    ${PRODUCT_UPDATE_STRING}=    Convert To String   ${PRODUCT_UPDATE}
    Should Be Equal    ${PRODUCT_UPDATE_STRING}     ${new_amount}

Delete Test Product
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 authorization=${user_token}
    ${response}=   DELETE    ${API_BASE_URL}${PRODUCTS_ENDPOINT}/${product_id}    
    ...            headers=${headers}
    Log            ${response.json()}
    
Create Test Cart
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 authorization=${user_token}
    # ${body}=       Create Dictionary    produtos=[${product_data}]
    ${response}=   POST    ${API_BASE_URL}${CARTS_ENDPOINT}    
    ...            data={"produtos":[{"idProduto": "${product_id}", "quantidade": "${product_amount}"}]}
    ...            headers=${headers}
    Log            ${response.json()}
    ${cart_id}=    Get From Dictionary    ${response.json()}        _id
    Set Test Variable    ${cart_id}

Get Cart informations
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 authorization=${user_token}
    ${response}=   GET    ${API_BASE_URL}${CARTS_ENDPOINT}/${cart_id}    
    ...                   headers=${headers}
    Log                   ${response.json()}
    ${id_cart}=    Get From Dictionary    ${response.json()}        _id
    Set Test Variable    ${id_cart}
    ${id_cart_user}=    Get From Dictionary    ${response.json()}        idUsuario
    Set Test Variable    ${id_cart_user}
    ${cart_quantidadeTotal}=    Get From Dictionary    ${response.json()}     quantidadeTotal
    Set Test Variable    ${cart_quantidadeTotal}
    ${cart_TotalPrice}=    Get From Dictionary    ${response.json()}     precoTotal
    Set Test Variable    ${cart_TotalPrice}




Cancel Test Cart
    ${headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}
    ...                                 authorization=${user_token}
    ${response}=   DELETE    ${API_BASE_URL}${CARTS_ENDPOINT}/cancelar-compra   
    ...            headers=${headers}
    Log            ${response.json()}



