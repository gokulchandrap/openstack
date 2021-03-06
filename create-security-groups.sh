#!/bin/bash -ex

source get-api-token.sh
source get-neutron-network-service-public-url.sh

export RESP_JSON_SECURITY_GROUPS_CREATE=$(curl -s -X POST $NEUTRON_NETWORK_SERV_PUBLIC_URL/v2.0/security-groups \
            -H "Content-Type: application/json" \
            -H "X-Auth-Token: $API_TOKEN" \
	    -d "{
			\"security_group\": {
				\"name\": \"sg-$RANDOM\",
				\"description\": \"auto-generated by script\"
			}
		}")
