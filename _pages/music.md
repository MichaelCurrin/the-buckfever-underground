---
title: Music
permalink: /music/

links:
  - name: Band Camp
    url: https://buckfeverunderground.bandcamp.com/
    icon: bandcamp
  - name: Apple Music
    url: https://itunes.apple.com/ca/artist/the-buckfever-underground/265957199
    icon: applemusic
  - name: SoundCloud
    url: https://soundcloud.com/thebuckfeverunderground
    icon: soundcloud
  - name: Spotify
    url: https://open.spotify.com/artist/64CsQDGZFx0ejzIy8VFaI9/discography
    icon: spotify
  - name:  Deezer
    url: https://www.deezer.com/us/artist/566238
  - name: CD Baby
    url: https://store.cdbaby.com/Artist/TheBuckfeverUnderground
---

## Listen

Hear our music online through these channels:

<ul>
{%- for platform in page.links %}
    <li>
        <a href="{{ platform.url }}">
            {% if platform.icon %}
              {%- include icon.html name=platform.icon -%}
            {% endif %}
            {{ platform.name }}
        </a>
    </li>
{% endfor -%}
</ul>


## Discography

See details of some of our albums below, including lyrics and pricing. To buy, see the [Merch]({% link _pages/merch.md %}) page.

<ul>
    {% assign albums = site.music | where: "layout", "album" | sort: 'date' | reverse %}
    {% for album in albums %}
        <li>
            {{ album.date | date: "%Y" }} - <a href="{{ album.url | relative_url }}">{{ album.title}}</a>
        </li>
    {% endfor %}
</ul>

<br>

<div align="center">

{% include image-resize.html
    path='/assets/images/albums/collage-4x4-a.png'
    alt='Collage'
    options="500x500"
%}

<br>
<br>

{% include image-resize.html
    path='/assets/images/albums/collage-4x4-b.png'
    alt='Collage'
    options="500x500"
%}

</div>
