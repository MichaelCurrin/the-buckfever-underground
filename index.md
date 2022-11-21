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

{% capture voortvlugtend_url %}
    {% link _music/voortvlugtend/index.md %}
{% endcapture %}

> “Good band, that Buckfever Underground… not a lot of people know that.” – Richard Haslop


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


## Latest releases

### Voortvlugtend

<div align="center">

{% include image-resize.html
    path='/assets/images/albums/voortvlugtend-reduced.jpg'
    target='https://buckfeverunderground.bandcamp.com/album/voortvlugtend'
    options='500x500>'
%}

</div>

Our new album, **Voortvlugtend**, is actually an old album recorded back in November 2013, but, it took us some time to get it out and ready! Better late than never, right...

It features the full 5-member band line-up of that era: Gilad Hockman, Jon Savage, Righard Kapp, Toast Coetzer and Stephen Timm.

You can download it from Bandcamp [here](https://buckfeverunderground.bandcamp.com/album/voortvlugtend) or email us on <info@toastcoetzer.com> if you’d like to order a CD-R copy.

### Satelliet

Our 6-track EP, _Satelliet_, is available as a digital album and as hardcopy.

Praise for Satelliet:

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
