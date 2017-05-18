(setq auto-save-default nil)
(setq make-backup-files nil)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(package-install-selected-packages)

(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))

(require 'neotree)
(add-hook 'after-init-hook #'neotree-startup)
(setq neo-smart-open t)

(require 'expand-region)
(global-set-key (kbd "M-2") 'er/expand-region)

(global-evil-leader-mode)
(global-evil-surround-mode 1)
(require 'evil-surround)

(require 'evil)
(evil-mode 1)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "t" 'neotree-toggle
  "f" 'neotree-find
  "r" 'helm-gtags-find-tag
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "s" 'helm-find
)

(projectile-global-mode)
(setq projectile-switch-project-action 'helm-projectile-find-file)
(helm-projectile-on)
(helm-autoresize-mode 1)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(require 'smartparens-config)

(setq sml/theme 'dark)
(sml/setup)

(require 'rainbow-delimiters)

;; Helm
(require 'helm)
(require 'helm-config)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) 
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'elixir-mode-hook 'helm-gtags-mode)

(setq projectile-switch-project-action 'neotree-projectile-action)

(custom-set-variables
 '(helm-gtags-prefix-key "\C-t")
 '(helm-gtags-suggested-key-mapping t))

(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
  (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))

(load-theme 'base16-eighties t)

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (when (and
    (buffer-live-p buffer)
    (string-match "compilation" (buffer-name buffer))
    (string-match "finished" string)
    (not
      (with-current-buffer buffer
        (goto-char (point-min))
        (search-forward "warning" nil t))))
    (run-with-timer 1 nil
      (lambda (buf)
        (bury-buffer buf)
        (switch-to-prev-buffer (get-buffer-window buf) 'kill))
 buffer)))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(global-set-key (kbd "C-p") 'helm-projectile)

(defun relative-abs-line-numbers-format (offset)
  "The default formatting function. Return the absolute value of OFFSET, converted to string."
  (if (= 0 offset)
    (format " %3d " (line-number-at-pos))
    (format " %2d " (abs offset))))

(setq relative-line-numbers-format 'relative-abs-line-numbers-format)
(global-relative-line-numbers-mode)
