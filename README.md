# Automação de Testes E2E e API com Robot Framework

Projeto de automação de testes para o frontend e backend [ServeRest](https://serverest.dev)

## 📋 Tabela de Conteúdos
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Execução dos Testes](#-execução-dos-testes)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Makefile](#-makefile)
- [Outras formas de rodar o projeto](#-Robot-commands)


## 🛠️ Pré-requisitos
- Python 3.8+
- Pip (Gerenciador de Pacotes Python)
- Git (Opcional)
- Navegador Chrome/Firefox (Para testes de frontend)
- Makefile

## 📥 Instalação

### 1. Clonar o Repositório
```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
````
### 2. Instalar Dependências
```bash
pip install -r requirements.txt
```
ou se já tiver o Makefile instalado
```bash
make install
```

### 3. Configurar WebDrivers (Automatizado)
O projeto usa Webdrivermanager para gerenciar drivers automaticamente. Execute:
```bash
webdrivermanager chrome firefox --linkpath /usr/local/bin
```


## 📁 Estrutura do Projeto
```bash
project/
├── api/                 # Testes de API
│   ├── resources/       # Endpoints e configurações
│   └── tests/           # Cenários de teste
├── frontend/            # Testes de interface
│   ├── resources/       # Keywords, locators e variáveis
│   └── tests/           # Cenários de teste
├── results/             # Relatórios e logs
├── Makefile             # Automação de tarefas
└── requirements.txt     # Dependências
````

## 🚀 Execução dos Testes
### Comandos Gerais (Makefile)
```bash
make [target]
````
Targets Disponíveis
| **Comando**        | **Descrição **               |
|--------------------|------------------------------|
| **install**        | Instala dependências         |
| **test-run** | Executa testes em um unico arquivo   |
| **frontend-tests** | Executa testes de frontend   |
| **api-tests**      | Executa testes de API        |
| **all-tests**      | Executa todos os testes      |
| **report**         | Gera relatório consolidado   |
| **clean-report**   | Remove resultados anteriores |

**Exemplos de uso do Makefile:**
```bash
# Executar testes em unico arquivo
make test-run TEST=<pathFile>

# Executar todos os testes
make all-tests

# Executar apenas testes de API
make api-tests

# Gerar relatório consolidado
make report
````

## ⚙️ Install Makefile no Windows
#### Opção 1: Usar WSL 
1. Instale Windows Subsystem for Linux
2. Siga os passos de instalação do Linux

#### Opção 2: Instalar Make Manualmente (Recomendado)
1. Baixe o GNU Make para Windows

2. Adicione ao PATH
```bash
C:\Program Files (x86)\GnuWin32\bin
````
3. Execute os comandos do Make no terminal


### 🤖 Robot commands
| **Comando**        | **Descrição **               |
|--------------------|------------------------------|
|**robot -d results/test <testPath>**     | Executa o teste em um arquivo         |
| **robot -d results/test/api <FolderApiPath>** | Executa testes de API   |
| **robot -d results/test/frontend <FolderFrontEndPath>**      | Executa testes de FrontEnd        |
