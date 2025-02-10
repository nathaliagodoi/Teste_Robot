`"
project/
├── frontend/
│   ├── resources/
│   │   ├── keywords.robot
│   │   ├── locators.robot
│   │   └── variables.robot
│   └── tests/
│       ├── login.robot
│       ├── cart.robot
│       └── registration.robot
├── api/
│   ├── resources/
│   │   ├── keywords.robot
│   │   ├── endpoints.robot
│   │   └── variables.robot
│   └── tests/
│       ├── create_user.robot
│       ├── update_product.robot
│       └── delete_user.robot
└── requirements.txt
"`



# Instale as dependências
`"pip install -r requirements.txt"`

# Execute os testes:
`"
robot -d frontend/results frontend/tests/
robot -d api/results api/tests/
"`	