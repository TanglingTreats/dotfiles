(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(if (not (package-installed-p 'use-package))
    (package-install 'use-package))
(setq use-package-always-ensure t)
(require 'use-package)

(if (not (package-installed-p 'multiple-cursors))
    (package-install 'multiple-cursors))

(if (not (package-installed-p 'magit))
    (package-install 'magit))
