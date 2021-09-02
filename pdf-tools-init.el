;; pdf-tools
(use-package pdf-tools)

(use-package pdf-view-restore
  :ensure t
  :demand t
  :commands (pdf-view-restore)
  :hook ((file-file . pdf-view-restor)
         (pdf-view-mode . pdf-view-restore-mode)))

;; for pdf-view-restore, it supports for opening last know pdf position in
;; pdf view-mode provided by pdf-tools
(add-hook 'pdf-view-mode-hook 'pdf-view-restore-mode)

;; By default, save information will be saved realtive to document
;; change it


;; (setq restore-dir (expand-file-name ".pdf-view-restore" "~"))

(setq pdf-view-restore-filename "~/.emacs.d/pdf-view-restore")
