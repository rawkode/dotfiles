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

(require 'evil)
(evil-mode 1)

(use-package base16-theme
  :init
  (load-theme 'base16-eighties))

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

