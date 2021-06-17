FROM apache/airflow:2.1.0-python3.8

ARG AIRFLOW_HOME_ARG=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_HOME_ARG}

USER airflow
# each folder in AIRFLOW_HOME can be used as import in python
ENV PYTHONPATH ${AIRFLOW_HOME}:$PYTHONPATH

# install extra requirements
COPY requirements-providers.txt /
RUN pip install --user --no-cache-dir -r /requirements-providers.txt
COPY requirements.txt /
RUN pip install --user --no-cache-dir -r /requirements.txt

# copy config and artifacts after install requirements to avoid to install requirements on each code change
# add always chwown to each COPY to make airflow the owner
COPY --chown=airflow:airflow config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
COPY --chown=airflow:airflow dags ${AIRFLOW_HOME}/dags
COPY --chown=airflow:airflow plugins ${AIRFLOW_HOME}/plugins

WORKDIR ${AIRFLOW_HOME}
#ENTRYPOINT ["/entrypoint.sh"]
CMD ["airflow version"]
