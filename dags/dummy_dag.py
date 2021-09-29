from datetime import datetime
from datetime import timedelta

from airflow import models
from airflow.operators import dummy
from airflow.operators import bash

from plugins.operators.sample_custom_op import SampleCustomOperator


default_args = {
    'owner': 'airflow',
    'start_date': datetime.now() - timedelta(days=2),
    'depends_on_past': False,
    'email': [],
    'email_in_failure': False,
    'retries': 5,
    'retry_delay': timedelta(minutes=2),
}

##
with models.DAG(
        'dummy_dag',
        default_args=default_args,
        is_paused_upon_creation=True,
        schedule_interval='0 7 * * *'
    ) as dag:

    start = dummy.DummyOperator(
        task_id='start',
        trigger_rule='all_success'
    )

    start2 = dummy.DummyOperator(
        task_id='start2',
        trigger_rule='all_success'
    )

    end = dummy.DummyOperator(
        task_id='end',
        trigger_rule='all_success'
    )

    bash_op = bash.BashOperator(
        task_id='bashOperator',
        bash_command='ls',
    )

    hello_task = SampleCustomOperator(
        task_id='SampleCustomOperator',
    )

    [start, start2] >> bash_op >> hello_task >> end