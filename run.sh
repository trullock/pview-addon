#!/usr/bin/with-contenv bashio

declare -a pview_args

if bashio::config.has_value "mqtthost"; then
    pview_args+=("--host $(bashio::config mqtthost)")
else
    pview_args+=("--host $(bashio::services mqtt 'host')")
fi

if bashio::config.has_value "mqttport"; then
    pview_args+=("--port $(bashio::config mqttport)")
else
    pview_args+=("--port $(bashio::services mqtt 'port')")
fi

if bashio::config.has_value "mqttuser"; then
    pview_args+=("--username $(bashio::config mqttuser)")
else
    pview_args+=("--username $(bashio::services mqtt 'username')")
fi

if bashio::config.has_value "mqttpass"; then
    pview_args+=("--password $(bashio::config mqttpass)")
else
    pview_args+=("--password $(bashio::services mqtt 'password')")
fi

echo "> pview ${pview_args[*]}"

pview ${pview_args[*]}