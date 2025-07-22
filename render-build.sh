#!/bin/bash

echo "📦 Installing dependencies..."
npm install

echo "🧊 Manually installing Chromium via Puppeteer..."
node <<EOF
  const puppeteer = require('puppeteer');
  (async () => {
    const browserFetcher = puppeteer.createBrowserFetcher();
    const revisionInfo = await browserFetcher.download('1108766');
    console.log('✅ Chromium downloaded to:', revisionInfo.executablePath);
  })();
EOF
