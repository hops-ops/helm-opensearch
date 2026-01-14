import models.io.upbound.dev.meta.v1alpha1 as metav1alpha1
import models.k8s.apimachinery.pkg.apis.meta.v1 as metav1

# ==============================================================================
# E2E test for OpenSearch XRD
# ==============================================================================

_items = [
    metav1alpha1.CompositionTest {
        metadata.name = "e2e-opensearch"
        spec = {
            compositionPath = "apis/opensearches/composition.yaml"
            xrdPath = "apis/opensearches/definition.yaml"
            timeoutSeconds = 600
            validate = True
            xr = {
                apiVersion = "helm.hops.ops.com.ai/v1alpha1"
                kind = "OpenSearch"
                metadata.name = "e2e-opensearch"
                spec = {
                    clusterName = "e2e-cluster"
                    namespace = "opensearch"
                }
            }
        }
    }
]

items = _items
