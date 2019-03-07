; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

; start yasnnipet with emacs
(require 'yasnippet)
(yas-global-mode 1)
(setq-default ac-source '(ac-source-yasnippet))

; disable backup and autosave
(setq backup-inhibited t)
(setq auto-save-default nil)

; define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
; call function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; turn on semantic mode
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(global-ede-mode 1)
(ede-cpp-root-project "cedet project" :file "~/dev/C/cedet/src/main.cpp"
		      :include-path '("../my_inc"))

; fix iedit bug
(define-key global-map (kbd "C-c ;") 'iedit-mode)

; disable this goddamn electric-indent-mode
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

(global-display-line-numbers-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-google-cpplint-command "~/.local/bin/cpplint")
 '(package-selected-packages
   (quote
    (google-c-style iedit auto-complete-c-headers yasnippet-snippets yasnippet auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
