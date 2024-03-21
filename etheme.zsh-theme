# Load utils
autoload -U add-zsh-hook

# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Functional prompt formatting
et_heme_preexec() {
  timer=$(($(print -P %D{%s%6.})/1000))
}

add-zsh-hook preexec et_heme_preexec

precmd() {
  if [ $timer ]; then
    now=$(($(print -P %D{%s%6.})/1000))
    elapsed=$(($now-$timer))

    ELAPSED_TIME="%F{cyan}${elapsed}ms %{$reset_color%}"
    unset timer
  fi
}

user_info() {
  echo "%{$GREEN_BOLD%}%n@%m%{$WHITE%}:"
}

dir_paths() {
  echo "%{$YELLOW%}%~%u"
}

cmd_time() {
  echo "[%T] "
}

# Prompt format
PROMPT='
$(cmd_time)$(user_info)$(dir_paths)$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
%{$BLUE%}>%{$RESET_COLOR%} '

RPROMPT='%{$GREEN_BOLD%}$(git_current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}'
