#!/bin/sh
rsync -avz --exclude ".git" --delete --progress . core@104.131.98.133:www
