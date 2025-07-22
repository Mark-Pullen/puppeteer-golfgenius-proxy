#!/bin/bash

set -e  # ⛑️ exit on any failure

echo "📦 Installing dependencies..."
npm install

echo "🧊 Manually installing Chromium via Puppeteer..."
node node_modules/puppeteer/install.js

echo "✅ Chromium installation script finished!"
