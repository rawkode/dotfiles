function __autols_hook --description "Auto ls" --on-event fish_prompt
  if test "$__autols_last" != (pwd); or test "$_empty_command" = yes;
    clear; ls;
    # Show git information, and if it's not a git repo, throw error
    # into /dev/null. Simples
    git status 2>/dev/null
  end
  set  -g __autols_last (pwd)
end