; Common packages ini =============================================================================
(setq package-list
      '(treemacs
	monokai-theme
	gruvbox-theme))

; Proxy setup =====================================================================================
(setq url-proxy-services '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
			   ("http" . "127.0.0.1:8888")
			   ("https" . "127.0.0.1:8888")
			   ))

; Repository setup ================================================================================
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ( "elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

; Install packages ================================================================================
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; Startup and exit ================================================================================
(setq inhibit-startup-message t)
(setq confirm-kill-emacs 'y-or-n-p)
(desktop-save-mode 1)

; Terminal settings ===============================================================================
(xterm-mouse-mode 1)
(menu-bar-mode -1)

; Type settings ===================================================================================
(electric-pair-mode)

; Theme settings ==================================================================================
(load-theme 'gruvbox-dark-medium t)
(global-display-line-numbers-mode 1)

; Treemacs settings ===============================================================================
(treemacs)
(global-set-key [f12] 'treemacs)
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
(treemacs-git-mode 'deferred)

; Save commands history ===========================================================================
(setq savehist-additional-variables
      '(search-ring regexp-search-ring)
      savehist-file "~/.emacs.d/savehist")
(savehist-mode t)

; Backup settings =================================================================================
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 5   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )
