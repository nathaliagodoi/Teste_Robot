*** Variables ***
# Login Page
${INPUT_EMAIL}                id:email
${INPUT_PASSWORD}             id:password
${BUTTON_LOGIN}               xpath=//button[text()='Entrar']
${BUTTON_LOGOUT}              xpath=//button[text()='Logout']
${ALERT_ERROR}                css:.alert
${MSG_LOGIN_ERROR}           "Email e/ou senha inválidos"

# Registration Page
${LINK_REGISTER}                      css:[data-testid=cadastrar]
${INPUT_REGISTER_NAME}                id:nome
${INPUT_REGISTER_EMAIL}               id:email
${INPUT_REGISTER_PASSWORD}            id:password
${CHECKBOX_ADMIN}                     css:[data-testid=checkbox]
${BUTTON_SUBMIT_REGISTER}             css:[data-testid=cadastrar]
${BUTTON_SUBMIT_REGISTER_USER}        css:[data-testid="cadastrarUsuario"]
${CREATE_USER_ADMIN_PAGE}             css:[data-testid=cadastrar-usuarios]

# Product/Cart
#ADMIN ADD PRODUCT
${ADD_PRODUCT_PAGE}           css:[data-testid=cadastrar-produtos]
${INPUT_PRODUCT_NAME}                 id:nome
${INPUT_PRODUCT_PRICE}                id:price
${INPUT_PRODUCT_DESCRIPTION}          id:description
${INPUT_PRODUCT_QUANTITY}             id:quantity
${BUTTON_PRODUCT_SUBMIT}              css:[data-testid=cadastarProdutos]


#USER ADD PRODUCT
${INPUT_PRODUCT_SEARCH}               css:[data-testid=pesquisar]
${BUTTON_SEARCH}                      css:[data-testid="botaoPesquisar"]
${PRODUCT_CARD}                       css:[data-testid=product-detail-link]
${BUTTON_ADD_TO_CART}                 css:[data-testid=adicionarNaLista]
${CART_LIST}                          css:[data-testid=lista-de-compras]
${PRODUCT_DETAIL_BUTTON}              css:[data-testid=product-detail-link]
${PRODUCT_DETAIL_NAME}                css:[data-testid="shopping-cart-product-name"]
