# Reload zsh configuration
alias reload!='. ~/.zshrc'

# Clear and reset the screen
alias clr="tput reset"

# Restart audio service to fix issues
alias fix-audio="sudo pkill coreaudiod; sudo pkill -9 bluetoothaudiod"

# Flush DNS cache
alias flush="sudo killall -HUP mDNSResponder"

# Remove duplicates in the "Open With" menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Enable/disable Spotlight
alias spot-on="sudo mdutil -a -i on"
alias spot-off="sudo mdutil -a -i off"

# Load .env file
function loadenv() { cat .env | grep -v '^#' | grep -v '^$' | while read a; do export $a; done }


# Aliases here for zsh
# COMMANDS
alias random='openssl rand -base64 32 | pbcopy'

alias s3ltv='s3cmd -c ~/.s3cfg-ltv'
alias s3ofn='s3cmd -c ~/.s3cfg-ofn'
alias zippit="bash ~/Shed/managed-directory-compressor/managed_directory_compressor.sh"
alias affinity="open -a Affinity\ Designer.app"
alias astudio="open -a /Volumes/Oggun/Applications/Android\ Studio.app"

alias bb="open -a BBEdit.app"
alias vsc="open -a Visual\ Studio\ Code.app"
alias pc="open -a PyCharm.app"
#play midi files using Quicktime 7
alias midi="open -a /Applications/Utilities/QuickTime\ Player\ 7.app"
# gsync command: gsutil -m rsync -r Logic gs://mutiny_zoo_jackson_street_qnap_nas_backup/OriginalWork/Logic
alias gsynclogic=gsutil -m rsync -r Logic gs://mutiny_zoo_jackson_street_qnap_nas_backup/OriginalWork/Logic
alias ls='ls -GFh'
alias rmorig='find . -name "*.orig" -print0 | xargs -0 rm -rf'

alias measure="sudo du -hsx * | sort -r | head -10" # measures ten largest dirs in current dir.
alias dkr="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
alias portfix='pkill com.docker.slirp'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias startpsql='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias dockerwp="docker-compose run --rm my-wpcli" #simple docker wordpress
alias wpcli="docker-compose run --rm wp-cli wp" #chris zarate docker
# for plugin: debug-log
alias debugwp='docker-compose exec my-wp tail -10 wp-content/debug.log'
alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed"
alias clients='cd /Volumes/Oggun/Clients'
alias wpcore='wp core install --url="localhost:8080" --title="WordPress" --admin_user="admin" --admin_password="admin" --admin_email="mike@mzoo.org"'
alias vectorize="bash ~/Shed/vectorize.sh"
alias sortbysize="du -ax . | sort -rn | head -20"
alias debugplugin="cp -r ~/Shed/mz-wp-debug-tools ."
alias debugactivate="wp plugin activate mz-wp-debug-tools"
alias xkcd="xkcdpass -n4 -d- | pbcopy"
alias xkcdv="xkcdpass -n4 -d-"
alias thisoldidea="cd /Volumes/Oggun/Original\ Work/RivkaMikeTalks/ThisOldIdea"
alias delicious="echo 89b770ec-ec80-4201-9789-f3a798a810f3 | pbcopy"

# alias svg2png='for FILE in `find . -type f -name "*.svg"`; do FILEBASENAME=$(printf $FILE | cut -d. -f1); FILEEXT=$(printf $FILE | cut -d. -f2); rsvg-convert -h 800 "$FILEBASENAME.$FILEEXT" >> "$FILEBASENAME".png; done'
# find . -type f -name "*.svg" -exec bash -c 'rsvg-convert -h 800 "$0" > "$0".png' {} \;
# find . -type f -name "*.png" -exec bash -c 'rm "$0"' {} \;
# for FILE in `find . -type f -name "*.svg"`; do FILEBASENAME=$(printf "$FILE" | cut -d. -f1); FILEEXT=$(printf "$FILE" | cut -d. -f2); echo "$FILEBASENAME.$FILEEXT"; done
# for FILE in `find . -type f -name "*.svg"`; do FILENAME=$(echo -e "$FILE"); echo "$FILENAME"; done
# for FILE in `find . -type f -name "*.svg"`; do echo -e "$FILE"; done
alias svg3png="find . -type f -name \"*.svg\" -exec echo '{}' +"

# Following for chriszarate Docker compose
alias tests='docker-compose -f docker-compose.phpunit.yml run --rm wordpress_phpunit phpunit'

alias openhere='open -a /Applications/Utilities/Terminal.app .'
alias grepnn="grep -ri --exclude-dir=node_module ."
alias quod="/Volumes/Oggun/Applications/QuodLibet.app/Contents/MacOS/run /Users/mikekilmer/quodlibet/quodlibet/quodlibet.py"

# DIRECTORIES
alias mbo="cd ~/Docker/WP/mzmbo"
alias hymnal="cd ~/Documents/Vault/Hymnal/VolTwo/"

# source: https://dcblog.dev/switching-between-php-versions-with-homebrew
# use it like: `switchphp 7.4`
# may also want to `valet use php@7.3 --force`
# other useful commands:
# ls -1 /usr/local/opt/ | grep php
# print -rl -- ${(k)aliases} ${(k)functions} ${(k)parameters} | grep php
switchphp() {
    brew unlink php && brew link --force --overwrite php@$1
}
