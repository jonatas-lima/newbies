#!/bin/bash

PERMISSOES=$(ls -l | sed -e 1d | cut -c 8-10)
echo $PERMISSOES | egrep '(-w-|rw-|-wx|rwx)' && echo "Diretorio inseguro" || echo "Diretorio seguro"
