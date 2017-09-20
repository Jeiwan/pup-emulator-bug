const puppeteer = require('puppeteer');
const devices = require('puppeteer/DeviceDescriptors');

let browserArgs = {args: ["--no-sandbox", "--disable-setuid-sandbox"], ignoreHTTPSErrors: true};

(async () => {
  const browser = await puppeteer.launch(browserArgs);
  const page = await browser.newPage();
  await page.emulate(devices['iPhone 6']);
  await page.goto('http://urbandictionary.com', {timeout: 120000});
  await page.screenshot({path: 'output/screenshot.png', fullPage: true});

  await browser.close();
})();
