#!/bin/sh

pandoc --template template/template-manual.latex -V lang=russian -o VR-QuickStart-Rus.pdf 01-engineer-check-list.md 02-engineer-faq-01-network.md 02-engineer-faq-02-camera.md 02-engineer-faq-03-security-center.md 02-engineer-faq-04-private-cloud.md
