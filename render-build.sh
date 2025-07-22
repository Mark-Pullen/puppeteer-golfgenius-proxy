#!/bin/bash

echo "Installing dependencies..."
npm install

echo "Manually installing Chromium..."
npx puppeteer install
