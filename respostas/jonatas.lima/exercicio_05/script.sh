#!/bin/bash

TCP_FILE=tcp.txt
UDP_FILE=udp.txt
lsof | grep "TCP " > $TCP_FILE
lsof | grep "UDP " > $UDP_FILE

TOTAL_TCP_LISTEN=$(grep -c "LISTEN" $TCP_FILE)
TOTAL_TCP_ESTABLISHED=$(grep -c "ESTABLISHED" $TCP_FILE)
TOTAL_TCP_SYN_SENT=$(grep -c "SYN_SENT" $TCP_FILE)
TOTAL_TCP_CLOSE_WAIT=$(grep -c "CLOSE_WAIT" $TCP_FILE)

echo "====== TCP ====="
echo

echo "LISTEN: $TOTAL_TCP_LISTEN"
echo "ESTABLISHED: $TOTAL_TCP_ESTABLISHED"
echo "SYN_SENT: $TOTAL_TCP_SYN_SENT"
echo "CLOSE_WAIT: $TOTAL_TCP_CLOSED_WAIT"

rm $TCP_FILE $UDP_FILE
