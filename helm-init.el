(use-package helm
  :ensure t
  :demand
  :diminish
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
 	 ("C-x C-b" . helm-buffers-list)
	 ("C-x b" . helm-mini)
	 ("C-x c o" . helm-occur)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x r b" . helm-filtered-bookmars))
  :preface (require 'helm-config)
  :config (helm-mode 1))

(use-package helm-themes)
(use-package helm-descbinds)
(helm-descbinds-mode 1)


(setq helm-display-header-line nil)

;; helm always bottom
(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.3)))

