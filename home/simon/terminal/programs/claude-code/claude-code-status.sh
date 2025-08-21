#!/usr/bin/env bash

# read claude-code input
input=$(cat)

# extract model name
model=$(echo "$input" | jq -r '.model.display_name')

# get current directory name
dir=$(basename "$(echo "$input" | jq -r '.workspace.current_dir')")

# get kubernetes context (handle errors gracefully)
k8s_context=""
if command -v kubectl >/dev/null 2>&1; then
  k8s_context=$(kubectl config current-context 2>/dev/null || echo "none")
else
  k8s_context="none"
fi

# get git repo and branch (handle errors gracefully)
git_info=""
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
if [ -d "$current_dir/.git" ]; then
  cd "$current_dir" || exit 1
  repo=$(basename "$(git remote get-url origin 2>/dev/null | sed 's/.*\///' | sed 's/\.git$//')" 2>/dev/null || echo "unknown")
  branch=$(git branch --show-current 2>/dev/null || echo "unknown")
  git_info="$repo:$branch"
else
  git_info="no-repo"
fi

# define colors
ORANGE='\033[38;5;208m' # claude orange/brownish
GREEN='\033[32m'
BLUE='\033[34m'
MAGENTA='\033[35m'
RESET='\033[0m'

# output formatted status with colors
echo -e "${ORANGE}󰧑 [${model}]${RESET} | ${GREEN} ${dir}${RESET} | ${BLUE}󱃾 ${k8s_context}${RESET} | ${MAGENTA}󰊢 ${git_info}${RESET}"
