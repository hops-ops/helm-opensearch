# helm-opensearch

A Crossplane configuration that deploys OpenSearch via Helm.

OpenSearch is a scalable, flexible, and extensible open-source software suite for search, analytics, and observability applications.

## Quick Start

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: OpenSearch
metadata:
  name: opensearch
  namespace: my-namespace
spec:
  clusterName: my-cluster
```

## Configuration

| Field | Description | Default |
|-------|-------------|---------|
| `clusterName` | Name of the Kubernetes cluster | Required |
| `namespace` | Namespace to deploy OpenSearch | `opensearch` |
| `releaseName` | Helm release name | XR name |
| `labels` | Labels to apply to resources | See below |
| `values` | Helm values (merged with defaults) | `{}` |
| `overrideAllValues` | Replace all default values | `{}` |
| `providerConfigRef` | Provider config reference | `{name: clusterName, kind: ProviderConfig}` |
| `managementPolicies` | Crossplane management policies | `["*"]` |

### Default Labels

```yaml
hops.ops.com.ai/managed: "true"
hops.ops.com.ai/opensearch: "<name>"
```

### Default Helm Values

```yaml
singleNode: true
```

## Examples

### Minimal

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: OpenSearch
metadata:
  name: opensearch
  namespace: example-env
spec:
  clusterName: example-cluster
```

### Production

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: OpenSearch
metadata:
  name: opensearch
  namespace: example-env
spec:
  clusterName: example-cluster
  namespace: opensearch
  labels:
    team: platform
    environment: production
  values:
    replicas: 3
    resources:
      requests:
        cpu: "2"
        memory: "4Gi"
    persistence:
      size: 100Gi
```

### Override All Values

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: OpenSearch
metadata:
  name: opensearch
  namespace: example-env
spec:
  clusterName: example-cluster
  overrideAllValues:
    singleNode: false
    replicas: 5
    masterService: opensearch-cluster-master
```

## Development

```bash
# Build the package
make build

# Render examples
make render

# Validate examples
make validate

# Run unit tests
make test

# Run E2E tests
make e2e
```

## Chart Information

- **Chart**: opensearch
- **Repository**: https://opensearch-project.github.io/helm-charts/
- **Version**: 3.4.0
