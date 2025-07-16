Here’s a **clean `RUN_INSTRUCTIONS.md`** for your project, covering **Next.js apps, Expo mobile, and FastAPI backend** with the new `run-*.sh` scripts.

---

# 🚀 Running the Monorepo Locally

This monorepo contains:

✅ **Next.js apps** (`apps/web`, `apps/admin`, `apps/landing`)
✅ **Expo mobile app** (`apps/mobile`)
✅ **FastAPI backend** (`backend/`)

Each service has its own run script.

---

## ✅ 1. Prerequisites

Before running, ensure you have installed:

* **Node.js ≥ 20**
* **pnpm ≥ 8**

  ```bash
  npm install -g pnpm
  ```
* **Python ≥ 3.11**
* **Docker (optional)** if you want to use containers
* **Git Bash / WSL (Windows users)** for `.sh` scripts

---

## ✅ 2. Make Run Scripts Executable (First Time Only)

Run this once in the project root:

```bash
chmod +x run-apps.sh run-mobile.sh run-backend.sh
```

> ✅ If you cloned after the scripts were committed with `+x`, you can skip this.

---

## ✅ 3. Running Services

You need **3 terminal tabs** (or windows) for full development.

---

### 🖥 Run Next.js Apps (Web/Admin/Landing)

```bash
./run-apps.sh
```

This will:

1. Run `pnpm install` (workspace-aware)
2. Start all Next.js apps using Turbopack

Runs on:

* **Web** → [http://localhost:3000](http://localhost:3000)
* **Admin** → [http://localhost:3001](http://localhost:3001)
* **Landing** → [http://localhost:3002](http://localhost:3002)

---

### 📱 Run Expo Mobile App

```bash
./run-mobile.sh
```

This will:

1. Run `pnpm install`
2. Start the **Expo DevTools**

Runs on:

* **Expo DevTools** → [http://localhost:19002](http://localhost:19002)

Scan the QR code to open in **Expo Go** on your phone.

---

### 🔧 Run Backend (FastAPI)

```bash
cd backend
./run-backend.sh
```

Runs on:

* **FastAPI backend** → [http://localhost:8000](http://localhost:8000)

---

## ✅ 4. Alternative: Run Everything in Docker

If you want to run all services in Docker:

```bash
docker compose up --build
```

This will start:

* Next.js apps
* Expo
* Backend

---

## ✅ 5. Common Issues

* **Windows cannot run `.sh` scripts?**

  * Use **Git Bash** or **WSL**.
  * Or manually copy the commands inside the script and run them.

* **Lockfile warnings?**

  * Delete `node_modules` and `.pnpm-store`, then:

    ```bash
    pnpm install
    ```

* **Expo can’t find project?**

  * Make sure `apps/mobile/package.json` exists and has a valid `name`.
  * We use `pnpm --filter ./apps/mobile start` to avoid mismatches.

---

## ✅ 6. Typical Workflow

1️⃣ Open **Terminal 1** → `./run-apps.sh`
2️⃣ Open **Terminal 2** → `./run-mobile.sh`
3️⃣ Open **Terminal 3** → `cd backend ./run-backend.sh`

Now you have **All Next.js apps + Expo Mobile App + FastAPI Backend running locally**.
