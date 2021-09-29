PYTHON_INTERPRETER_RUNTIME_TAG='chirichidi/airflow-docker-composer'


build: \
	build-image-in-runtime \
	setuptools

build-image-in-runtime:
	docker build \
		$(shell pwd)/env/docker/ \
		--tag=${PYTHON_INTERPRETER_RUNTIME_TAG}

#pip freeze > requirements.txt

setuptools:
	docker run -it \
	--rm \
	-e PYTHONPATH=/opt/project \
	-v /mnt/c/data/lib/airflow-docker-composer:/opt/project chirichidi/airflow-docker-composer \
	bash -c "cd /opt/project && python setup.py develop && time python /opt/project/dags/dummy_dag.py"

compose-up:
	docker-compose up

compose-down:
	docker-compose down --volumes --rmi all