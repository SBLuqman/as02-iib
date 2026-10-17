# DS1202 System Information Project

An automated system auditing tool designed to gather, display, and archive core metrics of a Unix/Linux server environment. This repository forms the implementation blueprint for managing system diagnostics using automated shell scripting and structured Git version control workflows.

## Project Overview & Metrics

The core engine of this project is `scripts/sysinfo.sh`. When executed, the script runs diagnostic system commands, outputs a clean, human-readable terminal report, and automatically mirrors a duplicate snapshot file into a timestamped `/logs` directory.

The script monitors and reports the following vital system statistics at minimum:
* **Hostname:** The unique network identifier assigned to the host machine.
* **OS / Kernel Version:** The specific operating system distribution and kernel release framework running the hardware.
* **System Uptime:** The current duration showing how long the system has been continuously active since its last reboot.
* **CPU Load Average:** The processing demand marker monitoring baseline CPU activity metrics.
* **Memory Allocation:** Visual allocation maps outlining total, used, and free volatile RAM.
* **Disk Space Utilization:** Storage capacity tracking across the root `/` filesystem directory.

---

## Step-by-Step Setup Architecture

Follow these steps exactly to set up the file trees, directory privileges, and server credentials needed to run this engine.

### 1. Directory Structure Configuration
Build the project workspace paths inside your home directory environment:
```bash
mkdir -p ~/ds1202-project/scripts
mkdir -p ~/ds1202-project/logs
```

### 2. File Script Injection & Permissions
Create the execution file layout and grant the script explicit executable execution binaries:
```bash
# Set up executable binary access
chmod +x ~/ds1202-project/scripts/sysinfo.sh
```

### 3. Server SSH Key Generation & GitHub Handshake
To push data seamlessly without password prompts, generate a secure connection layer key on the execution server:
```bash
# 1. Generate the secure identity file (Press Enter through prompts to use defaults)
ssh-keygen -t ed25519 -C "your_github_email@example.com"

# 2. Register the generated key block directly inside server memory
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 3. Print the key token payload to copy it
cat ~/.ssh/id_ed25519.pub
```
* **GitHub Application Connection:** Copy the printed output string. Go to your **GitHub Settings** -> **SSH and GPG keys** -> Click **New SSH key**, paste your key, and click save.

Verify the handshake with the server host:
```bash
ssh -T git@github.com
```

---

## How to Run the Script

Run the script directly from your terminal using its absolute or relative workspace paths:

```bash
~/ds1202-project/scripts/sysinfo.sh
```

### Execution Output Result Mapping
Every script invocation automatically streams performance summaries down into the log archives:
* **Terminal Display:** Renders a clean interface overview block immediately on screen.
* **Log Archive Creation:** Writes a text history record inside `~/ds1202-project/logs/sysinfo_YYYYMMDD_HHMMSS.log` containing identical configuration readouts.

---

## Git Implementation Workflow

This development cycle utilizes a sandboxed branch strategy to protect production-ready branches from experimental scripting errors:

### 1. Repository Initialisation & Author Profile Binding
Initialize tracking inside the root workspace and define your identity parameters:
```bash
cd ~/ds1202-project
git init
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 2. Feature Sandbox Branching
Isolate new feature additions, script upgrades, or metric logging configurations by creating an isolated workflow path:
```bash
git checkout -b enhance-sysinfo
```

### 3. Progressive Changeset Commits
Track modifications as you develop features locally:
```bash
git add scripts/sysinfo.sh
git commit -m "Enhance script report engine with advanced metrics and automated logging architectures"
```

### 4. Code Integration & Merging
Once feature changes are tested and error-free, merge the history back into your stable primary development line:
```bash
# Switch to the primary production environment
git checkout main

# Merge in modifications from the development branch
git merge enhance-sysinfo
```

### 5. Secure Remote Pushing
Reconfigure the origin path to target the verified SSH protocol layer, then upload your project without password prompts:
```bash
# Map the tracking line directly to your repository's secure endpoints
git remote add origin git@github.com:SBLuqman/as02-iib.git

# Push changes securely online
git push -u origin main
```
