#!/bin/bash

set -e  # ⛑️ exit on any failure

echo "📦 Installing dependencies..."
npm install

echo "🧊 Manually installing Chromium via Puppeteer..."
node node_modules/puppeteer/install.js

echo "🚀 Manually downloading Chromium rev 1108766..."
node install-chromium.js

echo "✅ Build script completed!"
