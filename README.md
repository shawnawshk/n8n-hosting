# n8n with PostgreSQL

Starts n8n with PostgreSQL as database.

## Docker Compose

To start n8n with PostgreSQL simply start docker-compose by executing the following
command in the current folder.

**IMPORTANT:** But before you do that change the default users and passwords in the [`.env`](.env) file!

```
docker-compose up -d
```

To stop it execute:

```
docker-compose stop
```

## Kubernetes Helm Chart

A Helm chart is available in the `n8n-chart/` directory for Kubernetes deployment.

### Prerequisites

- Kubernetes cluster
- Helm 3.x installed
- kubectl configured

### Deploy

1. **IMPORTANT:** Change the default credentials in `n8n-chart/values.yaml` before deployment!

2. Deploy using the provided script:
```bash
cd n8n-chart
./deploy-helm.sh
```

Or manually:
```bash
helm upgrade --install n8n ./n8n-chart \
  --namespace n8n \
  --create-namespace \
  --wait \
  --timeout=10m
```

### Access n8n

After deployment, get the service information:
```bash
kubectl get svc n8n -n n8n
```

For local access, port-forward:
```bash
kubectl port-forward svc/n8n 5678:5678 -n n8n
```

Then access n8n at http://localhost:5678

### Configuration

The default database name, users and passwords can be changed in the [`n8n-chart/values.yaml`](n8n-chart/values.yaml) file.

## Configuration

The default name of the database, user and password for PostgreSQL can be changed in the [`.env`](.env) file in the current directory.
