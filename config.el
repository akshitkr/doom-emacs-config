;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Akshit Kumar"
      user-mail-address "akshitkumar31102003@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'nil)
(setq doom-font (font-spec :family "SF Mono" :size 15 :weight 'semi-light)
      doom-big-font (font-spec :family "Overpass" :size 15)
      )

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;nyan uwu
(nyan-mode t)
(nyan-start-animation)
(setq nyan-animate-nyancat t)
(setq nyan-animation-nyancat t)
(setq nyan-animation-frame-interval 0.3)
(setq nyan-wavy-trail t)

;;company defaults
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0.2)

;;spotify
(load-file "~/.doom.d/env.el") ;;shhhhh
(setq counsel-spotify-client-id "6d1b54344e304c99bcdef61070f0ce26")
(setq counsel-spotify-client-secret SPOTIFY)

;;shift+arrow key buffer change
(windmove-default-keybindings)


(setq default-directory "~/Documents/code/")


(setq flutter-sdk-path "~/Documents/code/flutter")

(add-to-list 'exec-path "~/Documents/code/flutter")


(setq lsp-dart-flutter-sdk-dir "~/Documents/code/flutter")


(global-set-key (kbd "C-x t j") 'tide-jump-to-definition)
(global-set-key (kbd "C-x t b") 'tide-jump-back)
(global-set-key (kbd "C-x t r") 'tide-references)

(setq live-py-version "python3")
(setq python-shell-interpreter "python3")

(after! flycheck
  (add-to-list 'flycheck-check-syntax-automatically 'idle-change))

;; org stuff

(after! org
  (add-hook! 'org-agenda-mode-hook (lambda () (org-gcal-sync)))
  (add-hook! 'org-capture-after-finalize-hook (lambda () (org-gcal-sync)))

  (global-set-key (kbd "C-c c") 'org-capture)

  (setq org-capture-templates
        '(("a" "Appointment" entry (file  "~/Documents/orgfiles/schedule.org" "Appointments")
           "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
          ("n" "Note" entry (file+headline "~/Documents/orgfiles/notes.org" "Notes")
           "* Note %?\n%T")
          ("l" "Link" entry (file+headline "~/Documents/orgfiles/links.org" "Links")
           "* %? %^L %^g \n%T" :prepend t)
          ("b" "Blog idea" entry (file+headline "~/Documents/orgfiles/i.org" "Blog Topics:")
           "* %?\n%T" :prepend t)
          ("t" "To Do Item" entry (file+headline "~/Documents/orgfiles/i.org" "To Do Items")
           "* %?\n%T" :prepend t)
          ))

(use-package! org-gcal
    :config
    (setq org-gcal-client-id "998776820157-qaod7i0r4r5hg17rj0ch3omj5lh8s6sk.apps.googleusercontent.com"
        org-gcal-client-secret "t2RlVxXNOl1XQQ6E5ufDZIR1"
        org-gcal-file-alist '(("akshitkumar31102003@gmail.com" . "~/Documents/orgfiles/notes.org")))
)

(custom-set-variables
   '(org-directory "~/Documents/orgfiles"))
)

(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %m-%Y"
      org-journal-file-type 'monthly
      org-journal-file-format "%m-%Y.org")

(add-hook! 'web-mode 'skewer-html-mode)

; display battery/time
(display-time-mode)
(display-battery-mode)



(use-package! lsp-ui
  :config
  (lsp-ui-doc-enable t))

(set-frame-parameter (selected-frame) 'alpha '(95 50))


(projectile-register-project-type 'elm '("elm.json")
                                  :project-file "elm.json"
                                  :compile "elm reactor"
                                  :test "elm test"
                                  :run "elm start"
                                  )

(projectile-register-project-type 'npm '("package.json")
                                  :project-file "package.json"
                                  :compile "npm install"
                                  :test "npm test"
                                  :run "npm start"
                                  )

(company-quickhelp-mode)
