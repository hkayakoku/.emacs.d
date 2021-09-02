;;; package -- Sample

;; lsp dependencies
(use-package company)
(use-package yasnippet)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-clients-clangd-executable "D:\\Apps\\MinGW\\MinGW\\bin\\clangd.exe")
  :config
  (lsp-enable-which-key-integration t))

(use-package flycheck)

(global-flycheck-mode)


