
# check if a command exists
function command_exists() {
    if command -v "$@" > /dev/null 2>&1 ; then
        true
    elif [ -d "/Applications/$@" ] ; then
        true
    else
        false
    fi
}

# update submodules
function update_git_submodules() {
    pStep "Updating submodules"
    git submodule update --init --recursive
    pStepDone "Submodules updated"
}

# pretty print
function pTitle()     { echo "\033[1m$@\033[0m";  }
function pStep()       { echo "  \033[1;33m➜\033[0m $@"; }
function pStepDone() { echo "  \033[1;32m✔\033[0m $@"; }
function pGood()       { echo "    \033[1;32m✔\033[0m $@"; }
function pBad()        { echo "    \033[1;31m✖\033[0m $@"; }
function pWarning()    { echo "    \033[1;33m⚠︎\033[0m $@"; }

function pTest() {
    pTitle Title
    pStep Step
    pGood Good
    pWarning Warning
    pBad Bad
    pStepDone Step Done
}
