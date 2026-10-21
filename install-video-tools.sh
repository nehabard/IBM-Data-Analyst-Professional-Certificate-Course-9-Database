#!/usr/bin/env bash
# Installs the three video tools: FFmpeg (cut/mix video), HyperFrames (captions
# and graphics), and yt-dlp (download Reels/videos).
# Supports macOS (Homebrew) and Debian/Ubuntu (apt). Requires Node.js 22+ for HyperFrames.
set -euo pipefail

if [[ "$(uname)" == "Darwin" ]]; then
  command -v brew >/dev/null || { echo "Install Homebrew first: https://brew.sh"; exit 1; }
  brew install ffmpeg yt-dlp node
else
  sudo apt-get update
  sudo apt-get install -y ffmpeg python3-pip
  python3 -m pip install --user -U yt-dlp || pipx install yt-dlp
fi

npm install -g hyperframes

echo
ffmpeg -version | head -1
echo "yt-dlp $(yt-dlp --version)"
echo "hyperframes $(hyperframes --version)"
