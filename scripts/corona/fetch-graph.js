const pupeteer = require('puppeteer');

const graphs = {
  full: {
    confirmed: { selector: '.timeseries .svg-parent:nth-child(1) svg' },
  },
  mini: {
    confirmed: { selector: '.Minigraph .svg-parent:nth-child(1) svg' },
  },
};

const [query = ''] = process.argv.slice(2);

async function main() {
  const b = await pupeteer.launch();
  const p = await b.newPage();

  await p.goto('https://www.covid19india.org/');

  const [type, state] = query.split('.');
  const { selector } = graphs[type][state];

  await p.waitFor(selector);
  await p.waitFor(1000);

  const url = await p.evaluate(selector => {
    const $svg = document.querySelector(selector);

    return $svg.outerHTML.replace(
      '<svg',
      `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve"`,
    );
  }, selector);

  console.log(url);

  await b.close();
};

main();

