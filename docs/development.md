# Development instructions

## Naming

Blog posts in the [_posts](/_posts) directory must have hyphens and not underscores, otherwise they will not build. Otherwise, underscores are usually used for filenames in this repo.

## Build times

With all the content to build with `jekyll`, the build times are typically over 50 seconds. That is annoying for making small changes and checking the output quickly. The incremental option can be used, but it is limited - for example a certain blog post's page will be updated but the change will not reflect on the listing of blog posts.

Therefore if you are working on a certain area such as blog posts, temporarily delete most of the items in the press, music and/or shows directory. Then your build time will only be about 2 seconds. Be careful with deleting everything though - if `link` calls in the active section become invalid, the build will fail.

When you are done, do a `git checkout <DIR>` on that directory to restore the delete files.

## Internal links

Internal links are created using an anchor tag where the `href` value uses a `link` function and the path to the versioned filed. This is useful as it will be replace with the path to the generated file and also will throw an error if the link is broken.

However, running the website of a subpath is not supported by the function and therefore the base URL must be inserted before it.

e.g.

```
{{ site.baseurl }}{% link _pages/shows.md %}
# Results in:
/the-buckfever-underground/shows/
```

Unfortunately when referencing an index page, this creates a `/index.html` path rather than just `/` which is a duplicate page reference. But this is fine, as an error will be thrown without `index.md` part and also since the link function does not support replacement of the result value in a chain.

```
{{ site.baseurl }}{% link _music/last_days_of_beautiful/index.md %}

# Results in:
/the-buckfever-underground/music/last_days_of_beautiful/index.html
```

When this is needed to be assigned to a variable or used in an `includes` statement, then use `capture` as shown below. This is necessary since the `link` filter cannot be set to a variable using `assign`. The `capture` approach also means the `append` filter is not needed so the syntax looks cleaner.

```
{% capture album_link %}
   {{ site.baseurl }}{% link _music/last_days_of_beautiful/index.md %}
{% endcapture %}
{{ album_link }}

# Results in:
/the-buckfever-underground/music/last_days_of_beautiful/index.html
```

## Images

For inserting images with captions, see the [image figure](/_includes/image.html) function, which is an image inside a figure. This is used for example on the [about](/_pages/about.md) page.

If you don't need a frame or caption, use the [image simple](/_includes/image_simple.html) function.

## Emails

Surround an e-mail address in angled brackets to make it a link.

```
<user@example.com>
# Results in:
mailto:user@example.com
```