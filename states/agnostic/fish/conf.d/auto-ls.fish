function __autols_hook --description "Auto ls" --on-event fish_prompt
  if test "$__autols_last" != (pwd); or test "$_empty_command" = yes;
    clear

    # Show Git status if we're inside of a git repository
    git -C . rev-parse ^/dev/null
    if test $status -eq 0
      git status; echo
    end

    echo -n "pwd: "; pwd; echo; ls; echo;
  end
  set  -g __autols_last (pwd)
end
