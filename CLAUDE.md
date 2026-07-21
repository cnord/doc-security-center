# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the documentation repository for **Security Center** (Центр охраны) — security monitoring software by C.Nord. The repo contains user manuals and API documentation written in Markdown, compiled to PDF via Pandoc with LaTeX templates.

## Languages

- `english/` — English user manual and installation guide
- `russian/` — Russian user manual, installation guide, and HTTP API documentation (sections `14-api-*`)
- `spanish/` — Spanish (images only, no content yet)

## Build Commands

Requires **Pandoc** and a LaTeX distribution with Cyrillic support.

Build all documents:
```
bash make-doc.sh
```

Build per-language (run from inside the language directory):
```
cd english && bash make-doc.sh
cd russian && bash make-doc.sh
```

Windows (Russian only):
```
cd russian && make.bat
```

## Output Documents

**English:**
- `SC5-Installation-Eng.pdf` — chapters 01-02
- `SC5-UserManual-Eng.pdf` — chapters 00-13

**Russian:**
- `sc5-installation-rus.pdf` — chapters 01, 02-1, 02-2
- `sc5-usermanual-rus.pdf` — chapters 00-13
- `sc5-http-api-rus_v5.11.pdf` — API docs (chapters 14-01 through 14-13, 15)
- `sc5-http-api-rus_v5.11-neva.pdf` — API docs + Neva appendix (includes 14-api-99-neva.md)

## Document Structure

Chapters are numbered Markdown files (`NN-topic.md`). The ordering matters — Pandoc concatenates them in the order specified in `make-doc.sh`.

Russian installation is split into two parts: `02-1-installation.md` (main) and `02-2-installation_sql.md` (SQL Server setup).

Each language directory contains:
- `template/template.latex` — Pandoc LaTeX template
- `template/pandoc.css` — stylesheet for HTML output
- `title-*.tex` — title page definitions for each PDF
- `img/` — screenshots and diagrams referenced in the Markdown

## Conventions

- Images are stored in `img/` subdirectories and referenced with relative paths
- The LaTeX template handles page layout, fonts, Cyrillic encoding, and PDF compression
- Chapter files use standard Markdown with `#` for top-level headings (one per chapter)
