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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;;markdown
     (python :variables
         python-backend 'lsp
         python-lsp-server 'pyls
         tab-width 4
	     python-indent 4
	     python-indent-offset 4
        )
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     ;;(auto-completion :variables
     ;;                auto-completion-tab-key-behavior 'cycle)
     ;; better-defaults
     ;;emacs-lisp
     ;; git
     ;; markdown
     org
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     (spell-checking :variables enable-flyspell-auto-completion nil)
     ;; syntax-checking
     ;; version-control
     (latex :variables
			latex-enable-folding t
			latex-enable-auto-fill nil
			latex-build-command "LaTeX")
	;; https://emacs-china.org/t/topic/3152/19
	 (chinese :variables
			  chinese-enable-fcitx t
			  chinese-fcitx-use-dbus t)
     ;(go :variables go-tab-width 2) ;try
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(langtool evil-vimish-fold) ;lewton
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(smartparens  org-projectile) ;lewton
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(leuven) ;lewton
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 0.5) ;powerline becomes wide after update to emacs27 https://github.com/syl20bnr/spacemacs/issues/13843 but doesn't solve the problem
   dotspacemacs-default-font '("Source Code Pro"
                               :size 38
                               :weight semi-bold
                               :width normal
                               :powerline-scale 1.0)


   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)

   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t ;lewton
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
  (setq-default
   evil-search-module 'evil-search ;lewton
   initial-frame-alist '((left . 10) (top . 0) (width . 120) (height . 30)) ;lewton
   default-frame-alist '((left . 10) (top . 0) (width . 120) (height . 30))) ;lewton
  ;(load-file "/usr/local/Cellar/emacs-plus@27/27.0.91/share/emacs/27.0.91/lisp/simple.elc") ; lewton is it necessary?
  (add-hook 'doc-view-mode-hook 'auto-revert-mode) ;lewton
  (add-hook 'LaTeX-mode-hook 'outline-minor-mode) ;lewton
  (setq mouse-yank-at-point t)
  (eval-after-load 'simple
	;the function below is copied from /usr/share/emacs/27.1/lisp/simple.el.gz and modified
    '(defun shell-command-on-region (start end command
				      &optional output-buffer replace
				      error-buffer display-error-buffer
				      region-noncontiguous-p)
  "Execute string COMMAND in inferior shell with region as input.
Normally display output (if any) in temp buffer `*Shell Command Output*';
Prefix arg means replace the region with it.  Return the exit code of
COMMAND.

To specify a coding system for converting non-ASCII characters
in the input and output to the shell command, use \\[universal-coding-system-argument]
before this command.  By default, the input (from the current buffer)
is encoded using coding-system specified by `process-coding-system-alist',
falling back to `default-process-coding-system' if no match for COMMAND
is found in `process-coding-system-alist'.

Noninteractive callers can specify coding systems by binding
`coding-system-for-read' and `coding-system-for-write'.

If the command generates output, the output may be displayed
in the echo area or in a buffer.
If the output is short enough to display in the echo area
\(determined by the variable `max-mini-window-height' if
`resize-mini-windows' is non-nil), it is shown there.
Otherwise it is displayed in the buffer `*Shell Command Output*'.
The output is available in that buffer in both cases.

If there is output and an error, a message about the error
appears at the end of the output.

Optional fourth arg OUTPUT-BUFFER specifies where to put the
command's output.  If the value is a buffer or buffer name,
erase that buffer and insert the output there; a non-nil value of
`shell-command-dont-erase-buffer' prevent to erase the buffer.
If the value is nil, use the buffer `*Shell Command Output*'.
Any other non-nil value means to insert the output in the
current buffer after START.

Optional fifth arg REPLACE, if non-nil, means to insert the
output in place of text from START to END, putting point and mark
around it.

Optional sixth arg ERROR-BUFFER, if non-nil, specifies a buffer
or buffer name to which to direct the command's standard error
output.  If nil, error output is mingled with regular output.
When called interactively, `shell-command-default-error-buffer'
is used for ERROR-BUFFER.

Optional seventh arg DISPLAY-ERROR-BUFFER, if non-nil, means to
display the error buffer if there were any errors.  When called
interactively, this is t.

Non-nil REGION-NONCONTIGUOUS-P means that the region is composed of
noncontiguous pieces.  The most common example of this is a
rectangular region, where the pieces are separated by newline
characters."
  (interactive (let (string)
		 (unless (mark)
		   (user-error "The mark is not set now, so there is no region"))
		 ;; Do this before calling region-beginning
		 ;; and region-end, in case subprocess output
		 ;; relocates them while we are in the minibuffer.
		 (setq string (read-shell-command "Shell command on region: "))
		 ;; call-interactively recognizes region-beginning and
		 ;; region-end specially, leaving them in the history.
		 (list (region-beginning) (region-end)
		       string
		       current-prefix-arg
		       current-prefix-arg
		       shell-command-default-error-buffer
		       t
		       (region-noncontiguous-p))))
  (let ((error-file
	 (if error-buffer
	     (make-temp-file
	      (expand-file-name "scor"
				(or small-temporary-file-directory
				    temporary-file-directory)))
	   nil))
	exit-status)
    ;; Unless a single contiguous chunk is selected, operate on multiple chunks.
    (if region-noncontiguous-p
        (let ((input (concat (funcall region-extract-function 'delete) "\n"))
              output)
          (with-temp-buffer
            (insert input)
            (call-process-region (point-min) (point-max)
                                 shell-file-name t t
                                 nil shell-command-switch
                                 command)
            (setq output (split-string (buffer-string) "\n")))
          (goto-char start)
          (funcall region-insert-function output))
      (if (or replace
              (and output-buffer
                   (not (or (bufferp output-buffer) (stringp output-buffer)))))
          ;; Replace specified region with output from command.
          (let ((swap (and replace (< start end))))
            ;; Don't muck with mark unless REPLACE says we should.
            (goto-char start)
            (and replace (push-mark (point) 'nomsg))
            (setq exit-status
                  (call-shell-region start end command replace
                                       (if error-file
                                           (list t error-file)
                                         t)))
            ;; It is rude to delete a buffer that the command is not using.
            ;; (let ((shell-buffer (get-buffer "*Shell Command Output*")))
            ;;   (and shell-buffer (not (eq shell-buffer (current-buffer)))
            ;; 	 (kill-buffer shell-buffer)))
            ;; Don't muck with mark unless REPLACE says we should.
            (and replace swap (exchange-point-and-mark)))
        ;; No prefix argument: put the output in a temp buffer,
        ;; replacing its entire contents.
        (let ((buffer (get-buffer-create
                       (or output-buffer "*Shell Command Output*"))))
          (set-buffer-major-mode buffer) ; Enable globalized modes (bug#38111)
          (unwind-protect
              (if (and (eq buffer (current-buffer))
                       (or (memq shell-command-dont-erase-buffer '(nil erase))
                           (and (not (eq buffer (get-buffer "*Shell Command Output*")))
                                (not (region-active-p)))))
                  ;; If the input is the same buffer as the output,
                  ;; delete everything but the specified region,
                  ;; then replace that region with the output.
                  (progn (setq buffer-read-only nil)
                         (delete-region (max start end) (point-max))
                         (delete-region (point-min) (min start end))
                         (setq exit-status
                               (call-process-region (point-min) (point-max)
                                                    shell-file-name t
                                                    (if error-file
                                                        (list t error-file)
                                                      t)
                                                    nil shell-command-switch
                                                    command)))
                ;; Clear the output buffer, then run the command with
                ;; output there.
                (let ((directory default-directory))
                  (with-current-buffer buffer
                    (if (not output-buffer)
                        (setq default-directory directory))
                    (shell-command-save-pos-or-erase)))
                (setq exit-status
                      (call-shell-region start end command nil
                                           (if error-file
                                               (list buffer error-file)
                                             buffer))))
            ;; Report the output.
            (with-current-buffer buffer
              (setq mode-line-process
                    (cond ((null exit-status)
                           " - Error")
                          ((stringp exit-status)
                           (format " - Signal [%s]" exit-status))
                          ((not (equal 0 exit-status))
                           (format " - Exit [%d]" exit-status)))))
            (if (with-current-buffer buffer (> (point-max) (point-min)))
                ;; There's some output, display it
                (progn
                  (display-message-or-buffer buffer)
                  (shell-command-set-point-after-cmd buffer))
            ;; No output; error?
              (let ((output
                     (if (and error-file
                              (< 0 (file-attribute-size
				    (file-attributes error-file))))
                         (format "some error output%s"
                                 (if shell-command-default-error-buffer
                                     (format " to the \"%s\" buffer"
                                             shell-command-default-error-buffer)
                                   ""))
                       "no output")))
                (cond ((null exit-status)
                       (message "(Shell command failed with error)"))
                      ((equal 0 exit-status)
                       ;(message "(Shell command succeeded with %s)" output))
	                (message "%s" (concat (propertize "Done" 'face '(:foreground "white" :background "forest green")) " " output))) ;lewton
                      ((stringp exit-status)
                       (message "(Shell command killed by signal %s)"
                                exit-status))
                      (t
                       (message "(Shell command failed with code %d and %s)"
                                exit-status output))))
              ;; Don't kill: there might be useful info in the undo-log.
              ;; (kill-buffer buffer)
              )))))

    (when (and error-file (file-exists-p error-file))
      (if (< 0 (file-attribute-size (file-attributes error-file)))
	  (with-current-buffer (get-buffer-create error-buffer)
            (goto-char (point-max))
            ;; Insert a separator if there's already text here.
	    (unless (bobp)
	      (insert "\f\n"))
	    ;; Do no formatting while reading error file,
	    ;; because that can run a shell command, and we
	    ;; don't want that to cause an infinite recursion.
	    (format-insert-file error-file nil)
	    (and display-error-buffer
		 (display-buffer (current-buffer)))))
      (delete-file error-file))
    exit-status))
   )
  (add-to-list 'load-path "~/Software/outline-magic")
  (eval-after-load 'outline
  '(progn
    (require 'outline-magic)
    ;(define-key outline-minor-mode-map (kbd "SPC f TAB") 'outline-cycle) ;cannot input space in insert mode
    (define-key evil-normal-state-map (kbd "SPC f TAB") 'outline-cycle)))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'ob-python) ;lewton somehow after update they are not auto loaded, unless set here, have to run org-reload
  (require 'ob-shell) ;lewton
  (require 'simple) ;lewton
  (setq-default 
   select-enable-primary t ;important for linux "selection + middle button"
   mouse-yank-at-point t
   ;;python-pipenv-activate t
   ;auto-completion-tab-key-behavior nil
   ;auto-completion-tab-key-behavior 'cycle
   helm-ff-auto-update-initial-value nil
   org-startup-with-inline-images nil
   org-startup-truncated nil ; to wrap lines in org mode
   org-babel-no-eval-on-ctrl-c-ctrl-c t
   electric-pair-preserve-balance nil
   max-mini-window-height 0 ;I want a new buffer rather than the minibuffer for shell output
   minibuffer-message-timeout 2
   org-return-follows-link nil
   org-src-tab-acts-natively t
   org-src-preserve-indentation t ;for python block
   org-src--tab-width 4
   tab-width 4
   python-indent-guess-indent-offset nil ;orelse tab-width goes wild when there is tab
   indent-tabs-mode t
   ;org-image-actual-width 500
   org-image-actual-width nil
   doc-view-image-width 500
   image-transform-resize 0.5
   evil-ex-search-case "sensitive"
   case-fold-search nil
   helm-case-fold-search nil
   helm-locate-case-fold-search nil
   helm-file-case-fold-search nil
   read-file-name-completion-ignore-case nil
   helm-ff-fuzzy-matching nil
   helm-locate-fuzzy-match nil
   dotspacemacs-helm-use-fuzzy nil
   helm-ff-no-preselect nil 
   pcomplete-ignore-case nil
   scroll-margin 3
   helm-ff-auto-update-initial-value t
   ;shell-command-switch "-ilc" #or '-ic'. not work
   org-file-apps '((auto-mode . emacs)
		("\\.x?html?\\'" . default)
		("\\.pdf\\'" . "evince %s"))

   )
  (defun insert-image-header ()
    (interactive)
       (progn
		(previous-line 1)
        (newline)
        (insert "#+Name:")
        (newline)
        (insert "#+ATTR_ORG: :width 500"))
    )
  (defun org-insert-src-block (src-code-type)
    "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
    (interactive
     (let
         ((src-code-types '("sh" "python" "latex" "quote")))
         ;;(list (ido-completing-read "Source code type: " src-code-types))))
         (list (completing-read "Source code type: " src-code-types))))
         ;;when max-mini-window-height<2 the ido-completing-read doesnot work well, the default completing-read looks better
    (cond
      ((string= src-code-type "python")
       (progn
        (newline)
        (insert (format "#+Name:\n#+BEGIN_SRC %s :results output :export code :tangle no" src-code-type))
        (newline)
        (insert "#+END_SRC\n")
        (previous-line 2)
        (org-edit-src-code)))
	  ((string= src-code-type "sh")
       (progn
										;(newline-and-indent) ;it cause some wired problem adding , to the first line of the following block
         (newline)
         (insert (format "#+Name:\n#+BEGIN_SRC %s :results none" src-code-type))
         (newline)
         (newline)
         (insert (format "%s" "#+END_SRC\n"))
         (previous-line 2)))
      ((string= src-code-type "quote")
       (progn
         (newline)
         (insert "#+BEGIN_QUOTE")
         (newline)
         (newline)
         (insert (format "%s" "#+END_QUOTE\n"))
         (previous-line 2)))
         ;(org-edit-src-code)))
    ))
  (defun insert-Python-import(packages)
    (interactive
	 (let
		 ((packages '("all" "np" "pl" "fits")))
	   (list (completing-read "Modules to import: " packages))
	   ))
	(dolist (element (split-string packages))
      (cond
	   ((string= element "pl")
	    (progn
		  (insert "import pylab as pl"))
		)
	   ((string= element "np")
		(progn
		  (insert "import numpy as np"))
		)
	   ((string= element "fits")
		(progn
		  (insert "from astropy.io import fits"))
		)
	   ((string= element "all")
		(progn
		  (insert "import numpy as np\n")
  		  (insert "import pylab as pl\n")
		  (insert "from astropy.io import fits"))
		)
	   )
	  )
	)
  (defun insert-latex-figure()
    (interactive)
	(insert "\\begin{figure*}[hptb]\n\\centering\n\\includegraphics[width=\\textwidth]{}\n\\caption{\n\\label{fig:}}\n\\end{figure*}")
	)
  (defun openiTerm () ;Mac iTerm2
    (interactive)
	(shell-command "open -a iTerm .")
	)
  (defun runcurrentlineinshell ()
    (interactive)
    (let ((linecmd (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
      (message "%s" (concat (propertize "Running: " 'face '(:foreground "red")) linecmd (propertize " running" 'face '(:foreground "red"))))
      (shell-command linecmd)
      ;(message "%s" (concat (propertize "Done" 'face '(:foreground "white" :background "forest green")) " " linecmd)) ;No, will cover output msg
      ))

  (defun executelinesinshell (beg end)
    "Run current line or selection in shell and insert output."
    (interactive
     (if (use-region-p)
         (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-end-position))))
    (let ((mark  (mark))
        (begin   (save-excursion (goto-char (region-beginning)) (line-beginning-position)))
        (end   (save-excursion (goto-char (region-end)) (line-end-position))))
      (push-mark mark t t)
      (setq deactivate-mark  nil)
    (save-excursion
      ;(unless (bolp) (insert "\n"))
      (message "%s" (propertize " running" 'face '(:foreground "red")))
      (shell-command (buffer-substring-no-properties begin end)))))

  (defun do_region (start end &optional arg)
	(interactive (if current-prefix-arg
					 (list nil nil current-prefix-arg)
				   (list (region-beginning) (region-end) nil)))
	(message start)
	;(count-words start end)
	)


  (defun executecode ()
	;I noticed that in the org sub-editing mode buffer-file-name is nil
    (interactive)
	 (if buffer-file-name
		 (pcase major-mode
		   (`python-mode
			(message "Running...")
			(shell-command (shell-quote-argument buffer-file-name)))
		   (`org-mode
		    (org-babel-execute-src-block))
		   )
	  (progn
	   (org-edit-src-exit)
	   (org-babel-execute-src-block))
	  )
	)

  (defun editcode()
	(interactive)
	(let* ((element (org-element-at-point))
		   (type (org-element-type element)))
		(pcase type
		(`src-block
		 (org-edit-src-code))
		(`keyword
		 (message "include: %s" type)
		 (unless (member (org-element-property :key element)
						 '("INCLUDE" "SETUPFILE"))
		   (user-error "No special environment to edit here"))
		 (let ((value (org-element-property :value element)))
		   (unless (org-string-nw-p value) (user-error "No file to edit"))
		   (let ((file (and (string-match "\\`\"\\(.*?\\)\"\\|\\S-+" value)
							(or (match-string 1 value)
								(match-string 0 value)))))
			 (when (org-file-url-p file)
			   (user-error "Files located with a URL cannot be edited"))
			 (message "lewton: %s" (expand-file-name file)) ;lewton
			 (find-file (expand-file-name file))
			 )))
		))
	)

  ;https://www.emacswiki.org/emacs/ExecPath
  (defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.  This is particularly useful under Mac OS X and macOS, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

  (set-exec-path-from-shell-PATH )

  (defun get-key-combo (key)
	"Just return the key combo entered by the user"
	(interactive "kKey combo: ")
	key)
  (defun keymap-unset-key (key keymap)
    "Remove binding of KEY in a keymap
    KEY is a string or vector representing a sequence of keystrokes."
    (interactive
     (list (call-interactively #'get-key-combo)
           (completing-read "Which map: " minor-mode-map-alist nil t)))
    (let ((map (rest (assoc (intern keymap) minor-mode-map-alist))))
      (when map
        (define-key map key nil)
        (message  "%s unbound for %s" key keymap))))


  ;;https://emacs.stackexchange.com/questions/35946/strange-behaviour-on-evil-delete
  (defun stop-using-minibuffer ()
    "kill the minibuffer"
    (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
      (abort-recursive-edit)))
  (add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
  ;(add-hook 'hack-local-variables-hook 'spacemacs/toggle-truncate-lines-off)
  (spacemacs/toggle-truncate-lines-off)
  (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-off) ;; Visual line navigation for textual modes


  ;;https://stackoverflow.com/questions/25161792/emacs-org-mode-how-can-i-fold-everything-but-the-current-headline
  (defun org-show-current-heading-tidily ()
	"Show next entry, keeping other entries closed."
    (interactive)
	(if (save-excursion (end-of-line) (outline-invisible-p))
		(progn (org-show-entry) (show-children))
	  (outline-back-to-heading)
	  (unless (and (bolp) (org-on-heading-p))
		(org-up-heading-safe)
		(hide-subtree)
		(error "Boundary reached"))
	  (org-overview)
	  (org-reveal t)
	  (org-show-entry)
	  (show-children)))

  ;; https://github.com/cute-jumper/fcitx.el
  ;(setq fcitx-active-evil-states '(insert emacs hybrid)) ; if you use hybrid mode
  ;(fcitx-aggressive-setup)
  ;(fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs
  (setq ns-pop-up-frames nil) ; to stop Mac "open" open two windows
  (setq helm-ff-auto-update-initial-value t)

  (define-key evil-insert-state-map (kbd "C-a") nil) ;evil-paste-last-insertion
  (define-key evil-insert-state-map (kbd "C-d") nil) ;evil-shift-left-line
  (define-key evil-insert-state-map (kbd "C-e") nil) ;evil-copy-from-below
  (define-key evil-insert-state-map (kbd "C-k") nil) ;evil-insert-digraph
  (define-key evil-insert-state-map (kbd "C-n") nil) ;evil-complete-next
  (define-key evil-insert-state-map (kbd "C-o") nil) ;evil-execute-in-normal-state
  (define-key evil-insert-state-map (kbd "C-p") nil) ;evil-complete-previous
  (define-key evil-insert-state-map (kbd "C-r") nil) ;evil-paste-from-register
  (define-key evil-insert-state-map (kbd "C-t") nil) ;evil-shift-right-line
  (define-key evil-insert-state-map (kbd "C-w") nil) ;evil-delete-backward-word
  (define-key evil-insert-state-map (kbd "C-x") nil) ;Prefix Command
  (define-key evil-insert-state-map (kbd "C-y") nil) ;evil-copy-from-above
  (define-key evil-insert-state-map (kbd "C-z") nil) ;evil-emacs-state


  ;(define-key org-mode-map (kbd "RET") 'evil-next-line-first-non-blank) ;Wrong. In insert mode, it will go to next line instead of inserting newline
  ;(define-key evil-org-mode-map (kbd "RET") nil)
  ;(define-key evil-org-mode-map (kbd "RET") 'evil-next-line-first-non-blank) ;Wrong. In insert mode, it will go to next line instead of inserting newline

  ;these work fine
  ;(define-key evil-normal-state-map (kbd "RET") nil)
  ;(define-key evil-normal-state-map (kbd "RET") 'evil-next-line-first-non-blank)
  ;(define-key org-src-mode-map (kbd "RET") nil)
  ;(define-key org-src-mode-map (kbd "RET") 'evil-next-line-first-non-blank)
  ;(define-key spacemacs-org-mode-map (kbd "RET") nil)
  ;(define-key spacemacs-org-mode-map (kbd "RET") 'evil-next-line-first-non-blank)
  ;but the following solution is better
  (evil-define-key 'normal evil-org-mode-map (kbd "RET") 'evil-next-line-first-non-blank)
  (evil-define-key 'insert evil-org-mode-map (kbd "RET") nil)

  ;(define-key helm-find-files-map (kbd "C-i") 'helm-ff-TAB) ?
  (define-key evil-normal-state-map (kbd ", i i") 'org-insert-src-block)
  (define-key evil-normal-state-map (kbd ", i e") 'org-edit-src-code)
  (define-key evil-normal-state-map (kbd ", i h") 'insert-image-header)
  (define-key evil-normal-state-map (kbd ", i p") 'insert-Python-import)
  (define-key evil-normal-state-map (kbd ", i f") 'insert-latex-figure)
  (define-key evil-normal-state-map (kbd "SPC d") 'org-toggle-inline-images)
  (define-key evil-normal-state-map (kbd "SPC t t") 'org-toggle-latex-fragment)
  (define-key evil-normal-state-map (kbd ".") nil)
  (define-key evil-normal-state-map (kbd ". s") 'org-insert-src-block)
  (define-key evil-normal-state-map (kbd ". e") 'editcode)
  (define-key evil-normal-state-map (kbd ". h") 'insert-image-header)
  (define-key evil-normal-state-map (kbd ". c") 'runcurrentlineinshell)
  (define-key evil-normal-state-map (kbd ". l") 'executelinesinshell)
  (define-key evil-normal-state-map (kbd "SPC t e") 'openiTerm)
  (define-key evil-normal-state-map (kbd "SPC a o p") 'org-priority)
  ;(define-key evil-normal-state-map (kbd ". r") 'org-babel-execute-src-block)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "q") 'spacemacs/delete-window)
  (define-key evil-normal-state-map (kbd ". g") 'cd)
  (define-key evil-normal-state-map (kbd "SPC \\") 'org-toggle-pretty-entities)
  (define-key evil-normal-state-map (kbd ". u") 'org-babel-goto-src-block-head)
  (define-key evil-normal-state-map (kbd "s-j") nil)
  (define-key evil-normal-state-map (kbd "s-k") nil)
  (define-key evil-normal-state-map (kbd "s-j") 'evil-scroll-page-down)
  (define-key evil-normal-state-map (kbd "s-k") 'evil-scroll-page-up)
  (define-key evil-normal-state-map (kbd ". r") 'executecode)
  (define-key evil-normal-state-map (kbd ". TAB") 'org-show-current-heading-tidily)
  (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt) ;doesn't work well
  (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "C-t") nil)
  (define-key global-map (kbd "C-t") nil)
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  ;(remove-hook 'latex-mode-hook #'spacemacs/toggle-auto-fill-mode-on)
  (add-hook 'latex-mode-hook #'spacemacs/toggle-auto-fill-mode-off)
  (add-hook 'org-mode-hook #'spacemacs/toggle-auto-fill-mode-off)
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w"))) ;; For all programming modes
  (add-hook 'org-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'org-mode-hook #'(lambda () (modify-syntax-entry ?. "w"))) ;;Character considered as part of a word
  (defalias 'forward-evil-word 'forward-evil-symbol)
  (with-eval-after-load "ispell"
    ;(setq ispell-program-name "hunspell")
    ;; ispell-set-spellchecker-params has to be called
    ;; before ispell-hunspell-add-multi-dic will work
    ;(ispell-set-spellchecker-params)
    ;(ispell-hunspell-add-multi-dic "pl_PL,en_GB")
    ;(setq ispell-dictionary "pl_PL,en_GB")
    (setq ispell-personal-dictionary "/home/lewton/.emacs.d/lewton.dictionary")
  )
  ; dummy silence definition
  (defun silence () (interactive))
  ; don't jump the cursor around in the window on clicking
  (define-key evil-motion-state-map [down-mouse-1] 'silence)
  ; also avoid any '<mouse-1> is undefined' when setting to 'undefined
  ;(define-key evil-motion-state-map [mouse-1] 'silence)
)


;I don't know if the following need to be reset
;(custom-set-variables
; '(safe-local-variable-values
;   '((eval spacemacs/toggle-auto-fill-mode-off)
;	 (eval spacemacs/toggle-visual-line-navigation-on)))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; '(font-latex-sectioning-2-face ((t (:background "#F0F0F0" :foreground "#3C3C3C" :weight bold :height 1.3))))
; '(font-latex-sectioning-3-face ((t (:background "#E5F4FB" :foreground "#123555" :weight bold :height 1.0))))
; '(org-level-1 ((t (:background "#F0F0F0" :foreground "#3C3C3C" :weight bold :height 1.3))))
; '(org-level-2 ((t (:background "#E5F4FB" :foreground "#123555" :weight bold :height 1.0)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
	  "dvi2tty")
	 ((output-dvi style-pstricks)
	  "dvips and gv")
	 (output-dvi "xdvi")
	 (output-pdf "Okular")
	 (output-html "xdg-open")))
 '(evil-want-Y-yank-to-eol nil)
 '(mouse-wheel-mode nil)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-format-latex-options
   '(:foreground default :background default :scale 3 :html-foreground "Black" :html-background "Transparent" :html-scale 2.0 :matchers
				 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-src-window-setup 'current-window)
 '(package-selected-packages
   '(pyim xr pangu-spacing find-by-pinyin-dired fcitx ace-pinyin pinyinlib flyspell-correct-popup flyspell-popup yapfify xterm-color ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline shell-pop restart-emacs request rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree multi-term move-text lorem-ipsum live-py-mode linum-relative link-hint langtool indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio gnuplot flyspell-correct-helm flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-vimish-fold evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help dumb-jump diminish define-word cython-mode column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-dictionary auctex anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-2-face ((t (:background "#F0F0F0" :foreground "#3C3C3C" :overline nil :weight bold :height 1.3))))
 '(font-latex-sectioning-3-face ((t (:background "#E5F4FB" :foreground "#123555" :overline nil :weight bold :height 1.0)))))
