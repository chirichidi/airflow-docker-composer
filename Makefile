PYTHON_INTERPRETER_RUNTIME_TAG='chirichidi/airflow-docker-composer'


build:
	docker build \
		$(shell pwd)/env/docker/ \
		--tag=${PYTHON_INTERPRETER_RUNTIME_TAG}

start:
	./airflow.sh

stop:
	./cleanup.sh

#pip freeze > requirements.txt