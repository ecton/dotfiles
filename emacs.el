(
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(load-theme 'afternoon t)

;; Configure projectile (ctrl-p)
(setq projectile-enable-caching t)
(setq projectile-keymap-prefix (kbd "C-c C-p"))
(projectile-global-mode)
(projectile-mode)

;; Custom ruby preferences
(setq ruby-deep-indent-paren nil)


;; Whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(indent-guide-global-mode)

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-projectile-on)
(helm-mode)

;; Make symbolic links be followed automatically
(setq vc-follow-symlinks t)


;; Mousing around
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)


;; Lines!
(global-linum-mode)

;; Autosaves should be in a different spot
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; org-mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-directory "~/sync/Dropbox/org/")
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "/home/nilobject/sync/Dropbox/org/inbox.org")
(global-set-key (kbd "C-c o") (lambda () (interactive) (find-file "~/sync/Dropbox/org/inbox.org")))
(global-set-key (kbd "C-c a") `org-agenda)
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/home/nilobject/sync/Dropbox/org/inbox.org" "Inbox")
         "* TODO %?\n  %i\n  %a")))
(defun nilobject/org-reload ()
  (interactive)
  (setq org-agenda-files (append (file-expand-wildcards (concat org-directory "*.org"))
                                 (file-expand-wildcards (concat org-directory "*/*.org"))
                                 (file-expand-wildcards (concat org-directory "*/*/*.org"))))
  (org-mode-restart)
  )
(defun nilobject/meeting ()
  (interactive)
  (let
        ((meeting-topic (read-from-minibuffer "Meeting topic")))
        (find-file (concat
                    "/home/nilobject/sync/Dropbox/org/coreapps/meetings/"
                    (format-time-string "%Y-%m-%d %H%M")
                    meeting-topic
                    ".org"))
        (insert (concat
                 "* "
                 meeting-topic
                 (format-time-string " %Y-%m-%d")
                 "\n** Participants: "
                 "\n** Goal: "))))
(nilobject/org-reload)
(add-hook 'org-mode-hook 'nilobject/org-mode-autosave-settings)
(defun nilobject/org-mode-autosave-settings ()
  (set (make-local-variable 'auto-save-visited-file-name) t)
  (setq auto-save-interval 20)
  (auto-save-mode t))

;; Revert files if they haven't been edited.
(global-auto-revert-mode)

;; Apply theme in daemon mode
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                (load-theme 'afternoon t)))
    (load-theme 'afternoon t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/sync/Dropbox/org/inbox.org" "~/sync/Dropbox/org/personal.org" "~/sync/Dropbox/org/coreapps/babelfish.org" "~/sync/Dropbox/org/coreapps/expenses.org" "~/sync/Dropbox/org/coreapps/general.org" "~/sync/Dropbox/org/coreapps/goexpo.org" "~/sync/Dropbox/org/coreapps/holidays.org" "~/sync/Dropbox/org/coreapps/legend.org" "~/sync/Dropbox/org/coreapps/partners.org" "~/sync/Dropbox/org/coreapps/redmine.org" "~/sync/Dropbox/org/coreapps/upshot.org" "~/sync/Dropbox/org/coreapps/meetings/2015-10-06 1203babelfish.org"))))
