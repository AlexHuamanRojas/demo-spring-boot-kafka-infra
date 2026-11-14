
#!/usr/bin/env bash

set -euo pipefail

IMAGE="${1:-demo-spring-boot-kafka:1.0}"

echo "======================================"
echo " CARGA DE IMAGEN EN KUBERNETES"
echo "======================================"

# Comprobar que existe la imagen local
if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
    echo "ERROR: La imagen $IMAGE no existe localmente."
    exit 1
fi

# Obtener los nodos del clúster
NODES=$(kubectl get nodes -o jsonpath='{.items[*].metadata.name}')

if [[ -z "$NODES" ]]; then
    echo "ERROR: No se encontraron nodos Kubernetes."
    exit 1
fi

# Importar la imagen en containerd de cada nodo
for NODE in $NODES; do
    echo "Cargando $IMAGE en el nodo $NODE..."

    docker save "$IMAGE" | docker exec -i "$NODE" \
        ctr -n k8s.io images import -

    echo "Imagen cargada correctamente en $NODE."
done

echo "======================================"
echo " IMAGEN DISPONIBLE EN KUBERNETES"
echo "======================================"
