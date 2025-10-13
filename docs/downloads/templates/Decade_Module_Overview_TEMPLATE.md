---
title: "{DECADE} ? Decade Module Overview (TEMPLATE)"
summary: "Use this file to scaffold a new decade module. Replace placeholders, duplicate into /docs/downloads/decades/{DECADE_SLUG}/ and /docs/decades/{DECADE_SLUG}/ as needed."
---

!!! tip "How to use this template"
    1) **Duplicate** this file and rename it to match the target decade (e.g., `1610?1619 Decade Module Overview.md`).
    2) Generate the **matching web pages** in `/docs/decades/{DECADE_SLUG}/` (see quick links below).
    3) Export editable **DOCX** and **PDF** versions for `/docs/downloads/decades/{DECADE_SLUG}/`.
    4) Add links to the decade?s **ReadMe.md** and to the **mkdocs.yml** nav.

## Quick links (update paths after you create the pages)

- **Life & Context ? {DECADE}** ? `docs/decades/{DECADE_SLUG}/{DECADE_SLUG}-life.md`
- **Event Essay A (rename)** ? `docs/decades/{DECADE_SLUG}/EVENT-A.md`
- **Event Essay B (rename)** ? `docs/decades/{DECADE_SLUG}/EVENT-B.md`
- **New Country ? Headcounts & Timeline** ? `docs/decades/{DECADE_SLUG}/{DECADE_SLUG}-NewCountry.md`
- **Old Country ? Drivers & Timeline** ? `docs/decades/{DECADE_SLUG}/{DECADE_SLUG}-OldCountry.md`

## At-a-glance headcounts (replace with specific figures)

- **Region / Polity 1:** ~N people (context)
- **Region / Polity 2:** ~N people (context)
- **Key Settlement(s):** N ? M ? K (note inflection points)
- **Exploration presence:** one ship / small post / none; **no** permanent colony yet (if applicable)

## Timeline ? New World ({DECADE})

- **YYYY** ? Event 1 (1?2 lines; keep concise)
- **YYYY** ? Event 2 ?
- **YYYY** ? Event 3 ?

## Timeline ? Old World ({DECADE})

- **YYYY** ? Driver 1 (war, truce, charter, dynasty change, climate, economy)
- **YYYY** ? Driver 2 ?
- **YYYY** ? Driver 3 ?

## What life felt like (ancestor?s-eye)

Short, sensory snapshots for 2?4 places that matter to your lineages (villages, forts, ports). One sentence each, written in present-tense vivid prose.

## Downloads

- **Overview (PDF)** ? `docs/downloads/decades/{DECADE_SLUG}/{DECADE} Decade Module Overview.pdf`
- **Overview (DOCX)** ? `docs/downloads/decades/{DECADE_SLUG}/{DECADE} Decade Module Overview.docx`

## Cross-references (optional)

- **Podcast / video episodes** that pair with this decade (list titles).
- **Family pages**: link to `/docs/families/...` you expect readers to visit from here.
- **Place pages**: link to `/docs/places/...` you expect readers to visit from here.

## Publish checklist

- [ ] Create `/docs/decades/{DECADE_SLUG}/ReadMe.md` (use decade-folder template)
- [ ] Create `.../{DECADE_SLUG}-life.md` (use life template)
- [ ] Create event essays (2?3 as needed)
- [ ] Create `.../{DECADE_SLUG}-NewCountry.md` and `.../{DECADE_SLUG}-OldCountry.md`
- [ ] Export **DOCX/PDF** downloads to `/docs/downloads/decades/{DECADE_SLUG}/`
- [ ] Update **mkdocs.yml** nav and verify local build (`mkdocs serve`)
- [ ] Deploy (`mkdocs gh-deploy --force` or GitHub Actions)