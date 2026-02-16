#!/bin/bash

echo "🔎 Cleaning namespaces x* ..."
for ns in $(ip netns list | awk '{print $1}' | grep '^x'); do
    echo "  - removing namespace $ns"
    ip netns del "$ns"
done

echo "🔎 Cleaning bridges x* ..."
for br in $(ip -o link show type bridge | awk -F': ' '{print $2}' | grep '^x'); do
    echo "  - removing bridge $br"
    ip link set "$br" down 2>/dev/null
    ip link del "$br" type bridge
done

echo "🔎 Cleaning veth x* ..."
for v in $(ip -o link show type veth | awk -F': ' '{print $2}' | grep '^x'); do
    echo "  - removing veth $v"
    ip link del "$v" 2>/dev/null
done

echo "✅ Reset x* completed."