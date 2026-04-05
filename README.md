# 🛡️ Zero-Trust Network

## 📌 Project Overview
**Zero-Trust Network** is a prototype for an identity-centric security architecture. It replaces the traditional "trusted perimeter" with a model that assumes no implicit trust, requiring strict verification for every device and user attempting to access resources.

This project secures the communication channels between distributed nodes in the Sovereign Infrastructure and the AI Governance stack.

---

## 🏗️ System Architecture (Identity-Aware Perimeter)

```mermaid
flowchart TD
    %% Global Styling
    classDef default fill:#f9f9f9,stroke:#333,stroke-width:1px,color:#333,font-family:Inter,sans-serif;
    classDef user fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    classDef secure fill:#ede7f6,stroke:#4527a0,stroke-width:2px;
    classDef network fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px;
    classDef secret fill:#fffde7,stroke:#fbc02d,stroke-width:2px;
    classDef infra fill:#eceff1,stroke:#455a64,stroke-width:1px;

    %% Nodes & Structure
    User((👤 User / Device))
    
    subgraph IAM [Identity & Access Management]
        direction TB
        IDP[Tailscale / Cloudflare IDP]
        SECRETS{{Vaultwarden / Hashi Vault}}
    end

    subgraph TRANSPORT [Secure Tunneling]
        direction LR
        WG[WireGuard Protocol] --- TUN[Cloudflare Tunnel]
    end

    subgraph TARGET [Sovereign Resources]
        direction TB
        NODE[Distributed Nodes]
        AI[AI Governance Stack]
    end

    %% Connections
    User ==>|Identity Challenge| IDP
    IDP ==>|Generate Token| SECRETS
    SECRETS ==>|Authorize| WG
    
    WG ==>|Encrypted Pipe| TUN
    TUN ==>|Expose Services| TARGET
    
    %% Assign Classes
    class User user;
    class IDP,SECRETS secure;
    class WG,TUN network;
    class NODE,AI infra;
```

### 📋 Diagram Legend (Security Principles)
| Symbol/Style | Description | Classification |
| :--- | :--- | :--- |
| **Double Circle (( ))** | Authenticated User or Device | **Person** |
| **Hexagon {{ }}** | Secrets Management & Credential Store | **Security Controller** |
| **Rectangle [ ]** | Networking Protocols and IDPs | **Network Component** |
| **Bold Line (==>)** | Encrypted & Authenticated Traffic | **Secure Flow** |
| **Thin Line (---)** | Protocol Peering | **Association** |
| **Purple Box** | Identity & Secret Verification Layer | **Trust Control** |
| **Blue Box (Nodes)** | Encryption & Tunneling Layer | **Network Fabric** |
| **Green Box** | Final Protected Resource Layer | **Service Layer** |

---

## 🚀 Key Components & Logic

### 1. Identity over Location
Instead of IP-based security, the system uses **Tailscale** (WireGuard-based) to create an encrypted mesh network where every node has a unique, verifiable identity. This ensures that a compromised node cannot easily move laterally through the network.

### 2. Secret Sovereignty: Vaultwarden
Secrets, API keys, and certificates are managed centrally through **Vaultwarden**. This ensures that sensitive data is never hard-coded into the infrastructure and can be rotated automatically within the Zero-Trust perimeter.

### 3. Edge Security: Cloudflare Tunnel
Public-facing services are exposed securely through **Cloudflare Tunnels**. This eliminates the need for open inbound ports on the server, effectively hiding the infrastructure from the public internet while allowing authenticated access.

---

## 🛡️ Zero-Trust Workflow

1.  **Identity:** The User/Device authenticates with the Identity Provider (IDP).
2.  **Encryption:** Tailscale/WireGuard establishes an end-to-end encrypted tunnel.
3.  **Authorization:** The system checks the Access Control Policy (ACL) in Vaultwarden/Tailscale.
4.  **Least Privilege:** Access is granted *only* to the specific service requested (e.g., the AI Governance Dashboard).
5.  **Monitoring:** All access events are logged for audit and security analysis.

---

## 🛠️ Tech Stack Employed

| Layer | Technologies |
| :--- | :--- |
| **Connectivity** | ![](https://img.shields.io/badge/Tailscale-4433FF?style=flat&logo=tailscale&logoColor=white) ![](https://img.shields.io/badge/WireGuard-881717?style=flat&logo=wireguard&logoColor=white) |
| **Public Ingress** | ![](https://img.shields.io/badge/Cloudflare-F38020?style=flat&logo=cloudflare&logoColor=white) ![](https://img.shields.io/badge/GitHub%20Actions-2088FF?style=flat&logo=githubactions&logoColor=white) |
| **Secrets Management**| ![](https://img.shields.io/badge/Vaultwarden-175DDC?style=flat&logo=vaultwarden&logoColor=white) ![](https://img.shields.io/badge/Hashi-FF3E00?style=flat&logo=hashicorp&logoColor=white) |
| **Infrastructure** | ![](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white) ![](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white) |

---

## 🛠️ Simulation & Docker Package
Experience the identity-aware perimeter by deploying our **Docker Security Package** available in the GitHub Packages tab.

---
*Standardized by PES AI-Assistant (Gemini CLI)*
*Zero-Trust Security Compliance v1.0*
