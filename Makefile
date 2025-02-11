# Configurações
FRONTEND_DIR = frontend/tests
API_DIR = api/tests
TEST_RUN = ${TEST}
RESULTS_DIR = results

.PHONY: help install install-drivers frontend-tests api-tests all-tests clean-report

help:
	@echo "Comandos disponiveis:"
	@echo "  install           - Instala dependencias"
	@echo "  frontend-tests    - Executa testes de frontend"
	@echo "  api-tests         - Executa testes de API"
	@echo "  all-tests         - Executa todos os testes"
	@echo "  test-run          - Executa testes especificos"  ex.: make test-run TEST=./api/tests/e2e_test.robot
	@echo "  clean-report      - Limpa resultados anteriores"

install:
	@echo "Instalando dependências..."
	pip install -r requirements.txt

frontend-tests:
	@echo "Executando testes de frontend..."
	robot -d ${RESULTS_DIR}/frontend ${FRONTEND_DIR}

api-tests:
	@echo "Executando testes de API..."
	robot -d ${RESULTS_DIR}/api ${API_DIR}

all-tests: frontend-tests api-tests

test-run:
	@echo "Executando testes..."
	robot -d ${RESULTS_DIR}/test ${TEST}

clean-report:
	@echo "Limpando resultados anteriores..."
	rm -rf ${RESULTS_DIR}/*

report:
	@echo "Gerando relatório consolidado..."
	rebot --outputdir ${RESULTS_DIR}/combined \
		--name "Relatório Completo" \
		${RESULTS_DIR}/frontend/output.xml \
		${RESULTS_DIR}/api/output.xml