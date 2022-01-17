---
layout: home
title: The Buckfever Underground
---

{% capture satelliet_url %}
    {% link _music/satelliet/index.md %}
{% endcapture %}

{% capture last_days_url %}
    {% link _music/last-days-of-beautiful/index.md %}
{% endcapture %}

> “Good band, that Buckfever Underground… not a lot of people know that.” – Richard Haslop

{% assign alma_link = "/shows/2021-12-03-alma.html" %}

<div align="center">

{% include image-resize.html
    path='/assets/images/photos/2019/karoo.jpg'
    options='740x740>'
%}

<p><i>In the Karoo during our 2019 tour</i></p>

</div>


## Covid-19 announcement

{% include covid-banner.html %}

Read our [blog post]({% post_url 2020-04-16-show-solidarity %}) about an organization which you can support.


## Upcoming shows

{% assign unix_now = 'now' | date: '%s' | plus: 0 %}
{% assign shows = site.shows | sort: 'date' | reverse %}
{% assign any_shows = false %}

{% for show in shows reversed %}
{% assign post_time = show.date | date: '%s' | plus: 0 %}
{% if post_time >= unix_now %}
**{{ show.date | date: '%F' }}: [{{ show.title }}]({{ show.url | relative_url }})**
{{ show.excerpt }}

{% assign any_shows = true %}
{% endif %}
{% endfor %}

{% unless any_shows %}
No shows scheduled yet. Watch this space and our social media.
{% endunless %}


## Latest album

Our 6-track EP, _Satelliet_, is available as a digital album and as hardcopy.

Praise for our new EP, Satelliet:

> “‘The Buckfever Underground’ have created a work of art that may leave you feeling strong and somewhat mellow, wallowing in the calm after entertaining the demands of chaos.”
>
> – Jodie Reid, Underground Press

Read the review [here]({% link _press/satelliet/index.md %}).

During lockdown in 2020, we recorded this album together without being in the same room. We sent recordings to each other and then mixed them together as full tracks. Listen to it [here]({{ satelliet_url }}).

<div align="center">

{% include image-resize.html
    path="/assets/images/albums/satelliet.jpg"
    target=satelliet_url
    options='500x500>'
%}

</div>


## Recent posts

{% assign posts = site.posts | sort: 'date' | reverse | slice: 0, 3 %}
{% for post in posts %}
- {{ post.date | date: '%F' }}: [{{ post.title }}]({{ post.url | absolute_url }})
{% endfor %}


<div align="center">

{% include image-resize.html
    path="/assets/images/photos/stellenbosch.jpg"
    target=satelliet_url
    options='740x740>'
%}

<p><i>Stellenbosch show in 2019</i></p>

</div>
