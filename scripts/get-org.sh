#! /bin/sh -x -u -e
#
# Get latest version of org-mode in ~/git/orgmode.org/org-mode
#

WHERE="${HOME}/.emacs.d/site-lisp"
mkdir -p ${WHERE}
cd ${WHERE}

# pull for first time if we don't have it

if [ ! -d ${WHERE}/org ]; then
    git clone git@gitee.com:cmal/org-mode.git org
else
    # get updates, if any
    cd ${WHERE}/org
    git pull
fi

# build the autoloads
cd ${WHERE}/org
make
make autoloads

# Add to .emacs, .emacs.d/init.el, whatever...
#
#(add-to-list 'load-path "~/git/orgmode.org/org-mode/lisp/")
#(add-to-list 'load-path "~/elisp/orgmodeorg/org-mode/contrib/lisp/" t)
