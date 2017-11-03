#!/bin/bash

# Create a service principal if you haven't done so already:
# az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/mySubscriptionID"

RG_NAME='odl_' #Use the RG assigned to you at login of Sponsored Account
ACS_NAME='xxxk8satl' #Change the xxx to your initials
SSH_KEY_PATH='~/.ssh/id_rsa.pub'
MASTER_OS_DISK=50
AGENT_OS_DISK=120
DNS_PREFIX='xxxk8satl' #Change xxx to your initials
VM_SIZE='Standard_D2_v2'
ADMIN_NAME='xxx-atl' #Change xxx to your initials


az acs create --orchestrator-type Kubernetes -g $RG_NAME -n $ACS_NAME  \
--ssh-key-value $SSH_KEY_PATH --dns-prefix $DNS_PREFIX --master-count 1 \
--master-vm-size $VM_SIZE --master-storage-profile ManagedDisks --master-osdisk-size \
$MASTER_OS_DISK --agent-count 2 --agent-vm-size $VM_SIZE \
--agent-storage-profile ManagedDisks --agent-osdisk-size $AGENT_OS_DISK \
--admin-username $ADMIN_NAME
