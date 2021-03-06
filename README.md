data.persistent
===============

[![Build Status](https://secure.travis-ci.org/folktale/data.persistent.png?branch=master)](https://travis-ci.org/folktale/data.persistent)
[![NPM version](https://badge.fury.io/js/data.persistent.png)](http://badge.fury.io/js/data.persistent)
[![Dependencies Status](https://david-dm.org/folktale/data.persistent.png)](https://david-dm.org/folktale/data.persistent)
[![experimental](http://hughsk.github.io/stability-badges/dist/experimental.svg)](http://github.com/hughsk/stability-badges)


Algebraic instances for ClojureScript's functional data structures (Mori)


## Example

```js
( ... )
```


## Installing

The easiest way is to grab it from NPM. If you're running in a Browser
environment, you can use [Browserify][]

    $ npm install data.persistent


### Using with CommonJS

If you're not using NPM, [Download the latest release][release], and require
the `data.persistent.umd.js` file:

```js
var persistent = require('data.persistent')
```


### Using with AMD

[Download the latest release][release], and require the `data.persistent.umd.js`
file:

```js
require(['data.persistent'], function(persistent) {
  ( ... )
})
```


### Using without modules

[Download the latest release][release], and load the `data.persistent.umd.js`
file. The properties are exposed in the global `folktale.data.persistent` object:

```html
<script src="/path/to/data.persistent.umd.js"></script>
```


### Compiling from source

If you want to compile this library from the source, you'll need [Git][],
[Make][], [Node.js][], and run the following commands:

    $ git clone git://github.com/folktale/data.persistent.git
    $ cd data.persistent
    $ npm install
    $ make bundle
    
This will generate the `dist/data.persistent.umd.js` file, which you can load in
any JavaScript environment.

    
## Documentation

You can [read the documentation online][docs] or build it yourself:

    $ git clone git://github.com/folktale/data.persistent.git
    $ cd data.persistent
    $ npm install
    $ make documentation

Then open the file `docs/literate/index.html` in your browser.


## Platform support

This library assumes an ES5 environment, but can be easily supported in ES3
platforms by the use of shims. Just include [es5-shim][] :)


## Licence

Copyright (c) 2013 Quildreen Motta.

Released under the [MIT licence](https://github.com/folktale/data.persistent/blob/master/LICENCE).

<!-- links -->
[Fantasy Land]: https://github.com/fantasyland/fantasy-land
[Browserify]: http://browserify.org/
[Git]: http://git-scm.com/
[Make]: http://www.gnu.org/software/make/
[Node.js]: http://nodejs.org/
[es5-shim]: https://github.com/kriskowal/es5-shim
[docs]: http://folktale.github.io/data.persistent
<!-- [release: https://github.com/folktale/data.persistent/releases/download/v$VERSION/data.persistent-$VERSION.tar.gz] -->
[release]: https://github.com/folktale/data.persistent/releases/download/v0.1.0/data.persistent-0.1.0.tar.gz
<!-- [/release] -->
