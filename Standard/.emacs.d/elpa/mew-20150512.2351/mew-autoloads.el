;;; mew-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "mew" "mew.el" (21856 36399 538237 411000))
;;; Generated autoloads from mew.el

(autoload 'mew "mew" "\
Execute Mew first unless Mew is running. And retrieve arrived
messages or just visit to the default folder.

'proto' is determined by 'mew-proto' and 'mew-case'.

If 'proto' is '+' (ie a local folder), a mailbox is determined
according to 'mew-mailbox-type'. Otherwise (ie a remote folder), an
appropriate protocol to retrieve messages is chosen according to
'proto'.

If 'mew-auto-get' is 't', arrived messages are asynchronously fetched
and listed up in Summary mode.

'mew-auto-get' is 'nil', just visit to the folder determined by
'proto'.

When executed with '\\[universal-argument]', 'mew-auto-get' is
considered reversed.

\(fn &optional ARG)" t nil)

(autoload 'mew-send "mew" "\
Execute Mew then prepare a draft. This may be used as library
function.

\(fn &optional TO CC SUBJECT)" t nil)

(autoload 'mew-user-agent-compose "mew" "\
Set up message composition draft with Mew.
This is 'mail-user-agent' entry point to Mew.

The optional arguments TO and SUBJECT specify recipients and the
initial Subject field, respectively.

OTHER-HEADERS is an alist specifying additional
header fields.  Elements look like (HEADER . VALUE) where both
HEADER and VALUE are strings.

A Draft buffer is prepared according to SWITCH-FUNCTION.

CONTINUE, YANK-ACTION and SEND-ACTIONS are ignored.

\(fn &optional TO SUBJECT OTHER-HEADERS CONTINUE SWITCH-FUNCTION YANK-ACTION SEND-ACTIONS &rest DUMMY)" nil nil)

;;;***

;;;### (autoloads nil nil ("auxiliary.el" "mew-addrbook.el" "mew-attach.el"
;;;;;;  "mew-auth.el" "mew-blvs.el" "mew-bq.el" "mew-cache.el" "mew-complete.el"
;;;;;;  "mew-config.el" "mew-const.el" "mew-darwin.el" "mew-decode.el"
;;;;;;  "mew-demo.el" "mew-draft.el" "mew-edit.el" "mew-encode.el"
;;;;;;  "mew-env.el" "mew-exec.el" "mew-ext.el" "mew-fib.el" "mew-func.el"
;;;;;;  "mew-gemacs.el" "mew-header.el" "mew-highlight.el" "mew-imap.el"
;;;;;;  "mew-imap2.el" "mew-key.el" "mew-lang-jp.el" "mew-lang-kr.el"
;;;;;;  "mew-lang-latin.el" "mew-local.el" "mew-mark.el" "mew-message.el"
;;;;;;  "mew-mime.el" "mew-minibuf.el" "mew-mule.el" "mew-mule3.el"
;;;;;;  "mew-net.el" "mew-nntp.el" "mew-nntp2.el" "mew-passwd.el"
;;;;;;  "mew-pgp.el" "mew-pick.el" "mew-pkg.el" "mew-pop.el" "mew-refile.el"
;;;;;;  "mew-scan.el" "mew-search.el" "mew-smime.el" "mew-smtp.el"
;;;;;;  "mew-sort.el" "mew-ssh.el" "mew-ssl.el" "mew-summary.el"
;;;;;;  "mew-summary2.el" "mew-summary3.el" "mew-summary4.el" "mew-syntax.el"
;;;;;;  "mew-thread.el" "mew-unix.el" "mew-vars.el" "mew-vars2.el"
;;;;;;  "mew-vars3.el" "mew-varsx.el" "mew-virtual.el" "mew-win32.el")
;;;;;;  (21856 36402 216973 263000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; mew-autoloads.el ends here
