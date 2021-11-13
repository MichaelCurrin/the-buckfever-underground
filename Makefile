default: install

all: install build


h help:
	@grep '^[a-z]' Makefile


.PHONY: hooks
hooks:
	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push

install:
	bundle config set --local path vendor/bundle
	bundle install

upgrade:
	bundle clean
	bundle update


clean:
	# Remove resized images. Optional. Resizing is faster if images already exist.
	rm -rf cache/



s serve:
	bundle exec jekyll serve --trace --livereload

i serve-incr:
	bundle exec jekyll serve --trace  --livereload --incremental


# For FTP.
build: clean
	JEKYLL_ENV=production bundle exec jekyll build --trace
preview:
	cd _site && python3 -m http.server

# For Netlify.
build-remote:
	# Don't use Prod config here until moved to Netlify.
	bundle exec jekyll build --trace
