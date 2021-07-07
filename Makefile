REPO_ROOT ?= $(shell git rev-parse --show-toplevel)

clean:
	rm -rf venv

clean-metadata-db:
	rm -rf postgres_data

init-local: clean
	pip3 install virtualenv; \
	virtualenv venv --python=python3.8; \
	source ./venv/bin/activate; \
	pip3 install -r requirements-dev.txt; \
	pip3 install -r requirements-providers.txt; \
	pip3 install -r requirements.txt;

airflow-up: airflow-down
	docker-compose up --build

airflow-down:
	docker-compose down

lint:
	. ./venv/bin/activate; \
	python3 -m flake8 .

run-tests:
	AIRFLOW_HOME=$(REPO_ROOT) python3 -m pytest tests -vv --disable-pytest-warnings

fix-imports:
	. ./venv/bin/activate; \
	python3 -m isort . --skip venv --skip logs
