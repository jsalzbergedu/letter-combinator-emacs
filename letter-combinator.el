;;; letter-combinator.el --- Combine two letters into a single one to form trickier characters -*- lexical-binding: t -*-

;; Copyright © 2019 Jacob Salzberg

;; Author: Jacob Salzberg <jssalzbe@ncsu.edu>
;; URL: https://github.com/jsalzbergedu/letter-combinator-el
;; Version: 0.1.0
;; Keywords: editing combine combinator

;; This file is not a part of GNU Emacs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; You can use this code like this:
;; (push '("c," . "ç") letter-combinator-combinations)
;; (push '("C," . "Ç") letter-combinator-combinations)

;;; Code:
(require 'subr-x)

;;;###autoload
(defvar letter-combinator-combinations '()
  "Combinations of letters to turn into a single character")

;;;###autoload
(defun letter-combinator-combine ()
  "Combine multiple letters into a single letter"
  (interactive)
  (when-let* ((r-b (region-beginning))
              (r-e (region-end))
              (str (buffer-substring-no-properties r-b r-e))
              (combination (assoc str letter-combinator-combinations))
              (replace-with (cdr combination)))
    (message "str is: %s" str)
    (message "replace-with is: %s" replace-with)
    (delete-region r-b r-e)
    (insert replace-with)))

;;; letter-combinator.el ends here
