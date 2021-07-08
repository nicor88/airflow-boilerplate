# airflow-boilerplate
A simple repository that serve as boilerplate to run Airflow.

## Requirements
* Docker
* Python >= 3.8

## Development

### Airflow up and down
It's possible to spin up an Airflow instance locally simply running:
<pre>
make airflow-up
</pre>
After that airflow is reachable at [localhost:8080](http://localhost:8080).
To login use this credentials:
<pre>
user: airflow
password: airflow
</pre>
Airflow instance is based on LocalExecutor, this means that the tasks will run inside the scheduler container.

To shut down airflow run:

<pre>
make airflow-down
</pre>

### Setup local environment
When interacting with the codebase from your IDE or editor of your choice, it's helpful to have
airflow installed locally.
Run `make init-venv`. The command will setup a virtual environment, and install all the libraries
needed to work with the codebase.

### Linting
To lint the code base use the command `make lint`, the linting is based on flake8.

### Unit tests
Before being able the unit test locally, you need to run `make init-local`, that will create
the artifacts to run airflow locally (e.g. setting up a DB based on SQLite).
To run unit tests use the command `make run-tests`, this will use pytest to run the test suits.

### Fix imports order
It's possible to fix the imports oder in the python files, simply running `make fix-imports`
