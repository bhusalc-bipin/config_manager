#!/usr/bin/env zsh

# directories to ignore while using find
toIgnore=(-name .git -prune -false -o -name node_modules -prune -false -o)

# fuzzy find the directories within specified paths, excluding those listed in `toIgnore`
dir_path=$(find ~/config_manager_v2 ~/pukka_dir/projects ~/pukka_dir/sprint_learning "${toIgnore[@]}" -type d | fzf)

# exit the script if no directory was selected
[[ -z $dir_path ]] && exit 0

# get the session name by taking the base name of the selected directory path
# and replacing any dots(.) with underscores (_)
session_name=$(basename "$dir_path" | tr . _)

# check if a tmux session with the given session name already exists
if tmux has-session -t $session_name 2> /dev/null; then
	# if currently inside another tmux session then switch else attach
	if [[ $TMUX ]]; then
		tmux switch-client -t $session_name
	else
		tmux attach-session -t $session_name
	fi
else
	if [[ $TMUX ]]; then
		# need to create a new detached session, specified by -d flag, if already inside another tmux session
		# -c flag specifies which directory should the new tmux session be opened in
		tmux new-session -ds $session_name -c "$dir_path"
		tmux switch-client -t $session_name
	else
		tmux new-session -s $session_name -c "$dir_path"
	fi
fi
