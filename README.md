# DS1202 System Information Project

An automated system auditing tool that gathers core Linux server metrics, outputs a terminal report, and logs snapshots to a timestamped file.

## Features & Metrics Reported
The `scripts/sysinfo.sh` script collects:
* **Hostname:** System network identifier.
* **OS / Kernel:** Operating system and kernel distribution.
* **System Uptime:** Continuous system operational duration.
* **CPU Load:** Baseline processor workload metrics.
* **Memory & Disk:** Volatile RAM utilization and root `/` storage capacity.

---

## Step-by-Step Setup

### 1. Workspace Configuration
Create the required directory structures:
```bash
mkdir -p ~/ds1202-project/scripts ~/ds1202-project/logs
```

### 2. Permissions
Make the script executable:
```bash
chmod +x ~/ds1202-project/scripts/sysinfo.sh
```

### 3. Server SSH Key Handshake
Generate a key directly on your server and link it to GitHub to bypass password prompts:
```bash
ssh-keygen -t ed25519 -C "your_github_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```
*Copy the printed output and save it in **GitHub Settings -> SSH and GPG keys -> New SSH Key**.*

---

## How to Run the Script

Run the execution path from your terminal:
```bash
~/ds1202-project/scripts/sysinfo.sh
```
* Renders a live dashboard report directly on screen.
* Automatically writes a mirrored log file inside `~/ds1202-project/logs/`.

---

## Git Workflow Used

### 1. Initialize & Identify
```bash
cd ~/ds1202-project
git init
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 2. Feature Branching & Commits
```bash
git checkout -b enhance-sysinfo
git add scripts/sysinfo.sh
git commit -m "Enhance script with uptime, load metrics, and logging"
```

### 3. Merge & Secure Push
```bash
git checkout main
git merge enhance-sysinfo
git remote add origin git@github.com:SBLuqman/as02-iib.git
git push -u origin main
```
