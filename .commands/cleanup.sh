df -h
sudo find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <( sudo docker ps -aq | xargs sudo docker inspect | jq -r '.[] | .Mounts | .[] | .Name | select(.)' ) | sudo xargs -r sudo rm -fr
sudo docker ps --filter status=dead --filter status=exited -aq | xargs -r sudo docker rm -v
sudo docker images --no-trunc | grep '' | awk '{ print $3 }' | xargs -r sudo docker rmi
df -h