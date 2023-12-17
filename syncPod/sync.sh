# Run this script

cd $(dirname $0)

NODES="k8s-node21 k8s-gpu"

for NODE in $NODES ; do
    echo
    echo
    echo NODE: $NODE
    kubectl -n rse delete pod llm-sync
    cat sync.yaml | sed -e s/k8s-node21/$NODE/ -e 's/sleep 3600/sleep 5/' | kubectl -n rse apply -f -
    kubectl -n rse wait --for=condition=ready pod/llm-sync
    kubectl -n rse logs llm-sync --pod-running-timeout=20s | sed -e 's/^/| /'
    kubectl -n rse exec llm-sync -- sh -c 'cd /models && git annex find --in .' | sed -e 's/^/||| /'
    #kubectl -n rse logs llm-sync | sed -e 's/^/| /'
    kubectl -n rse delete pod llm-sync
    echo DONE: $NODE
done
