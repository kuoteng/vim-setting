#!bin/bash

cp _vimrc $HOME/.vimrc
vim << EOF
:PlugUpgrade
:PlugInstall
:PlugUpdate
:quit
EOF

