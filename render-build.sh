#!/bin/bash

# Install dependencies
npm install

# Explicitly trigger Puppeteer to install Chromium
node node_modules/puppeteer/install.js
