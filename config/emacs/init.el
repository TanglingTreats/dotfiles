(setq custom-file (expand-file-name "~/.config/emacs/custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(setq package-path (expand-file-name "~/.config/emacs/package.el" user-emacs-directory))
(when (file-exists-p package-path)
  (load package-path))

;; Set font
(set-face-attribute 'default nil :family "MononokiNerdFont" :height 120)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

(setq display-line-numbers-type 'visual)
(global-display-line-numbers-mode 1)

(setq column-number-mode t)

;; Backup directory
(setq backup-directory-alist '(("." . "~/.config/emacs/var/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/var/auto-saves/" t)))
;; Create the directories if they don't exist
(make-directory "~/.config/emacs/var/backups/" t)
(make-directory "~/.config/emacs/var/auto-saves/" t)

;; Org Mode
;;(setq org-startup-indented t)

;; Java configuration
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))

;; Golang Org-Babel mode
(require 'ob-go)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((go . t)
   (python . t)
   )
 )

;; Visual fill mode
(global-visual-line-mode 1)

;; Keybindings
(use-package projectile
  :ensure t
  :bind
  (("C-c p f". projectile--find-file)
   ("C-c p o" . projectile-switch-project)))

(global-set-key (kbd "C-<up>") 'scroll-down-line)
(global-set-key (kbd "C-<down>") 'scroll-up-line)

(defun convert-num(num)
  "Convert a decimal or hex number into the other form"
  (interactive "sEnter a number: ")
  (if (string-match-p "^0x[0-9a-fA-F]+$" num)
      (message "%d" (string-to-number (substring num 2) 16)) ;; If number is hex
    (if (string-match-p "^[0-9]+$" num)  ;; If number is decimal
	(message "0x%X" (string-to-number num))
      (message "Input isn't a valid number"))
    )
  )

(global-set-key (kbd "C-c h") 'convert-num)

(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)

;; Set frame fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Set case-insensitive
(setq read-file-name-completion-ignore-case t)

(setq read-buffer-completion-ignore-case t)
