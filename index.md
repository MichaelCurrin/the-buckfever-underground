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

{% include image.html
    image_path='/assets/images/photos/2019/karoo.jpg'
    description='In the Karoo during the 2019 tour'
%}


## Covid-19 announcement

{% include covid-banner.html %}

Read our [blog post]({% post_url 2020-04-16-show-solidarity %}) about an organization which you can support.


## Upcoming shows

{% assign unix_now = 'now' | date: '%s' | plus: 0 %}
{% assign shows = site.shows | sort: 'date' | reverse %}
{% assign any_posts = false %}

{% for show in shows %}
{% assign post_time = show.date | date: '%s' | plus: 0 %}
{% if post_time >= unix_now %}
- {{ show.date | date: '%F' }}: [{{ show.title }}]({{ show.url | absolute_url }})
{% assign any_posts = true %}
{% endif %}
{% endfor %}

{% unless any_posts %}
No shows scheduled yet. Watch this space and our social media.
{% endunless %}


## Latest album

Praise for our new EP, Satelliet: 

> “‘The Buckfever Underground’ have created a work of art that may leave you feeling strong and somewhat mellow, wallowing in the calm after entertaining the demands of chaos.” – Jodie Reid, Underground Press

Read the review [here]({% link _press/satelliet/index.md %}.

Our new 6-track EP [Satelliet]({{ satelliet_url }}) now is available as a digital album. 

During lockdown in 2020, we recorded this album together without being in the same room. We sent recordings to each other and then mixed them together as full tracks.

{% comment %}
This compresses the image too much.

{% include image-resize.html
    path="/assets/images/albums/satelliet.jpg"
    target=satelliet_url
    options='500x500>'
%}
{% endcomment%}

<div align="center">
    <a href="{{ satelliet_url }}">
        <img src="{% link assets/images/albums/satelliet.jpg %}"
            alt="{{ page.title }} album cover"
            class="medium">
    </a>
</div>
<br>


## Recent posts

{% assign posts = site.posts | sort: 'date' | reverse | slice: 0, 3 %}
{% for post in posts %}
- {{ post.date | date: '%F' }}: [{{ post.title }}]({{ post.url | absolute_url }})
{% endfor %}


{% include image.html
    image_path='/assets/images/photos/stellenbosch.jpg'
    description='Stellenbosch show in 2019'
%}
