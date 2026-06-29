# Clear fish greeting
set fish_greeting ""

# View config aliases

alias vfishconf='nvim ~/.config/fish/config.fish'
alias vvfishconf='vim ~/.config/fish/config.fish'

alias vghosttyconf='nvim ~/.config/ghostty/config'
alias vvghosttyconf='vim ~/.config/ghostty/config'

alias vhyprlandconf='nvim ~/.config/hypr/hyprland.conf'
alias vvhyprlandconf='vim ~/.config/hypr/hyprland.conf'

# Coding directory aliases

# assembly
alias gtasmpr='cd ~/Ardavan/all_things/ASM/asm_projects/'
alias gtasm='cd ~/Ardavan/all_things/ASM/'

# C++
alias gtcpppr='cd ~/Ardavan/all_things/C++/c++_projects'
alias gtcpp='cd ~/Ardavan/all_things/C++/'

# C
alias gtcpr='cd ~/Ardavan/all_things/C/c_projects/'
alias gtc='cd ~/Ardavan/all_things/C'

# D
alias gtdpr='cd ~/Ardavan/all_things/D/d_projects/'
alias gtd='cd ~/Ardavan/all_things/D/'

# Java
alias gtjvpr='cd ~/Ardavan/all_things/Java/java_projects'
alias gtjv='cd ~/Ardavan/all_things/Java/'

# Lua
alias gtluapr='cd ~/Ardavan/all_things/lua/lua_projects'
alias gtlua='cd ~/Ardavan/all_things/lua/'

# GO lang
alias gtgopr='cd ~/Ardavan/all_things/Go/go_projects/'
alias gtgo='cd ~/Ardavan/all_things/Go/'

# Rust
alias gtrspr='cd ~/Ardavan/all_things/rust/rust_projects'
alias gtrs='cd ~/Ardavan/all_things/rust/'

# Python (shit btw)
alias gtpypr='cd ~/Ardavan/all_things/Python/python_projects/'
alias gtpy='cd ~/Ardavan/all_things/Python/'

# Javascript (worse than shit)
alias gtjspr='cd ~/Ardavan/all_things/Javascript/javascript_projects/'
alias gtjs='cd ~/Ardavan/all_things/Javascript/'

# HolyC
alias gthcpr='cd ~/Ardavan/all_things/HolyC/holyc_projects/'
alias gthc='cd ~/Ardavan/all_things/HolyC/'

# Arduino mega 2560 wifi clone
alias gtavrmwpr='cd ~/Ardavan/all_things/Arduino_ATMega_2560_wifi_prs/projects'
alias gtavrmw='cd ~/Ardavan/all_things/Arduino_ATMega_2560_wifi_prs/'

# Directory aliases

alias gtardavan='cd ~/Ardavan'

alias gtallthings='cd ~/Ardavan/all_things/'

alias gtdesktop='cd ~/Desktop/'

alias gtdownloads='cd ~/Downloads/'

alias gtconf='cd ~/.config/'

# Command aliases

alias lolfetch='neofetch | lolcat'

alias lolffetch='fastfetch | lolcat'

alias l='ls -CFA'

alias ll='ls -CFAl'

# App aliases

# Desperate sudo aliases

alias bitch='sudo'

alias please='sudo'

alias fucking='sudo'

alias tree-sitter='tree-sitter-cli'

# Prompt engines

# Fish: 

# Tide:

# LinuxBrew

set -gx PATH /home/linuxbrew/.linuxbrew/bin /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ardavancena/.local/share/nvim/mason/bin:$HOME/.local/share/uv/tools/hyprmod/bin/"
starship init fish | source

set EDITOR nvim
set -gx QT_QPA_PLATFORMTHEME qt5ct

# Created by `pipx` on 2026-06-28 13:28:42
set PATH $PATH /home/ardavancena/.local/bin
