const express = require('express');
const cors = require('cors');
const puppeteer = require('puppeteer');

const app = express();
app.use(cors());

app.get('/api/fetchLeaderboard', async (req, res) => {
  const url = req.query.url;

  if (!url || !url.includes('golfgenius.com')) {
    return res.status(400).json({ error: 'Invalid or unsupported URL' });
  }

  try {
    const browser = await puppeteer.launch({
      headless: 'new',
      args: ['--no-sandbox', '--disable-setuid-sandbox']
    });

    const page = await browser.newPage();
    await page.goto(url, { waitUntil: 'networkidle2' });

    await page.waitForSelector('table');
    const tableHTML = await page.$eval('table', el => el.outerHTML);

    await browser.close();

    res.status(200).send(tableHTML);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Puppeteer failed', details: err.message });
  }
});

const PORT = process.env.PORT || 10000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));