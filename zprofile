
eval "$(/opt/homebrew/bin/brew shellenv)"

# eval "$(/opt/homebrew/bin/brew shellenv)"

# Display Message of the Day (MOTD)
if [[ -o interactive ]]; then  # Only output messages in interactive sessions
    # Find the last login time in seconds since epoch
    LAST_LOGIN_EPOCH=$(last -2 $USER | awk 'NR==2 {print $4, $5, $6, $7}' | xargs -I{} date -j -f "%b %d %H:%M" "{}" "+%s" 2>/dev/null)
    # Get current time in seconds since epoch
    CURRENT_EPOCH=$(date +%s)
    # Calculate the difference
    SECONDS_ELAPSED=$((CURRENT_EPOCH - LAST_LOGIN_EPOCH))
    HOURS=$((SECONDS_ELAPSED / 3600))
    # Show message of the day if more than 8 hours have passed since last login
    if [[ $HOURS -ge 8 ]]; then
        ~/.motd.zsh
    fi 
fi
