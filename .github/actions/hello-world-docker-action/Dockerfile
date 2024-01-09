# Container image that runs your code
FROM ghcr.io/dbt-labs/dbt-core:latest

RUN apt update
RUN apt install -y jq
RUN python -m pip install dbt-postgres

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
