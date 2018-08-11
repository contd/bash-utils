#!/usr/bin/env bash

#
# enc_pad_cmds.sh
# Copyright (C) 2017 jason <jason@jasonlaptop>
#
# Distributed under terms of the MIT license.
#

ansi --green --newline "To make a key file to use for encrypting and decrypting files:"
ansi --yellow --newline "pwmake 1024 | gpg2 -c --armor --cipher-algo AES256 > ~/.encryptpad/foo.key"
echo ""

ansi --green --newline "To encrypt a file using the key (file to encrypt is test3.txt):"
ansi --yellow --newline "gpg2 --decrypt ~/.encryptpad/foo.key \\"
ansi --yellow --newline "  | gpg2 --passphrase-fd 0 --batch -c --cipher-algo AES256 \\"
ansi --yellow --newline "  -o /tmp/test3.txt.gpg /tmp/test3.txt"
echo ""

ansi --green --newline "To decrypt a file using the key (file to decrypt is test3.txt.gpg):"
ansi --yellow --newline "gpg2 --decrypt ~/.encryptpad/foo.key \\"
ansi --yellow --newline "  | gpg2 --passphrase-fd 0 --batch --decrypt \\"
ansi --yellow --newline "  -o /tmp/test4.txt /tmp/test3.txt.gpg"
echo ""

ansi --blue --newline "That's all folks!"

exit 0
