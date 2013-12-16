#!/bin/sh

pandoc --template template/template-manual.latex -V lang=russian -o VR-QuickStart-Rus.pdf 01-engineer-check-list.md 02-engineer-faq-01.md
