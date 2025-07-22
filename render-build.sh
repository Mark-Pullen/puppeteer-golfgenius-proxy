#!/bin/bash

echo "Installing dependencies..."
npm install

echo "Manually installing Chromium..."
node node_modules/puppeteer/install.js
