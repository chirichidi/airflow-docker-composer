FROM python:3.8

#WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
#
#COPY . .

#apache-airflow providers: https://airflow.apache.org/docs/apache-airflow-providers/index.html
#RUN pip install apache-airflow[postgres,google]==2.1.4 \
# --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.1.4/constraints-3.7.txt"

#CMD [ "python", "./your-daemon-or-script.py" ]