This package provides 6 highly customizable color themes (light, dark
and black) for GNU Emacs 24 or later.  These themes are intended to
be used with GUI, so only graphical terminals are supported by
default.  However you can "enable" the themes for other terminals
with `alect-display-class' variable.

You can install the package from MELPA.  If you prefer the manual
installation, put these lines into your init-file:
  (add-to-list 'load-path "/path/to/alect-themes")
  (add-to-list 'custom-theme-load-path "/path/to/alect-themes")

If you also want to enable a theme on Emacs start, use this:
  (load-theme 'alect-light t)

Ways for configuring the themes:

1. Modifying color palette for the themes - by customizing
   `alect-colors' variable.  You may use `alect-generate-colors' to
   redefine the whole variable (see the code) or `alect-set-color' to
   modify specified colors.

2. Overriding face specification.  You can change the look of
   particular faces by setting `alect-overriding-faces' variable.

3. Above that, the inverted color themes (`alect-light-alt' and
   `alect-dark-alt') can be configured with
   `alect-inverted-color-regexp' variable.

For full description and some screenshots, see
<http://github.com/alezost/alect-themes>.
All screenshots can be found at <http://imgur.com/a/eBx96>.
