FROM alpine:3.11
RUN apk add --no-cache openssh-client ansible git sshpass 
COPY ./ansible /ansible

WORKDIR /ansible

CMD [ "ansible-playbook", "-i", "inventories/servers.yml", "playbooks/playbook.yml" ]
