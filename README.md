# AI Projects Tools

This project intends to be a shortcut to locally run some of the common tools to build AI projects. The idea is to provide `docker-compose` files that can be merged to make a compose file for all the tools needed for a project so it can be easily run.

Every directory also has a `Makefile`, which is mounted to abstract some base commands from the `docker compose` application, standardizing the commands to run and stop the service, for example.

## Requirements

The base requirement for running any of the services is:

- [Docker](https://docs.docker.com/engine/install/) with [Docker Compose](https://docs.docker.com/compose/install/)
- [Make](https://www.gnu.org/software/make/) (if you're going to use the shortcuts to run the services)

> Note that what's used is the `docker compose` instead of  `docker-compose` to execute the services, which is currently automatically installed when installing [Docker Desktop](https://docs.docker.com/desktop/), for example.

## The commands

As mentioned before, each directory has its own `Makefile`, and to standardize the action commands between them, you can consider the following base commands:

- `make help`: it shows the details of all the make commands in the current directory
- `make [service]-build`: builds the Docker image for the service
- `make [service]-run`: runs the containers for the service
- `make [service]-stop`: stops the containers for the service
- `make [service]-reset`: rebuilds and restarts the containers for the service

> For example, to run N8N, the commands would be `make n8n-build`, `make n8n-run`, `make n8n-stop` and `make n8n-reset`.

## Controlling resources

In every Makefile there are variables used to set the resource limits for the container. This is used to simulate cloud environments with limited resources so it can be easily defined how much of each resource should be allocated when running a production instance.

To change the amount of resources for a service when using the Make shortcuts, open the service's `Makefile` and look for these two variables, usually at the top of the file, and change their values as needed:

```
[SERVICE]_CPU = XX
[SERVICE]_MEMORY = YY
```

> Again, replace `[SERVICE]` with the name of the service you're configuring, so, for example, Flowise would have the variables `FLOWISE_CPU` and `FLOWISE_MEMORY`.