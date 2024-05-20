;;; init.el --- emacs config

;;; Commentary:

;;; Code:

;; ui
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)
(fido-vertical-mode)
(column-number-mode)
(global-display-line-numbers-mode)

(set-face-attribute 'default nil :font "Iosevka" :height 120)

;; system
(setq make-backup-files nil)
(setq auto-save-default nil)

;; package
(require 'package)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; use-package
(require 'use-package)
(setq use-package-always-ensure t)

;; modus-themes
(use-package modus-themes
  :init
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs t)
  (load-theme 'modus-vivendi-tinted t)
  :config
  (enable-theme 'modus-vivendi-tinted))

;; whitespace
(use-package whitespace
  :ensure nil
  :hook ((prog-mode outline-mode conf-mode) . whitespace-mode)
  :config
  (setq whitespace-line-column fill-column)
  ;(setq whitespace-action '(auto-cleanup))
  (setq whitespace-style '(face trailing indentation empty)))

;; rust
(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook 'eglot-ensure))

;; company
(use-package company
  :config
  (global-company-mode t))

;; magit
(use-package magit)

;; flycheck
(use-package flycheck
  :config
  (global-flycheck-mode)
  (flycheck-define-checker fasm
    "fasm syntax checker"
    :command ("fasm-check" source-inplace)
    :error-patterns
    ((error bol (file-name) " [" line "]: error: " (message) eol))
    :modes asm-mode)
  (add-to-list 'flycheck-checkers 'fasm))

(provide 'init)
;;; init.el ends here
