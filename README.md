# Personal Portfolio — GitHub Pages

A simple, clean personal site built with Jekyll + Bootstrap 5. Push to `main` and it publishes automatically.

---

## Quick start

### 1. First-time setup

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
bundle install
bundle exec jekyll serve
```

Open `http://localhost:4000` in your browser.

### 2. Enable GitHub Pages

In your repo on GitHub:
1. Go to **Settings → Pages**
2. Source: **Deploy from a branch**
3. Branch: **main** · Folder: **/ (root)**
4. Click **Save**

Your site will be live at `https://YOUR_USERNAME.github.io/YOUR_REPO/` within a minute or two.

---

## How to personalise

### Change your name, tagline, social links

Edit `_config.yml` — everything at the top. Restart `jekyll serve` after saving.

### Change the colour scheme

Open `assets/css/style.css` and edit the `:root { }` block at the top.
Only these token values need changing — the rest updates automatically:

```css
:root {
  --color-accent:       #2d6a4f;   /* main brand colour */
  --color-accent-light: #d8f3dc;   /* tint used for highlights */
  --color-bg:           #fafaf8;   /* page background */
}
```

### Change the font

In `_layouts/default.html`, swap the Google Fonts URL for any other Google Font pair.
Then update `--font-display` and `--font-body` in `style.css`.

---

## Adding content

### Add a new page

Create a file in `_pages/`:

```
_pages/my-new-page.md
```

With this at the top:

```markdown
---
layout: page
title: My New Page
subtitle: Optional subtitle shown below the title
permalink: /my-new-page/
---

Write your content here in plain Markdown.
```

Then add a link to it in `_includes/nav.html`.

### Add images

Drop image files into `assets/img/` and reference them in Markdown:

```markdown
![Alt text](/assets/img/my-image.jpg)
```

---

## File structure

```
portfolio-site/
├── _config.yml          ← Site settings & metadata
├── _layouts/
│   ├── default.html     ← HTML shell (nav, head, footer)
│   ├── home.html        ← Homepage wrapper
│   └── page.html        ← Standard content page
├── _includes/
│   ├── nav.html         ← Navigation bar
│   └── footer.html      ← Footer + social links
├── _pages/              ← Your content pages (Markdown)
│   ├── about.md
│   ├── work.md
│   └── contact.md
├── assets/
│   ├── css/style.css    ← All styles (edit tokens at top)
│   └── img/             ← Your images go here
├── index.md             ← Homepage
└── Gemfile              ← Ruby deps for local preview
```
