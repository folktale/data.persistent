# # Base collection

/** ^
 * Copyright (c) 2013 Quildreen Motta
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

mori = require 'mori'

module.exports = \
class Collection
  ->

  _is-mori-collection: true
  _unwrap: (a) ->
    if a._is-mori-collection => a.value
    else                     => a

  # ### Constructors
  _new: (_) -> ...
  from: (_) -> ...
  into: (a) -> @_new <| mori.into @empty!value, a

  # ### Semigroup
  concat: (b) -> @_new <| mori.concat @value, b.value

  # ### Monoid
  empty: -> @_new <| mori.empty @value

  # ### Functor
  map: (f) -> @_new <| mori.map f, @value

  # ### Applicative
  @of = (a) -> new this().of a
  of: (a) -> @_new <| mori.conj @empty!value, a

  ap: (b) -> @chain (f) -> mori.map f, b.value

  # ### Chain
  chain: (f) -> @_new <| mori.mapcat f, @value

  # ### Show
  to-string: -> String @value

  # ### Eq
  is-equal: (b) -> mori.equals @value, b.value

  # ### Hashable
  hash: -> mori.hash @value  
