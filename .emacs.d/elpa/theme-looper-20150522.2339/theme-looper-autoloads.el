;;; theme-looper-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "theme-looper" "theme-looper.el" (21856 36362
;;;;;;  334280 195000))
;;; Generated autoloads from theme-looper.el

(autoload 'theme-looper-set-theme-set "theme-looper" "\
Sets the list of color-themes to cycle thru

\(fn THEMES)" nil nil)

(autoload 'theme-looper-set-customizations "theme-looper" "\
Sets customization to be applied after every theme switch

\(fn FUNC)" nil nil)

(autoload 'theme-looper-enable-theme "theme-looper" "\
Enables the specified color-theme

\(fn THEME)" nil nil)

(autoload 'theme-looper-enable-next-theme "theme-looper" "\
Enables the next color-theme in the list

\(fn)" t nil)

(autoload 'theme-looper-enable-random-theme "theme-looper" "\
Enables a random theme from the list

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; theme-looper-autoloads.el ends here
