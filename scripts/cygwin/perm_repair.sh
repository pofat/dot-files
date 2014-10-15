#!/bin/sh

find . -type d -perm -o=w -print0 | xargs -0 chmod -c o-w
