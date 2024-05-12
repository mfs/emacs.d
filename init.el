;; ui
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)
(fido-vertical-mode)
(load-theme 'wombat)
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
  (package-refresh-contnts))

;; use-package
(require 'use-package)
(setq use-package-always-ensure t)

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
