#!/bin/bash -ex

source get-api-token.sh
source get-nova-compute-service-public-url.sh

export RESP_JSON_OS_SECGROUPS_CREATE=$(curl -s -X POST $NOVA_COMPUTE_SERV_PUBLIC_URL/os-security-groups \
            -H "Content-Type: application/json" \
            -H "X-Auth-Token: $API_TOKEN" \
	    -d "{
			\"security_group\": {
				\"name\": \"secgroup-$RANDOM\",
				\"description\": \"auto-generated by script $(basename $0)\"
			}
		}")