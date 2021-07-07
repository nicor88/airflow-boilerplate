import logging

logger = logging.getLogger('utils')


def on_failure_callback(context):
    dag_id = context.get('dag_id')
    task_id = context.get('task_id')
    logger.info(f'Failure detected from {dag_id} and {task_id}')
    # TODO do something with the callback, e.g. send a message to Slack
