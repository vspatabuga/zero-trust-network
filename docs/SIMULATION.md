# Zero-Trust Network Simulation

> Identity-Centric Security Architecture - Simulation Guide

## Overview

Zero-Trust Network demonstrates identity-centric security principles replacing traditional perimeter-based security. This simulation allows you to experience a complete zero-trust security architecture locally.

## Prerequisites

- Docker 20.10+
- Docker Compose v2+
- Node.js 18+
- 4GB+ RAM recommended

## Quick Start

### Option 1: Using vsp-porto (Recommended)

```bash
# Install vsp-porto
curl -fsSL https://porto.vspatabuga.io/ | sh

# Install Zero-Trust Network simulation
vsp-porto install zero-trust

# Start the simulation
vsp-porto start zero-trust -o

# View logs
vsp-porto logs zero-trust -f
```

### Option 2: Direct Docker

```bash
git clone https://github.com/vspatabuga/zero-trust-network.git
cd zero-trust-network
./simulate.sh
```

## Access URLs

| Service | URL | Description |
|---------|-----|-------------|
| Secure Proxy | https://localhost:3004 | Protected reverse proxy |
| Web UI | http://localhost:3005 | Security dashboard |

## Features

- **Identity-Based Access** - Authentication via identity provider
- **Mesh Encryption** - WireGuard-based encrypted tunnels
- **Hidden Ingress** - Cloudflare Tunnel pattern
- **Secret Management** - Vaultwarden integration
- **Access Logging** - Comprehensive audit trail

## Components

### Tailscale
Identity-aware VPN for secure mesh networking.

### WireGuard
Modern VPN protocol for encrypted peer-to-peer connections.

### Cloudflare Tunnel
Exposes services without open inbound ports.

### Vaultwarden
Self-hosted password manager for secrets management.

## Security Principles Demonstrated

1. **Never Trust, Always Verify** - Every request is authenticated
2. **Least Privilege Access** - Minimal permissions granted
3. **Assume Breach** - Monitoring and logging enabled
4. **Continuous Verification** - Regular re-authentication

## Demo Workflow

1. **Register Device** - Add new device to network
2. **Authenticate** - Login with identity provider
3. **Access Resource** - Request protected service
4. **Audit Review** - Check access logs

## Stopping the Simulation

```bash
# Using vsp-porto
vsp-porto stop zero-trust

# Or using docker-compose
docker compose -p vsp-zero-trust down
```

## Certificate Warning

HTTPS shows a certificate warning because we're using self-signed certificates for local development. This is expected behavior.

To proceed:
1. Click "Advanced" in browser
2. Click "Proceed to localhost"

## Documentation

- [Architecture](./ARCHITECTURE.md)
- [Development Setup](./SETUP.md)
