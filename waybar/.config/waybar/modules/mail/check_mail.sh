#!/bin/sh
# Simple script that gathers new mail from locl directories.
# This works perfectly if you pull down emails from imap accounts.

output=$(du -a ~/.local/share/mail/*/INBOX/new/* 2>/dev/null | wc -l)

if [ "$output" = "0" ]; then
  echo ""
    else echo "$output"
fi
