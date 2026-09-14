# Deploying Seatcheck

The site is one self-contained file. No build step, no dependencies, no server.

    seatcheck-site/
      index.html    the whole tool
      robots.txt
      _headers      security headers (Cloudflare Pages reads this; harmless elsewhere)

## Option A. Cloudflare Pages (recommended, free, no card)

1. Create a free account at https://dash.cloudflare.com/sign-up
2. In the dashboard: Workers & Pages, then Create, then Pages, then
   "Upload assets".
3. Drag the whole `seatcheck-site` folder in. Name the project `seatcheck`.
4. Live in under a minute at `https://seatcheck.pages.dev`.

To redeploy after a change, drag the folder in again, or from this machine:

    npx wrangler pages deploy seatcheck-site --project-name=seatcheck

The first wrangler run opens a browser to authorise. That has to be done by you,
once.

## Option B. GitHub Pages

1. Create a free account at https://github.com/signup
2. New public repository named `seatcheck`.
3. From this folder:

       git init
       git add -A
       git commit -m "Seatcheck"
       git branch -M main
       git remote add origin https://github.com/YOURNAME/seatcheck.git
       git push -u origin main

4. Repository Settings, Pages, Source: `main` branch, root folder.
5. Live at `https://YOURNAME.github.io/seatcheck/` in a couple of minutes.

Set a git identity first if this machine has none:

    git config --global user.name "Your Name"
    git config --global user.email "vinoth1218@gmail.com"

## A custom domain, optional

About Rs 800 a year. `seatcheck.in` or similar. Both hosts above attach a custom
domain for free once you own one. Worth doing before the Reddit post, because a
`.pages.dev` URL reads as temporary and a real domain reads as a product.

## Updating the rules

Everything lives in the `FIRMS` array near the top of the `<script>` block in
index.html. One object per seat. Adding a firm is one more object, no other
change. Keep `ver.date` and `ver.src` truthful, since that is the only reason
anyone trusts the page.
