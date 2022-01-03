;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ray Andrew"
      user-mail-address "contact@rayandrew.me")

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
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-tomorrow-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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


(after! evil-escape (evil-escape-mode -1))

;; for better navigation in word wrap
(setq evil-respect-visual-line-mode t)

;; org-journal
(setq org-journal-dir "~/journals")

;; org-roam

(setq org-roam-completion-everywhere t)
(use-package! md-roam ; load immediately, before org-roam
  :after org-roam
  :config
  (setq org-roam-directory (file-truename "~/kb"))
  (setq org-roam-capture-template "~/kb")
  (setq org-roam-file-extensions '("org" "md"))
  (md-roam-mode 1)
  (setq md-roam-file-extension-single "md")
  (org-roam-db-autosync-mode 1)
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "${slug}.md"
                              "---\ntitle: ${title}\nid: %<%Y-%m-%dT%H%M%S>\ncategory: \n---\n")
           :unnarrowed t))))
;; (setq org-roam-directory "~/kb")
;; (setq org-roam-capture-templates
;;  '(("d" "default" plain "%?"
;;     :target (file+head "${slug}.org"
;;                        "#+title: ${title}\n")
;;     :unnarrowed t)))



;; org-roam timestamp
(setq org-roam-timestamps-parent-file t)

;; org-journal
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-enable-agenda-integration t)
(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
    (pcase org-journal-file-type
      (`daily "#+TITLE: Daily Journal\n#+CATEGORY: journal\n#+STARTUP: showeverything")
      (`weekly "#+TITLE: Weekly Journal\n#+CATEGORY: journal\n#+STARTUP: folded")
      (`monthly "#+TITLE: Monthly Journal\n#+CATEGORY: journal\n#+STARTUP: folded")
      (`yearly "#+TITLE: Yearly Journal\n#+CATEGORY: journal\n#+STARTUP: folded"))))

(setq org-journal-file-header 'org-journal-file-header-func)
