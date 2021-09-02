;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; Lets Modulize an emacs configuration
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  " Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


(setq inhibit-startup-message t)

;; Disable visible bars
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

;; Some gaps in corners
(set-fringe-mode 10)

;; no menu bar
(menu-bar-mode -1)

;; Set up visible bell
(setq visible-bell t)

;; save desktop
(desktop-save-mode 1)

;; use utf-8 encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;; Move custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; font
(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)

;; themesx
;; 'wombat
;; 'tango-dark
;; (load-theme 'zenburn)
(use-package doom-themes
  :init (load-theme 'doom-palenight t))

(use-package magit)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)



;; put all backups into one backup folder
(let ((backup-dir "~/.emacs.d/backups")
      (auto-saves-dir "~/.emacs.d/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks                           
      delete-old-versions t  ; Clean up the backups                             
      version-control t      ; Use version numbers on backups,                  
      kept-new-versions 5    ; keep some new versions                           
      kept-old-versions 2)   ; and some old ones,

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; Initialize use-package on non-Linux platform
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; add use-package
(require 'use-package)
(setq use-package-always-ensure t)

;; turkish mode
(use-package turkish)

;; make mode-line display understandable. Remove some minor mode
(use-package diminish)

;; shows keybindings
(use-package which-key)
(which-key-mode 1)

;; A light that fallows your cursor
(use-package beacon)
(beacon-mode 1)

;; Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; use icon-pack to work with doom-modeline
;; Note that you can load all-the-icons font from github
(use-package all-the-icons)

;; colored delimiters
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package multiple-cursors)
;; When you have an active region that spans multiple lines, the following will
;; add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Pretify help docs
(use-package helpful)
;; treemacs
(use-package treemacs)
;; charp-mode
(use-package csharp-mode)
;; cmake mode
(use-package cmake-mode)


;; helm configuration
(load-user-file "helm-init.el")
;; pdf-tools
(load-user-file "pdf-tools-init.el")
;; lsp
(load-user-file "lsp-mode-init.el")
;; org-mode
(load-user-file "org-mode-init.el")
;; clang forma
(load-user-file "clang-format-init.el")



(message "initialization success")


