# Development
> Notes for developers


## Image resizing

This project uses the `jekyll-resize` plugin as a filter to resize images to specific sizes.

It is used in `_includes/image-resize.html` file.

Use it like this - including forward slash at the start.

```liquid
{% include image-resize.html
    path='/assets/images/merch/2020/hoodie-black-logo.jpg'
    alt='Hoodie black logo'
    options="550x550>"
%}
```

If you can also use `image.html`, which uses `image-simple.html` and that includes a piece to resize every image, based on the width of the content on the site. That also centers the image.


## Categories

A category can be added to a post like this:

```yaml
categories: shows
```

This means that post gets built to `shows/YYYY/MM/DD/title.html`.

Alongside existing files in `shows`. This is okay.


## Naming

Blog posts in the `_posts` directory must have _hyphens_ and not underscores (snake_case), otherwise they will not be built.

For other pages in this project, underscores are fine and so are used.


## Build times

With all the content to build with `jekyll`, the build times are typically over 50 seconds. That is annoying for making small changes and checking the output quickly. The incremental option can be used, but it is limited - for example a certain blog post's page will be updated but the change will not reflect on the listing of blog posts.

Therefore if you are working on a certain area such as blog posts, temporarily delete most of the items in the press, music and/or shows directory. Then your build time will only be about 2 seconds. Be careful with deleting everything though - if `link` calls in the active section become invalid, the build will fail.

When you are done, do a `git checkout DIR` on that directory to restore the delete files.


## Internal links

Internal links are created using an anchor tag where the `href` value uses a `link` function and the path to the versioned filed. This is useful as it will be replace with the path to the generated file and also will throw an error if the link is broken.

However, running the website of a subpath is not supported by the function and therefore the base URL must be inserted before it.

Update: This is not needed anymore for Jekyll 4.

e.g.

```liquid
{{ site.baseurl }}{% link _pages/shows.md %}

Results in:

/the-buckfever-underground/shows/
```

Unfortunately when referencing an index page, this creates a `/index.html` path rather than just `/` which is a duplicate page reference. But this is fine, as an error will be thrown without `index.md` part and also since the link function does not support replacement of the result value in a chain.

```
{{ site.baseurl }}{% link _music/last-days-of-beautiful/index.md %}

# Results in:
/the-buckfever-underground/music/last-days-of-beautiful/index.html
```

When this is needed to be assigned to a variable or used in an `includes` statement, then use `capture` as shown below. This is necessary since the `link` filter cannot be set to a variable using `assign`. The `capture` approach also means the `append` filter is not needed so the syntax looks cleaner.

```
{% capture album_link %}
   {{ site.baseurl }}{% link _music/last-days-of-beautiful/index.md %}
{% endcapture %}
{{ album_link }}

# Results in:
/the-buckfever-underground/music/last-days-of-beautiful/index.html
```

If the result is capture, then a replace can be done to remove the name and extension.

Perhaps the boilerplate above can be replaced with an includes function.

### Update

A solution to this is to set the **permalink** in the album's metadata.

Setting `/last-days-of-beautiful/` is too short. Since the `/music/` permalink is already set and should not be duplicated, using `/:collection/last-days-of-beautiful/` works wells here. Note the trailing slash is good form. There are of course pages within the as the songs.

Unfortunately, `:title` and `:slug` just give `index` as the result rather than the album folder slug and `:name`, `:basename` and `:path` do not help either.

See [Permalinks](https://jekyllrb.com/docs/permalinks/) Jekyll doc.


## Images

For inserting images with captions, see the image figure function at `_includes/image.html`, which is an image inside a figure. This is used for example on the `_pages/about.md` page.

Example:

```
{% include image.html
    image_path="/assets/images/merch/Last Days book.jpg"
    description="Book of the album's lyrics"
%}
```

If you don't need a frame or caption, use the [image simple](/_includes/image_simple.html) function.

## Emails

Surround an e-mail address in angled brackets to make it a link.

```md
<user@example.com>
```
