(setq custom-file (expand-file-name "~/.config/emacs/custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(setq package-path (expand-file-name "~/.config/emacs/package.el" user-emacs-directory))
(when (file-exists-p package-path)
  (load package-path))

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq column-number-mode t)

(setq backup-directory-alist '(("." . "~/.config/emacs/var/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/var/auto-saves/" t)))
;; Create the directories if they don't exist
(make-directory "~/.config/emacs/var/backups/" t)
(make-directory "~/.config/emacs/var/auto-saves/" t)

;; Org Mode
;;(setq org-startup-indented t)

;; Java configuration
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))

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
