bin        = $(shell npm bin)
lsc        = $(bin)/lsc
browserify = $(bin)/browserify
groc       = $(bin)/groc
uglify     = $(bin)/uglifyjs
VERSION    = $(shell node -e 'console.log(require("./package.json").version)')


lib: src/*.ls
	$(lsc) -o lib -c src/*.ls

dist:
	mkdir -p dist

dist/data.persistent.umd.js: compile dist
	$(browserify) lib/index.js --standalone folktale.data.persistent > $@

dist/data.persistent.umd.min.js: dist/data.persistent.umd.js
	$(uglify) --mangle - < $^ > $@

# ----------------------------------------------------------------------
bundle: dist/data.persistent.umd.js

minify: dist/data.persistent.umd.min.js

compile: lib

documentation:
	$(groc) --index "README.md"                                              \
	        --out "docs/literate"                                            \
	        src/*.ls test/*.ls test/specs/**.ls README.md

clean:
	rm -rf dist build lib

test:
	$(lsc) test/tap.ls

package: compile documentation bundle minify
	mkdir -p dist/data.persistent-$(VERSION)
	cp -r docs/literate dist/data.persistent-$(VERSION)/docs
	cp -r lib dist/data.persistent-$(VERSION)
	cp dist/*.js dist/data.persistent-$(VERSION)
	cp package.json dist/data.persistent-$(VERSION)
	cp README.md dist/data.persistent-$(VERSION)
	cp LICENCE dist/data.persistent-$(VERSION)
	cd dist && tar -czf data.persistent-$(VERSION).tar.gz data.persistent-$(VERSION)

publish: clean
	npm install
	npm publish

bump:
	node tools/bump-version.js $$VERSION_BUMP

bump-feature:
	VERSION_BUMP=FEATURE $(MAKE) bump

bump-major:
	VERSION_BUMP=MAJOR $(MAKE) bump


.PHONY: test
