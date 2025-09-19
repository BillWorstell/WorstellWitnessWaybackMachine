# Ancestors' Eye — 17th Century

A decade-by-decade, ancestor-centered history of **Virginia**, **New Netherland / Hudson**, and the **Quaker Delaware Valley**.
This repo holds the source Markdown for a print/PDF manuscript *and* a companion website built with **MkDocs + Material**.

## Quick start (local preview)

```bash
python -m pip install mkdocs mkdocs-material
mkdocs serve
```

Then open http://127.0.0.1:8000

## Deploy to GitHub Pages (two options)

### Option A — One command from your machine
```bash
mkdocs gh-deploy --force
```
This builds the site and pushes it to the `gh-pages` branch. In the repo settings, set GitHub Pages to deploy from `gh-pages`.

### Option B — GitHub Actions (auto on every push to `main`)
We included a workflow at `.github/workflows/deploy.yml`. After you push the repo to GitHub, Pages will build automatically and publish.

## Folder layout
```
/docs                 # website & manuscript content
/data                 # CSV data (population estimates etc.)
/figures              # exported charts/maps
/assets               # images, icons
```

## License
- Text and figures: **CC BY 4.0**
- Code snippets and configuration: **MIT**
