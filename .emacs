(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ange-ftp-binary-file-name-regexp ".*\\.[eE][xX][eE]")
 '(ange-ftp-ftp-program-args (quote ("-i" "-n" "-g" "-v" "-4")))
 '(ange-ftp-passive-host-alist (quote (("hfcp.*" . "on"))))
 '(ange-ftp-try-passive-mode t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "ellemtel") (java-mode . "java") (awk-mode . "awk") (other . "linux"))))
 '(c-offsets-alist (quote ((innamespace . 0))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango)))
 '(diff-default-read-only nil)
 '(ediff-merge-split-window-function (quote split-window-vertically))
 '(ediff-split-window-function (quote split-window-vertically))
 '(grep-command "grep -EHn -e ")
 '(grep-files-aliases
   (quote
    (("asm" . "*.[sS]")
     ("c" . "*.c")
     ("cc" . "*.cc *.cxx *.cpp *.C *.CC *.c++")
     ("cchh" . "*.cc *.[ch]xx *.[ch]pp *.[CHh] *.CC *.HH *.[ch]++")
     ("hh" . "*.hxx *.hpp *.[Hh] *.HH *.h++")
     ("ch" . "*.[ch]")
     ("el" . "*.el")
     ("h" . "*.h")
     ("l" . "[Cc]hange[Ll]og*")
     ("m" . "[Mm]akefile*")
     ("tex" . "*.tex")
     ("texi" . "*.texi")
     ("java" . "*.java"))))
 '(grep-find-command "find . -type f -print0 | xargs -0 -n 30 grep -EHn -e ")
 '(grep-find-ignored-directories (quote (".svn" ".git" ".hg" "{arch}" "obj*")))
 '(grep-find-template
   "find . <X> -type f <F> -print0 | xargs -0 -n 30 grep <C> -EHn -e <R>")
 '(grep-template "grep <C> -EHn -e <R> <F>")
 '(grep-use-null-device nil)
 '(indent-tabs-mode nil)
 '(linum-delay t)
 '(lua-indent-level 4)
 '(python-guess-indent nil)
 '(python-indent-guess-indent-offset nil)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(standard-indent 4)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 52 60)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(transient-mark-mode (quote (only . t)))
 '(whitespace-line-column 160))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 96 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(comint-highlight-prompt ((t (:foreground "brightblue"))))
 '(compilation-info ((((class color) (min-colors 16) (background light)) (:foreground "color-57" :weight bold))))
 '(diff-added ((t (:foreground "color-63" :weight bold))))
 '(diff-removed ((t (:foreground "color-161" :weight bold))))
 '(ediff-current-diff-A ((((class color) (min-colors 16)) (:background "pale green" :foreground "color-88"))))
 '(ediff-current-diff-B ((((class color) (min-colors 16)) (:background "color-220" :foreground "color-54"))))
 '(ediff-even-diff-A ((((class color) (min-colors 16)) (:background "color-248" :foreground "brightwhite"))))
 '(ediff-even-diff-B ((((class color) (min-colors 16)) (:background "color-248" :foreground "brightwhite"))))
 '(ediff-odd-diff-A ((((class color) (min-colors 16)) (:background "color-248" :foreground "brightwhite"))))
 '(ediff-odd-diff-B ((((class color) (min-colors 16)) (:background "color-248" :foreground "brightwhite"))))
 '(font-lock-builtin-face ((t (:foreground "medium slate blue"))))
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face :slant normal)) (((class color) (min-colors 16)) nil)))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:foreground "SlateGray" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "Blue1" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#346604" :weight bold))))
 '(font-lock-string-face ((t (:foreground "DarkSeaGreen4"))))
 '(linum ((t (:inherit (shadow default) :background "ivory2" :foreground "goldenrod" :slant italic))))
 '(whitespace-line ((t (:background "lavender")))))

(setq visible-bell t)

; my directory with extensions
; http://www.emacswiki.org/emacs/LoadPath
(add-to-list 'load-path "~/emacs.d/")

;; http://keramida.wordpress.com/2008/08/08/tweaking-shell-script-indentation-in-gnu-emacs/
(defun steg-setup-sh-mode ()
  "My own personal preferences for `sh-mode'.

This is a custom function that sets up the parameters I usually
prefer for `sh-mode'.  It is automatically added to
`sh-mode-hook', but is can also be called interactively."
  (interactive)
  (setq sh-basic-offset 4
        sh-indentation 4
        ;; Tweak the indentation level of case-related syntax elements, to avoid
        ;; excessive indentation because of the larger than default value of
        ;; `sh-basic-offset' and other indentation options.
        sh-indent-for-case-label 2
        sh-indent-for-case-alt '+)
)
(add-hook 'sh-mode-hook 'steg-setup-sh-mode)

;; Additional modes
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode)) ; Add cmake listfile names to the mode list.
	   '(("\\.cmake\\'" . cmake-mode)) ;  http://www.cmake.org/Wiki/CMake/Editors/Emacs
           '(("\\.pr[io]\\'" . qmake-mode)) ; http://code.google.com/p/qmake-mode/source/browse/qmake.el
     ;; '(("\\.proto\\'" . protobuf-mode)) ; https://github.com/google/protobuf/blob/master/editors/protobuf-mode.el
	   auto-mode-alist))


(autoload 'cmake-mode "cmake-mode" t)
(autoload 'qmake-mode "qmake-mode" t)
(autoload 'iml-mode   "iml-mode" t) ;; my own iml-mode
;;(autoload 'protobuf-mode "protobuf-mode" t)

; andersl-cmake-font-lock - Syntax coloring support for CMake
; https://github.com/Lindydancer/cmake-font-lock
(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)

; Lua mode
; https://github.com/immerrr/lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t) 
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

; subversion mode , http://www.emacswiki.org/emacs/?action=browse;id=SvnStatusMode
;(require 'psvn)

; add keyword to c++ mode
(font-lock-add-keywords 'c++-mode 
 '(("\\<\\(noexcept\\|decltype\\|override\\)" . font-lock-keyword-face)
   ("\\<\\(FIXME\\|TODO\\):" 1 font-lock-warning-face prepend)))

; add keywords to sql-mode
(font-lock-add-keywords 'sql-mode 
 '(("\\<\\(IF\\|DELIMITER\\|CHANGE\\)" . font-lock-keyword-face)))


; C/C++ open corresponding header file
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))


;(load "color-theme")
;(if window-system
;     (color-theme-darkblue2)
;   (color-theme-charcoal-black)
;)

; disable theme background color in terminal
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (progn
      (set-face-background 'default "unspecified-bg" (selected-frame))
      (menu-bar-mode -1)
      ;; Line-Wrap Character
      ;;(set-display-table-slot standard-display-table 'wrap ?\ ) ;; To disable the `\’ character in line wrapping 
      (set-display-table-slot standard-display-table 'wrap ?\↩) ;; use nice unicode bent arow
    )))
(add-hook 'window-setup-hook 'on-after-init)

; define mouse in terminal (-nw)
;(unless (display-graphic-p (selected-frame))
;    (progn
;      (define-key global-map [mouse-4] 'previous-line)
;       (define-key global-map [mouse-5] 'next-line)
;       (require 'xt-mouse)
;       (xterm-mouse-mode)
; ))

(setq inhibit-startup-message t)        ; Disable startup message (buffer *GNU Emacs*)
;(kill-buffer "*Messages*")

;; show line number for each line
(global-linum-mode t)

;; show column
(column-number-mode t)

; HighLight -  each highlighted symbol to automatically use the next face/color from option hlt-auto-face-backgrounds
; In Emacs 24.4, `M-s h .’ will be bound to ‘highlight-symbol-at-point’
(setq hlt-auto-faces-flag t)
;(global-set-key (kbd "M-s h .") 'highlight-symbol-at-point)

; make dabbrev usable for C / C++
(setq dabbrev-case-fold-search t)
(setq dabbrev-case-replace nil)

(load "server")
(unless (server-running-p) (server-start))

;; PuTTY fix.
(define-key global-map [select] 'end-of-line)

;; Prompt Before Closing Emacs
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))
