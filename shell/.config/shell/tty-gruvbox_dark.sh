#!/bin/sh

if [ "$TERM" = "linux" ]; then
PREREQ=""
prereqs()
{
     echo "$PREREQ"
}

case $1 in
prereqs)
     prereqs
     exit 0
     ;;
esac

# Gruvbox Dark
echo "40,204,152,215,69,177,104,168,146,251,184,250,131,211,142,235
40,36,151,153,133,98,157,153,131,73,187,189,165,134,192,219
40,29,26,33,136,134,106,132,116,52,38,47,152,155,124,178" | setvtrgb -

clear
fi
