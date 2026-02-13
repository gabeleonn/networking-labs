# On-Call Notes

## Commands Explanation

**`ip netns add <namespace>`:** Creates a new network namespace (isolated network stack: interfaces, routes, neighbors)

**`ip link add <veth> type veth peer name <peer>`:** Creates a pair of connected NICs

**`ip link add <link> type bridge `:** Creates a Linux bridge

**`ip link set <link> up`:** Turns bridge ON

**`ip link set <peer> master <link>`:** Links NIC peer to bridge

**`ip link set <peer> up`:** Turns interface ON

**`ip link set <veth> netns <namespace>`:** Links NIC to namespace

**`ip netns exec <namespace> ip addr add <IP/subnet> dev <veth>`:** Sets IP for given NIC

**`ip netns exec <namespace> ip link set <veth> up`:** Turns interface ON

**`ip netns exec <namespace> ip link set lo up`:** Sets loopback

**`ip netns exec <namespace> <command>`:** Allows running given `<command>` on an arbitrary namespace
