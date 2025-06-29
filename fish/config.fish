# Set oh my posh theme, change the omp.json part to change theme

oh-my-posh init fish --config $HOME/.poshthemes/star.omp.json | source

# Set up fzf key bindings
fzf --fish | source

##
## PATH
##

alias cdhtml="cd /opt/lampp/htdocs" # Open Xampp site folder

alias cdconf="cd ~/.config" # Open .config folder

alias cddev="cd ~/Documents/dev" # Open dev folder

alias cdgv="cd ~/Documents/dev/projects/Gameverse" # Open gameverse project

alias cdpy="cd ~/Documents/dev/python" # go to python dir

alias cdproj="cd ~/Documents/dev/projects" # go to project folder

alias cddwl="cd ~/Downloads" # go to download folder

alias cddoc="cd ~/Documents" # go to download folder

alias cdtmp="cd ~/tmp" # go to tmp folder

##
## PROJECTS
##

alias nvgv="nvim ~/Documents/dev/projects/Gameverse" # Open gamverse projects in nvim

alias lvgv="lvim ~/Documents/dev/projects/Gameverse" # Open gamverse projects in lazyvim

##
## FISH
##

alias fconfig="lvim ~/.config/fish/config.fish" # Open fish config file in kate

alias rconfig="source ~/.config/fish/config.fish" # Reload fish config file

##
## GITHUB CLI
##

alias copilot="gh copilot"

##
## VPS
##

alias cvps="ssh ubuntu@51.75.123.189" # Connect to digital ocean droplet

alias crootvps="ssh root@51.75.123.189" # Connect to digital ocean droplet as root

##
## XAMPP/LAMP
##

alias cxamp="sudo /opt/lampp/manager-linux-x64.run" # Start xampp GUI client

alias xampphpini="sudo nano /opt/lampp/etc/php.ini" # Open the php.ini file for xampp

alias vhconf="sudo nano /opt/lampp/etc/extra/httpd-vhosts.conf" # Open Xampp vhost configuration file

##
## PYTHON
##

alias rvenv="source venv/bin/activate.fish" # Start python venv

alias dvenv="deactivate" # deactivate python venv

# Start and run python env
function svenv
    python3 -m venv venv
    source venv/bin/activate.fish
end

##
## NEOVIM
##

alias vi="NVIM_APPNAME=lazyvim /usr/local/bin/nvim"

alias lvim="NVIM_APPNAME=lazyvim /usr/local/bin/nvim"

alias astrovim="NVIM_APPNAME=astrovim nvim" # Open nvim using the astrovim config version

# alias lvim="NVIM_APPNAME=lazyvim nvim" # Open nvim using the lazy vim config version

alias lvconf="lvim ~/.config/lazyvim" # Open default lazyvim config in lazyvim

alias nvconf="nvim ~/.config/nvim" # Open default nvim config in nvim

##
## NGINX
##

alias rnginx="sudo systemctl restart nginx" # Reload nginx 

##
## DOCKER
##

alias rdock="docker compose up -d" # start docker 
 
alias builddock="docker compose up -d --build" # rebuild docker

alias sdock="docker compose down" # stop docker

alias srdock="docker compose down -v" # remove docker contains

alias bashdock="docker compose exec app bash" # access console inside container

alias migratedock="docker-compose exec app php artisan migrate" # run laravel db migration

alias logdock="docker compose exec app tail /var/www/storage/logs/laravel.log" # show log for app in docker

##
## LS
##

alias ls="lsd -t --reverse"

alias lss="lsd -l -t --reverse --blocks=name" # Execute custom ls

alias lsp="lsd --blocks=user,group,permission,name" # Execute custom ls

alias lsl="lsd -latr --blocks=date,user,group,permission,name" # Execute custom ls

##
## GENERAL
##

alias fkitty="lvim ~/.config/kitty/kitty.conf" # Open kitty terminal conf file

alias fwez="lvim ~/.config/wezterm/wezterm.lua" # Open wezterm terminal conf file

alias fghost="lvim ~/.config/ghostty/config" # Open ghostty terminal conf file

alias rghost="source ~/.config/ghostty/config" # Reload ghostty terminal conf file

alias phpini="sudo nano /etc/php/8.3/cli/php.ini" # Open the php.ini file used by system

alias composer="php /usr/local/bin/composer/composer.phar" # Execute composer commands

# Start gameverse project
function startgv
    # Start services
    sudo systemctl start nginx
    sudo systemctl start mysql

    # Open server directory in VS Code
    cd ~/Documents/GamesMatch/server
    code .

    # Open client directory in VS Code
    cd ~/Documents/GamesMatch/client
    code .

    # Start client development server
    npm run dev &

    # Open a new WezTerm tab for the server with nodemon
    wezterm cli spawn --cwd ~/Documents/GamesMatch/server -- nodemon app.js
end

##
## UTILS
##

alias fd="fdfind"

alias restart="exec $SHELL"

# Copy file content to clip board
function cpf --description 'Copy file content to clipboard'
    if test -z "$argv"
        echo "Usage: cpf <file>"
        return 1
    end

    set file $argv[1]

    if not test -r "$file"
        echo "Error: Cannot read '$file'"
        return 1
    end

    cat "$file" | fish_clipboard_copy
end

# Execute nano with root perm
function rnano
    sudo nano $argv
end

# Create a new dir and go in it
function mkcd
    if test (count $argv) -eq 1
        sudo mkdir -p $argv[1]
        and cd $argv[1]
    else
        echo "Usage: mkcd <directory>"
    end
end

# pnpm
set -gx PNPM_HOME "/home/nino/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Set up kwallet to remember ssh keys
set -x SSH_ASKPASS /usr/bin/ksshaskpass
set -x SSH_ASKPASS_REQUIRE prefer
