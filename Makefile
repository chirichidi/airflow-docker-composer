PYTHON_INTERPRETER_RUNTIME_TAG='chirichidi/airflow-docker-composer'

build: \
	build-image-in-runtime \
	setuptools

build-image-in-runtime:
	docker build \
		$(shell pwd)/env/docker/ \
		--tag=${PYTHON_INTERPRETER_RUNTIME_TAG}

export:
	docker run -it \
	--rm \
	-v /mnt/c/data/lib/airflow-docker-composer:/opt/project chirichidi/airflow-docker-composer \
	pip freeze > requirements.txt

setuptools:
	docker run -it \
	--rm \
	-v /mnt/c/data/lib/airflow-docker-composer:/opt/project chirichidi/airflow-docker-composer \
	bash -c "cd /opt/project && python setup.py develop && time python /opt/project/dags/dummy_dag.py"

compose-up:
	docker-compose up

compose-down:
	docker-compose down --volumes --rmi all

## airflow cli samples ##
info:
	./airflow info

sample-task-list:
	./airflow tasks list dummy_dag

sample-task-test:
	./airflow tasks test dummy_dag SampleCustomOperator 2021-09-28

sample-dags-test:
	./airflow bash -c "time python /opt/airflow/dags/dummy_dag.py"

sample-dags-backfill:
	./airflow dags backfill dummy_dag \
		--start-date 2021-09-28 \
		--end-date 2021-09-29
	# if fail, then first fix bug, then execute ./airflow tasks clear -t <failed_task> --downstream dummy_dag