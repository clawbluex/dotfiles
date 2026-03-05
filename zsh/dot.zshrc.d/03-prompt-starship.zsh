[[ "$ZSH_PROMPT" == 'starship' ]] || return 0

presets=(catppuccin-powerline jetpack p10k pastel-powerline tokyo-night)
ZSH_STARSHIP_PRESET=${ZSH_STARSHIP_PRESET:-default}
if [[ "$ZSH_STARSHIP_PRESET" == 'random' ]]; then
	ZSH_STARSHIP_PRESET="${presets[$(( $RANDOM % ${#presets[@]} + 1 ))]}"
fi
if [ -f "$HOME/.config/starship/$ZSH_STARSHIP_PRESET.toml" ]; then
	export STARSHIP_CONFIG="$HOME/.config/starship/$ZSH_STARSHIP_PRESET.toml"
fi

[[ $commands[starship] ]] && eval "$(starship init zsh)" || echo "starship not installed"
