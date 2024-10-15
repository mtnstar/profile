#!/bin/bash

# Get the current monitor from the active workspace
current_monitor=$(hyprctl activeworkspace | awk '{print $5}')

# Get the list of monitor names
monitors=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Convert the monitor list into an array
monitors_array=($monitors)

# Find the index of the current monitor
for i in "${!monitors_array[@]}"; do
    if [[ "${monitors_array[$i]}" == "$current_monitor" ]]; then
        current_index=$i
        break
    fi
done

# Get the next monitor in the array (cycling)
next_index=$(( (current_index + 1) % ${#monitors_array[@]} ))
next_monitor=${monitors_array[$next_index]}

# Move the current workspace to the next monitor
hyprctl dispatch movecurrentworkspacetomonitor "$next_monitor"
