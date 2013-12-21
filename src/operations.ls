# # Curried operations

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
Collection = require './collection'
HashMap = require './hash-map'
List = require './list'
Set = require './set'
Maybe = require 'monads.maybe'
Nothing = Maybe.Nothing!

new_list = (new List)._new
new_map  = (new HashMap)._new
new_set  = (new Set)._new

unwrap = Collection._unwrap
 
export is-list = (a) -> mori.is_list (unwrap a)
export is-seq = (a) -> mori.is_seq (unwrap a)
export is-vector = (a) -> mori.is_vector (unwrap a)
export is-map = (a) -> mori.is_map (unwrap a)
export is-set = (a) -> mori.is_set (unwrap a)
export is-collection = (a) -> mori.is_collection (unwrap a)
export is-sequential = (a) -> mori.is_sequential (unwrap a)
export is-associative = (a) -> mori.is_associative (unwrap a)
export is-counted = (a) -> mori.is_counted (unwrap a)
export is-indexed = (a) -> mori.is_indexed (unwrap a)
export is-reduceable = (a) -> mori.is_reduceable (unwrap a)
export is-seqable = (a) -> mori.is_seqable (unwrap a)
export is-reversible = (a) -> mori.is_reversible (unwrap a)
export is-empty = (a) -> mori.is_empty (unwrap a)

export add = (as, a) --> as._new <| mori.conj as.value, a
export into = (as, bs) --> as.into bs
export associate = (as, k, v) --> as._new <| mori.assoc as.value, k, v
export dissociate = (as, k) --> as._new <| mori.dissoc as.value, k
export empty = (as) -> as.empty!
export get = (as, k) --> mori.get as.value, k, Nothing
export get-in = (as, ks) --> mori.get_in as.value, (unwrap k), Nothing
export has-key = (as, k) --> mori.has_key as.value, k
export find-by-key = (as, k) --> mori.find as.value, k
export nth = (as, n) --> mori.nth as.value, n
export last = (as) ->
                   | is-empty as => Nothing
                   | otherwise   => Maybe.Just <| mori.last as.value
export assoc-in = (as, ks, v) --> as._new <| mori.assoc_in as.value, (unwrap ks), v
export update-in = (as, ks, f) --> as._new <| mori.update_in as.value, (unwrap ks), f
export count = (as) -> mori.count as.value
export peek = (as) -> mori.peek as.value
export pop = (as) -> as._new <| mori.pop as.value
export zip-map = (as, bs) -->  new_map <| mori.zipmap as.value, bs.value
export reverse = (as) -> as._new <| mori.reverse as.value

export slice = (as, start, end) --> as._new <| mori.subvec as.value, start, end

export keys = (as) -> new_list <| mori.keys as.value
export values = (as) -> new_list <| mori.vals as.value

export disjunction = (as) -> new_set <| mori.disj as.value
export union = (as, bs) --> new_set <| mori.union as.value, bs.value
export intersection = (as, bs) --> new_set <| mori.intersection as.value, bs.value
export difference = (as, bs) --> new_set <| mori.difference as.value, bs.value
export is-subset = (as, bs) --> mori.is_subset as.value, bs.value
export is-superset = (as, bs) --> mori.is_superset as.value, bs.value

export first = (as) ->
                    | is-empty as => Nothing
                    | otherwise   => Maybe.Just <| mori.first as.value
export rest = (as) -> as._new <| mori.rest as.value
export seq = (as) -> new_list <| mori.seq (unwrap as)
export cons = (a, as) --> new_list <| mori.cons a, as.value
export concat = (as, bs) --> new_list <| mori.concat as.value, bs.value
export flatten = (as) -> new_list <| mori.flatten as.value
export into-array = (as) -> mori.into_array (unwrap as)
export each = (f, xs) --> mori.each xs.value, f
export map = (f, xs) --> xs.map f
export flat-map = (f, xs) --> xs.chain f
export filter = (f, xs) --> xs._new <| mori.filter f, xs.value
export without = (f, xs) --> xs._new <| mori.remove f, xs.value
export fold-left = (f, b, xs) --> mori.reduce f, b, xs.value
export fold-right = (f, b, xs) --> mori.reduce ((a, b) -> f b, a), b, xs.value
export fold-left-map = (f, b, xs) --> mori.reduce_kv f, b, xs.value
export take = (n, xs) --> xs._new <| mori.take n, xs.value
export take-while = (f, xs) --> xs._new <| mori.take_while f, xs.value
export drop = (n, xs) --> xs._new <| mori.drop n, xs.value
export drop-while = (f, xs) --> xs._new <| mori.drop_while f, xs.value
export some = (f, xs) --> mori.some f, xs.value
export every = (f, xs) --> mori.every f, xs.value
export sort = (f, xs) --> new_list <| mori.sort f, xs.value
export interpose = (x, xs) --> xs._new <| mori.interpose x, xs.value
export interleave = (xs, ys) --> xs._new <| mori.interleave xs.value, ys.value
export iterate = (f, x) --> new_list <| mori.iterate f, x
export repeat = (x) -> new_list <| mori.repeat x
export replicate = (n, x) --> new_list <| mori.repeat n, x
# Just take and stuff
export repeatedly = (f) -> new_list <| mori.repeatedly f
export partition = (n, step, pad, xs) --> new_list <| mori.partition n, step, pad, xs.value
export partition-by = (f, xs) --> new_list <| mori.partition_by f, xs.value
export group-by = (f, xs) --> new_map <| mori.group-by f, xs
