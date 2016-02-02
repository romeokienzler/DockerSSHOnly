#!/bin/bash
/usr/sbin/sshd
while (true); do sleep 1; echo test > /dev/null; done
