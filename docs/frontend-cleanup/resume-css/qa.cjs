const fs=require('fs');
const assert=require('node:assert/strict');
const {chromium}=require('/Users/pwagstro/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/playwright');
(async()=>{
 const browser=await chromium.launch({headless:true});const page=await browser.newPage();const errors=[];page.on('pageerror',e=>errors.push(e.message));const requests=[];page.on('request',r=>requests.push(r.url()));const report=[];
 const routes=['/resume/','/','/publications/','/research/','/screenshots/','/tutorials/','/tutorials/pygtkmozembed/','/weblog/','/weblog/recent/page/2/','/weblog/2003/05/23/lpdforfunandmp3playing/','/games/','/games/amelias-sea-turtle-adventure/'];
 for(const width of [1440,390])for(const colorScheme of ['light','dark']){
  await page.setViewportSize({width,height:900});await page.emulateMedia({media:'screen',colorScheme});
  for(const route of routes){
   const response=await page.goto('http://127.0.0.1:13139'+route);assert.equal(response.status(),200);await page.evaluate(()=>document.fonts.ready);
   const layout=await page.evaluate(()=>({overflow:document.documentElement.scrollWidth>innerWidth,styles:[...document.querySelectorAll('link[rel=stylesheet]')].map(x=>x.href)}));assert(!layout.overflow,`${route} overflow at ${width}`);assert(!layout.styles.some(x=>/css\/theme\/|bootstrap|jquery/i.test(x)));
   if(route==='/resume/'){
    const geometry=await page.evaluate(()=>{const s=document.querySelector('.resume-sidebar').getBoundingClientRect(),b=document.querySelector('.resume-body').getBoundingClientRect(),a=document.querySelector('.info-links a'),i=a.querySelector('i'),ar=a.getBoundingClientRect(),ir=i.getBoundingClientRect();return {sidebar:s.toJSON(),body:b.toJSON(),icon:i.className,email:a.textContent,contactFits:ar.right<=s.right+1&&ar.left>=s.left-1,iconInline:Math.abs(ar.top-ir.top)<10,phone:!!document.querySelector('.fa-phone')};});
    assert(!geometry.phone);assert(geometry.contactFits);assert(geometry.iconInline);assert.equal(geometry.email,'patrick@wagstrom.net');if(width>991)assert(geometry.body.x>geometry.sidebar.x&&geometry.body.y<geometry.sidebar.bottom);else assert(geometry.body.y>=geometry.sidebar.bottom);
    await page.evaluate(()=>window.print=()=>window.__printCalled=true);await page.locator('button.resume-action').click();assert(await page.evaluate(()=>window.__printCalled));const url=await page.locator('a.resume-action').getAttribute('href');const pdf=await page.request.get(new URL(url,page.url()).href);assert.equal(pdf.status(),200);assert((await pdf.body()).equals(fs.readFileSync('/Users/pwagstro/Documents/workspace/patrick.wagstrom.net/content/resume/wagstrom-resume-20210308.pdf')));
    await page.screenshot({path:`/private/tmp/patrick-resume-evidence/final-${width}-${colorScheme}.png`});
   }
   report.push({route,width,colorScheme,...layout});
  }
 }
 for(const width of [320,820,992]){await page.setViewportSize({width,height:900});await page.goto('http://127.0.0.1:13139/resume/');assert(await page.evaluate(()=>document.documentElement.scrollWidth===innerWidth));}
 await page.setViewportSize({width:1440,height:1000});await page.goto('http://127.0.0.1:13139/resume/');await page.emulateMedia({media:'print',colorScheme:'dark'});
 const print=await page.evaluate(()=>({font:getComputedStyle(document.body).fontSize,line:getComputedStyle(document.body).lineHeight,margin:getComputedStyle(document.body).margin,ligatures:getComputedStyle(document.querySelector('.resume-body')).fontVariantLigatures,hidden:['.pw-top','.pw-footer','.pw-skip','.resume-portrait','.resume-actions','.no-resume'].every(s=>getComputedStyle(document.querySelector(s)).display==='none'),iconsHidden:[...document.querySelectorAll('.info-links i')].every(x=>getComputedStyle(x).display==='none'),layout:getComputedStyle(document.querySelector('.resume-layout')).display}));assert.equal(print.font,'15.7333px');assert.equal(print.line,'19.352px');assert.equal(print.margin,'48px');assert(print.hidden&&print.iconsHidden);assert.equal(print.layout,'block');assert.equal(print.ligatures,'none');
 await page.route('http://127.0.0.1:13139/resume/',route=>route.fulfill({body:fs.readFileSync('/private/tmp/patrick-resume-evidence/phone-build/resume/index.html'),contentType:'text/html'}));await page.emulateMedia({media:'screen',colorScheme:'light'});await page.reload();assert(await page.locator('.info-links .fa-phone').isVisible());await page.emulateMedia({media:'print'});assert(!(await page.locator('.info-links .fa-phone').isVisible()));assert(await page.locator('.info-links .fa-phone').evaluate(i=>!!i.parentElement.textContent.trim()));
 assert(!requests.some(x=>/css\/theme\/|bootstrap|jquery/i.test(x)));assert.deepEqual(errors,[]);fs.writeFileSync('/private/tmp/patrick-resume-evidence/browser-checks.json',JSON.stringify({report,print,phoneToggle:true,errors,frameworkRequests:[]},null,2));console.log(`Passed ${report.length} page/viewport/palette checks, résumé controls, contact alignment, breakpoints, and print rules.`);await browser.close();
})().catch(e=>{console.error(e);process.exit(1)});
