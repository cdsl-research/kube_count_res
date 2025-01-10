clusters=(
    "k3s"
    "k0s"
    "microk8s"
    "rke2"
)

for cluster in "${clusters[@]}" ; do
    kubectl config use-context $cluster

    echo "" > data/$cluster

    kubectl api-resources --verbs=list -o name | while read resource
    do
        echo  "$resource" >> data/$cluster
        kubectl get --ignore-not-found -o name -A $resource | wc -l >> data/$cluster
    done
    echo "data/$cluster created."
done

./get_diff.sh
