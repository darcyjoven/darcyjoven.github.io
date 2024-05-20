#!/bin/bash

echo '开始同步...'
./sync.sh

echo '开始推送到github...'
./push.sh