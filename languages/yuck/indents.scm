;; The following code is derived from tree-sitter-yuck
;; https://github.com/tree-sitter-grammars/tree-sitter-yuck
;;
;; MIT License
;;
;; Copyright (c) 2023 Philipp Mildenberger, Amaan Qureshi <amaanq12@gmail.com>
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

[
  (ast_block)
  (array)
  (expr)
  (json_array)
  (json_object)
  (parenthesized_expression)
] @indent

; TODO: can't get this to work, goal is to indent at the property ":" prefix
; ((list (identifier) (property)) @aligned_indent
;   (#set! "delimiter" ":"))

[")" "}" "]"] @end

; [ "{" "}" ] @branch

; [ "(" ")" ] @branch

; [ "[" "]" ] @branch
