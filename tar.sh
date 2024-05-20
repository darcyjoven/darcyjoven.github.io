#!/bin/bash

echo '压缩...'
tar -cJf ./blog.tar.xz --exclude-from='.tar.ignore' ./