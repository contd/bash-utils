#!/usr/bin/env bash

function lights
{
	# List all switch devices
	curl -H "Authorization: Bearer ${__SMART_TOKEN}" https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches

	# Turn Bedroom Light Off
	curl -H "Content-Type: application/json" -H "Authorization: Bearer ${__SMART_TOKEN}" -X PUT -d '{"command": "off"}' https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__BEDLIGHT

	# Turn Bedroom Light On
	curl -H "Content-Type: application/json" -H "Authorization: Bearer ${__SMART_TOKEN}" -X PUT -d '{"command": "on"}' https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__BEDLIGHT

	# Turn Craft Light Off
	curl -H "Content-Type: application/json" -H "Authorization: Bearer ${__SMART_TOKEN}" -X PUT -d '{"command": "off"}' https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__CRAFTLIGHT

	# Turn Craft Light On
	curl -H "Content-Type: application/json" -H "Authorization: Bearer ${__SMART_TOKEN}" -X PUT -d '{"command": "on"}' https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__CRAFTLIGHT
}

function light1
{
	if [ "$1" == 0 ]; then
		# Turn Bedroom Light Off
		curl -H "Content-Type: application/json" \
			-H "Authorization: Bearer ${__SMART_TOKEN}" \
			-X PUT -d '{"command": "off"}' \
			https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__BEDLIGHT
	else
		# Turn Bedroom Light On
		curl -H "Content-Type: application/json" \
		-H "Authorization: Bearer ${__SMART_TOKEN}" \
		-X PUT -d '{"command": "on"}' \
		https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__BEDLIGHT
	fi
}

function light2
{
	if [ "$1" == 0 ]; then
	  # Turn Craft Light Off
		curl -H "Content-Type: application/json" -H "Authorization: Bearer ${__SMART_TOKEN}" -X PUT -d '{"command": "off"}' https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__CRAFTLIGHT
	else
	  # Turn Craft Light On
		curl -H "Content-Type: application/json" -H "Authorization: Bearer ${__SMART_TOKEN}" -X PUT -d '{"command": "on"}' https://graph.api.smartthings.com/api/smartapps/installations/$__SMART_GUID/switches/$__CRAFTLIGHT
	fi
}
