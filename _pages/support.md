---
layout: page
title: Support
subtitle: Things you might find useful
permalink: /support/
---

A collection of guides and help articles. Click any topic below to read more.

{% assign support_pages = site.pages
   | where: "category", "support"
   | sort: "title" %}

{% for p in support_pages %}
{% unless p.url == '/support/' %}
- [{{ p.title }}]({{ p.url | relative_url }}){% if p.subtitle %} — *{{ p.subtitle }}*{% endif %}
{% endunless %}
{% endfor %}