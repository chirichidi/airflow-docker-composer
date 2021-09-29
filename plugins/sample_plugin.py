from airflow.plugins_manager import AirflowPlugin
from operators.sample_custom_op import *
# etc

class SamplePlugin(AirflowPlugin):

    name = 'sample_plugin'

    operators = [SampleCustomOperator]
