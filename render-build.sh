#!/bin/bash

# Force Puppeteer to download Chromium manually during Render build
npm install
npx puppeteer browsers install chromium
