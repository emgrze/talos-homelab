#!/bin/bash
set -e

NODE="192.168.1.10"
FILE="cluster/controlplane.yaml"

echo "=== Applying Talos config to $NODE ==="

talosctl apply-config --insecure \
  --nodes $NODE \
  --file $FILE \
  --config-patch @patches/hostname.yaml \
  --config-patch @patches/static-ip.yaml \
  --config-patch @patches/single-node.yaml

echo "=== Done ==="
