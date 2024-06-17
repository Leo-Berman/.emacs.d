;;;; Necessary emacs to run on install
;; M-x package-install RET flycheck RET
;; M-x flycheck-mode RET

;;; Code:
(add-to-list 'load-path "~/.emacs.d/packages")
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(require 'modeline-region)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; Set tabs to use spaces
 '(setq-default indent-tabs-mode nil)

 ;; Set line numbers to display
 '(global-display-line-numbers-mode 1)

 ;; Enable modeline package deals
 '(global-modeline-region-mode 1)
 '(mlr-column-limit 79)
 
 ;; enables column and line number to display
 '(column-number-mode 1)
 '(line-number-mode 1)

 ;; Set the number to the number of columns to use.
 '(fill-column 79)

 ;; Enable syntax highlighting
 '(global-font-lock-mode 1)
 
 '(inhibit-startup-screen t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))

;; Highlight character at "fill-column" position.
(require 'column-marker)
(set-face-background 'column-marker-1 "red")
(add-hook 'python-mode-hook
          (lambda () (interactive)
            (column-marker-1 fill-column)))

;;; init.el ends here
