# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jgpaiva/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby emacs docker docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export ALIEN_SECTIONS_LEFT=(
  newline
  exit
  time
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  newline
  ssh
  venv
  prompt
)
export ALIEN_SECTION_TIME_FORMAT=%H:%M:%S
export ALIEN_SECTION_USER_HOST=1
export ALIEN_USE_NERD_FONT=1

source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen theme eendroroy/alien alien
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

cd ~

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

ALIEN_PROMPT_FG=130
ALIEN_SECTION_EXIT_FG=0
ALIEN_SECTION_EXIT_BG=10
ALIEN_SECTION_EXIT_BG_ERROR=202
ALIEN_SECTION_TIME_FG=255
ALIEN_SECTION_TIME_BG=238
ALIEN_SECTION_USER_FG=255
ALIEN_SECTION_USER_BG=240
ALIEN_SECTION_PATH_FG=255
ALIEN_SECTION_PATH_BG=239
ALIEN_SECTION_VCS_BRANCH_FG=10
ALIEN_SECTION_VCS_BRANCH_BG=238
ALIEN_SECTION_VCS_STATUS_FG=10
ALIEN_SECTION_VCS_STATUS_BG=238
ALIEN_SECTION_VCS_DIRTY_FG=10
ALIEN_SECTION_VCS_DIRTY_BG=238
ALIEN_SECTION_SSH_FG=238
ALIEN_SECTION_VENV_FG=238
ALIEN_GIT_TRACKED_COLOR=193
ALIEN_GIT_UN_TRACKED_COLOR=10
ALIEN_SECTION_VERSION_BG=237
ALIEN_PYTHON_COLOR=40
ALIEN_RUBY_COLOR=196
ALIEN_JAVA_COLOR=178
ALIEN_GO_COLOR=81
ALIEN_ELIXIR_COLOR=99
ALIEN_CRYSTAL_COLOR=8
ALIEN_NODE_COLOR=41
ALIEN_PHP_COLOR=57
