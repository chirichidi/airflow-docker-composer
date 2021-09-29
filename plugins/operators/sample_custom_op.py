from airflow.models import BaseOperator


class SampleCustomOperator(BaseOperator):

    def __init__(self, *args, **kwargs):
        super(SampleCustomOperator, self).__init__(*args, **kwargs)

    def execute(self, context):
        print("Hello World")
        print(context)