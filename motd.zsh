#!/usr/bin/env zsh

# Find the last login time in seconds since epoch
LAST_LOGIN_EPOCH=$(last -2 $USER | awk 'NR==2 {print $4, $5, $6, $7}' | xargs -I{} date -j -f "%b %d %H:%M" "{}" "+%s" 2>/dev/null)
# Get current time in seconds since epoch
CURRENT_EPOCH=$(date +%s)
# Calculate the difference
SECONDS_ELAPSED=$((CURRENT_EPOCH - LAST_LOGIN_EPOCH))
HOURS=$((SECONDS_ELAPSED / 3600))
# Show message of the day if more than 8 hours have passed since last login
if [[ $HOURS -ge 8 ]]; then
    RED=$(printf '\033[38;5;196m')
    ORANGE=$(printf '\033[38;5;202m')
    YELLOW=$(printf '\033[38;5;226m')
    GREEN=$(printf '\033[38;5;082m')
    TEAL=$(printf '\033[1;36m')
    BLUE=$(printf '\033[38;5;021m')
    PURPLE=$(printf '\033[38;5;093m')
    PINK=$(printf '\033[38;5;163m')
    RESET=$(printf '\033[0m')

    printf "\n"
    printf "%s Run the following commands to update your system: %s\n" "$ORANGE" "$RESET"
    printf "%s brew update %s            # update all package definitions %s\n" "$TEAL" "$PURPLE" "$RESET"
    printf "%s brew outdated %s          # list outdated packages %s\n" "$TEAL" "$PURPLE" "$RESET"
    printf "%s brew upgrade %s           # upgrade everything %s\n" "$TEAL" "$PURPLE" "$RESET"
    printf "%s brew upgrade <formula> %s # upgrade specific formula %s\n" "$TEAL" "$PURPLE" "$RESET"
    printf "\n"
fi 
