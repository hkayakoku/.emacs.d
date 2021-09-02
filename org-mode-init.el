;; org-mode configuration
;; how to resize-images-in-org-mode
;; add following line

(use-package hide-mode-line)

(setq org-image-actual-width nil)


(defun efs/presentation-setup ()
  (setq text-scale-mode-amount 3)
  (hide-mode-line-mode 1)
  (org-display-inline-images) ;; Can also use org-startup-with-inline-images
  (text-scale-mode 1))

(defun efs/presentation-end ()
  (hide-mode-line-mode 0)
  (text-scale-mode 0))


(use-package org-tree-slide
  :hook (( org-tree-slide-play . efs/presentation-setup)
         ( org-tree-slide-stop . efs/presentation-end))
  :custom
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header nil)
  (org-image-actual-width nil))


;; close org mode table of contents
(setq org-export-with-toc nil)
(setq org-export-with-title t)

;; syntax highlighter
(setq org-src-fontify-natively t)

(setq org-export-with-sub-superscripts nil)

(defun efs/org-mode-setup()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (whitespace-mode t)
  )

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis "▼"
        org-hide-emphasis-markers t)
   )


(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("☉" "◎" "☉" "◎" "☉" "◎" "☉" "◎" "☉"))
  )



;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


(use-package org-mime)

;; Increase the size of various headings
;; (set-face-attribute 'org-document-title nil :weight 'bold :height 1.3)
;; (dolist (face '((org-level-1 . 1.3)
;;                 (org-level-2 . 1.2)
;;                 (org-level-3 . 1.1)
;;                 (org-level-4 . 1.0)
;;                 (org-level-5 . 1.1)
;;                 (org-level-6 . 1.1)
;;                 (org-level-7 . 1.1)
;;                 (org-level-8 . 1.1)))
;;  (set-face-attribute (car face) nil :weight 'bold :height (cdr face))
;;   )
;; (set-face-attribute (car face) nil :font "Iosevka Aile" :weight 'medium :height (cdr face)))
