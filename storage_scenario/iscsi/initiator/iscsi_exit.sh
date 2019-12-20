#!/bin/sh

iscsiadm -m node --logout
iscsiadm -m node -o delete
