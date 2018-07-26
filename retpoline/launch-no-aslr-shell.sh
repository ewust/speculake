#!/bin/bash

echo ''
echo 'Launching a new shell with NO ASLR'
echo '(all children processes will have ASLR disabled)'
echo ''
PS1="NOASLR $P1"
setarch `uname -m` --addr-no-randomize /bin/bash

echo ''
echo 'Exiting shell with NO ASLR'
./test-aslr.sh
if [ $? -eq 1 ]; then
    echo '============'
    echo '!!!!!WARNING: ASLR STILL DISABLED!!!!!'
    echo '============'
fi

echo ''


