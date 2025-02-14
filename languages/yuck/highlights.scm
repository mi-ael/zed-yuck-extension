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


; Errors

(ERROR) @error

; Comments

(comment) @comment

; Operators

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "||"
  "&&"
  "=="
  "!="
  "=~"
  ">"
  "<"
  ">="
  "<="
  "!"
  "?."
  "?:"
] @operator

(ternary_expression
  ["?" ":"] @operator)

; Punctuation

[ ":" "." "," ] @punctuation.delimiter

[ "{" "}" "[" "]" "(" ")" ] @punctuation.bracket

; Literals

(number (float)) @constant.numeric.float

(number (integer)) @constant.numeric.integer

(boolean) @constant.builtin.boolean

; Strings

(escape_sequence) @constant.character.escape

(string_interpolation
  "${" @punctuation.special
  "}" @punctuation.special)

[ (string_fragment) "\"" "'" "`" ] @string

; Attributes & Fields

(keyword) @attribute

; Functions

(function_call
  name: (ident) @function.call)

; Variables

(ident) @variable

(array
  (symbol) @variable)

; Builtin widgets

(list .
  ((symbol) @tag.builtin
    (#match? @tag.builtin "^(box|button|calendar|centerbox|checkbox|circular-progress|color-button|color-chooser|combo-box-text|eventbox|expander|graph|image|input|label|literal|overlay|progress|revealer|scale|scroll|transform)$")))

; Keywords

; I think there's a bug in tree-sitter the anchor doesn't seem to be working, see
; https://github.com/tree-sitter/tree-sitter/pull/2107
(list .
  ((symbol) @keyword
    (#match? @keyword "^(defwindow|defwidget|defvar|defpoll|deflisten|geometry|children|struts)$")))

(list .
  ((symbol) @keyword.control.import
    (#eq? @keyword.control.import "include")))

; Loop

(loop_widget . "for" @keyword.control.repeat . (symbol) @variable . "in" @keyword.operator . (symbol) @variable)

(loop_widget . "for" @keyword.control.repeat . (symbol) @variable . "in" @keyword.operator)

; Tags

; TODO apply to every symbol in list? I think it should probably only be applied to the first child of the list
(list
  (symbol) @tag)

; Other stuff that has not been catched by the previous queries yet

(ident) @variable
(index) @variable
