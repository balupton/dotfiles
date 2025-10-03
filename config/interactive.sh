#!/usr/bin/env sh
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

# Dorothy
alias d='dorothy'
export DOROTHY_THEME='oz'

# Bottom
# alias btm='btm --color default-light'

# Go
# alias go-open='open -a /Applications/GoLand.app .'

# Screensaver
alias screensaver='open -a ScreenSaverEngine'

# Highlight clipboard code as RTF for keynote
# styles: https://help.farbox.com/pygments.html
alias highlight="pbpaste | pygmentize -g -f rtf -O 'fontface=Monaco,style=tango' | pbcopy"

# Database
# alias startredis='redis-server /usr/local/etc/redis.conf'
# alias startmongo='mongod --config /usr/local/etc/mongod.conf'

# Wget, consider also using: --no-check-certificate
# Wget: brute-leech as GoogleBot
alias wgetbot='wget -t 2 -T 15 --waitretry 10 -nc --user-agent="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"'
# Wget: slow-leach as Firefox with 120 seconds timeout
alias wgetff='wget -t 2 -T 15 --waitretry 10 -nc -w 120 --user-agent="-user-agent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6""'

# Administration
# alias svnshowexternals='svn propget -R svn:externals .'
# alias search='find . -name'
# alias filecount='find . | wc -l'

# Git
alias ga='git add'
alias gu='git add -u'
alias gp='git push'
alias gl='git log'
alias gs='git status; git diff --no-patch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git add . && git commit -am' # 'git add . && git add -u && git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gpo='gp origin; gp origin --tags'
alias gup='git pull origin'
alias gap='git remote | xargs -L1 git push'
alias git-optimise='rm -rf -- .git/refs/original; git reflog expire --expire=now --all; git gc --prune=now; git gc --aggressive --prune=now'
alias git-wipe='git reset --hard; git clean -f'
alias git-hooks='edit .git/hooks/pre-commit'
alias git-up='git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref HEAD) $(git rev-parse --abbrev-ref HEAD); git pull --rebase --autostash'

# Remove Elgato Stream Deck logs as they baloon to 100GB within a week
rm -rf "$HOME/Library/Logs/ElgatoStreamDeck" || true

# Renive other logs that also baloon
rm -rf "$HOME/Library/Logs/ESDZoom" || true
