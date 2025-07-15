#!/bin/bash

# ---------------------------------------------
# 🧠 Backend Runner Script
# Author: Nethmina Sandaruwan
# ---------------------------------------------

ENV_FILE=".env"
ENV_EXAMPLE_FILE=".env.example"
REQUIREMENTS="requirements.txt"
VENV_DIR=".venv"

# 1. 🛠 Create virtual environment if not exists
if [ ! -d "$VENV_DIR" ]; then
    echo "🔧 Creating virtual environment..."
    python -m venv "$VENV_DIR"
fi

# 2. 🧪 Activate the virtual environment (platform-aware)
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]; then
    source "$VENV_DIR/Scripts/activate"
else
    source "$VENV_DIR/bin/activate"
fi

# 3. 📦 Install dependencies only if not already installed
if [ ! -f "$VENV_DIR/requirements.installed" ] || [ "$REQUIREMENTS" -nt "$VENV_DIR/requirements.installed" ]; then
    echo "📦 Installing Python dependencies from $REQUIREMENTS..."
    pip install --upgrade pip
    pip install -r "$REQUIREMENTS"
    touch "$VENV_DIR/requirements.installed"
fi

# 4. 🔐 Load environment variables
if [ ! -f "$ENV_FILE" ]; then
    if [ -f "$ENV_EXAMPLE_FILE" ]; then
        echo "📄 .env not found. Creating from $ENV_EXAMPLE_FILE..."
        cp "$ENV_EXAMPLE_FILE" "$ENV_FILE"
        echo "✅ .env created. Please update it with your actual values."
    else
        echo "⚠️  No .env or .env.example found! Please create $ENV_FILE manually."
        exit 1
    fi
fi

echo "🔐 Loading environment from $ENV_FILE"
export $(grep -v '^#' "$ENV_FILE" | xargs)

# 5. 🚀 Run FastAPI app
echo "🚀 Starting Backend at http://localhost:8000"
uvicorn app.main:app --reload
