;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     haskell
     rust
     racket
     elixir
     scheme
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-tab-key-behavior 'complete)
     better-defaults
     emacs-lisp
     yaml
     git
     markdown
     (clojure :variables
              cljr-warn-on-eval 'nil
              clojure-enable-fancify-symbols t)
     gtags
     html
     javascript
     react
     python
     rust
     ipython-notebook
     (typescript :variables
                 typescript-fmt-on-save t)
     django
     sql
     org
     (c-c++ :variables
            clang-format-style "file"
            c-c++-default-mode-for-headers 'c-mode
            c-c++-enable-clang-support t)
     clojure
     semantic
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables
                     spell-checking-enable-by-default 'nil)
     syntax-checking
     version-control)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(platformio-mode
                                      tern-auto-complete)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(dracula
                         tango-plus
                         monokai
                         darktooth
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `Monaco' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code Retina"
                               :size 12
                               :weight medium
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
(setq exec-path (append exec-path '("/usr/local/bin"))))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;--------------------------;;
  ;; GENERAL CONFIGURATION    ;;
  ;;--------------------------;;

  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (setq powerline-default-separator 'alternate)
  (setq-default evil-insert-state-cursor '(box "red"))
  (require 'helm-bookmark)

  (global-set-key (kbd "C-=") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out)

  ;; web-mode django bracket fix ;;
  ;; (sp-local-pair 'web-mode "<" nil :actions '(:rem insert))
  ;; (sp-local-pair 'web-mode "{" nil :actions '(:rem insert))

  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word))
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "C-w") 'evil-delete-backward-word))

  (setq frame-title-format "spacemacs")

  ;;-----------------------;;
  ;; CLOJURE CONFIGURATION ;;
  ;;-----------------------;;

  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (require 'cider)

  ;; match paredit.vim key-binding
  ;; (define-key evil-normal-state-map ",W" " kw")  ; wrap with ()
  (define-key evil-normal-state-map ",w["        ; wrap with []
    (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "[")))
  (define-key evil-normal-state-map ",w{"        ; wrap with {}
    (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "{")))
  ;; (define-key evil-normal-state-map ",S" " kW")  ; splice, i.e unwrap an sexp
  ;; (define-key evil-normal-state-map ",J" " kJ")  ; join two sexps
  (define-key evil-normal-state-map ",O" 'sp-split-sexp) ; split an sexp
  ;; (define-key evil-normal-state-map ",I" " kr")  ; raise current symbol
  ;; (define-key evil-normal-state-map (kbd ", <up>") " kE") ; splice kill backward
  ;; (define-key evil-normal-state-map (kbd ", <down>") " ke") ; forward
  ;; These are different from vim, here cursor should NOT be on delimits
  ;; (define-key evil-normal-state-map ",>" " ks")  ; forward slurp
  ;; (define-key evil-normal-state-map ",<" " kS")  ; backward slurp


  ;;--------------------------;;
  ;; PROJECTILE CONFIGURATION ;;
  ;;--------------------------;;

  (add-to-list 'projectile-project-root-files "platformio.ini")
  (add-to-list 'projectile-globally-ignored-directories "target")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories ".cljs_rhino_repl")
  (setq projectile-enable-caching t)


  ;;--------------------------;;
  ;; JAVASCRIPT CONFIGURATION ;;
  ;;--------------------------;;

  ;; (add-hook 'javascript-IDE-mode-hook (lambda () (tern-mode t)))
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  ;; (eval-after-load 'js2-mode
  ;;   '(add-hook 'js2-mode-hook
  ;;              (lambda ()
  ;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

  ;; (eval-after-load 'js
  ;;   '(add-hook 'js-mode-hook
  ;;              (lambda ()
  ;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

  ;; (eval-after-load 'json-mode
  ;;   '(add-hook 'json-mode-hook
  ;;              (lambda ()
  ;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

  ;; (eval-after-load 'sgml-mode
  ;;   '(add-hook 'html-mode-hook
  ;;              (lambda ()
  ;;                (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

  ;; (eval-after-load 'web-mode
  ;;   '(add-hook 'web-mode-hook
  ;;              (lambda ()
  ;;                (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
  ;;   '(add-hook 'css-mode-hook
  ;;              (lambda ()
  ;;                (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

  )



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(column-number-mode t)
 '(evil-want-Y-yank-to-eol t)
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format " %3i ")
 '(package-selected-packages
   (quote
    (sesman indium intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode geiser toml-mode racer flycheck-rust cargo rust-mode racket-mode faceup org-mime define-word ghub let-alist pcre2el parent-mode flx eval-sexp-fu spinner bind-map epl omnisharp shut-up csharp-mode org-category-capture json-snatcher json-reformat fringe-helper git-gutter+ pos-tip request-deferred web-completion-data dash-functional peg pythonic ob-elixir flycheck-mix flycheck-credo alchemist elixir-mode deferred seq f s tide typescript-mode spotify helm-spotify multi irony winum unfill madhat2r-theme fuzzy platformio-mode zenburn-theme yaml-mode xterm-color ws-butler which-key web-mode wc-mode use-package ujelly-theme toc-org tao-theme tango-plus-theme sql-indent spacemacs-theme spaceline smeargle rubocop rspec-mode pyvenv pug-mode projectile-rails phpunit persp-mode osx-dictionary orgit org organic-green-theme org-plus-contrib org-download open-junk-file neotree move-text moe-theme markdown-toc markdown-mode live-py-mode link-hint jazz-theme inkpot-theme info+ indent-guide htmlize hide-comnt help-fns+ helm-projectile helm-make helm-gtags helm-gitignore helm-flx helm-c-yasnippet helm-ag gruvbox-theme grandshell-theme gotham-theme go-guru go-eldoc gitattributes-mode git-messenger git-link git-gutter-fringe eyebrowse expand-region exec-path-from-shell evil-surround evil-nerd-commenter evil-mc evil-matchit evil-escape evil-ediff evil-anzu eshell-z ein request dumb-jump drupal-mode dracula-theme darktooth-theme autothemer company-statistics column-enforce-mode color-theme-sanityinc-tomorrow clues-theme clj-refactor clang-format cider clojure-mode chruby bind-key auto-compile packed apropospriate-theme ample-theme alect-themes avy anaconda-mode go-mode iedit smartparens highlight evil flycheck flyspell-correct company helm helm-core multiple-cursors skewer-mode js2-mode simple-httpd magit magit-popup git-commit with-editor alert projectile hydra yasnippet php-mode inf-ruby haml-mode dash auto-complete tern monokai-theme zonokai-theme zen-and-art-theme yapfify window-numbering websocket web-beautify volatile-highlights vi-tilde-fringe uuidgen undo-tree underwater-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tern-auto-complete tangotango-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance srefactor spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rake rainbow-delimiters railscasts-theme queue quelpa pytest pyenv-mode py-isort purple-haze-theme professional-theme powerline popwin popup pony-mode planet-theme pkg-info pip-requirements phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme pbcopy pastels-on-dark-theme paredit paradox osx-trash org-projectile org-present org-pomodoro org-bullets omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mwim mustang-theme multi-term monochrome-theme molokai-theme mmm-mode minitest minimal-theme material-theme majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum log4e livid-mode linum-relative light-soap-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme ir-black-theme inflections ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-mode-manager helm-descbinds helm-css-scss helm-company hc-zenburn-theme gruber-darker-theme goto-chg google-translate golden-ratio gnuplot gntp gitignore-mode gitconfig-mode git-timemachine git-gutter-fringe+ git-gutter gh-md ggtags gandalf-theme flyspell-correct-helm flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-args espresso-theme eshell-prompt-extras esh-help emmet-mode elisp-slime-nav edn django-theme disaster diminish diff-hl darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-go company-c-headers company-anaconda color-theme-sanityinc-solarized coffee-mode cmake-mode clojure-snippets clean-aindent-mode cl-generic cider-eval-sexp-fu cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary async anzu anti-zenburn-theme ample-zen-theme aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "nil" :slant normal :weight normal :height 120 :width normal)))))
