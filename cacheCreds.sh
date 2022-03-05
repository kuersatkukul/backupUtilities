#!/usr/bin/bash
# prevents asking for credentials for 1 hour (60*60)
git config --global credential.helper 'cache --timeout=3600'
