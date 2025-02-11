*** Settings ***
Documentation    Teste de End2End - ANBEV API
...                Criar um usuário, cadastrar um produto, cadastrar um carrinho, editar usuário, editar produto, editar carrinho
...                e depois deletar todos os dados criados.

Resource    ../resources/baseAPI.robot


Test Teardown    Run Keywords
...              Delete Test Product    AND
...              Delete User API


*** Test Cases ***

End2End Test
    [Tags]                        e2e_test
#Create User API
    Create User API         
    Get User API Informations
    Login API User   
#Create Test Product
    Create Test Product     
    Get Product Data API      
#Create Test Cart
    Create Test Cart        
    Get Cart informations   
    Cancel Test Cart