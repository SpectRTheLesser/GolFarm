#!/usr/bin/expect -f

set timeout -1
spawn bash -c "./as-provider.sh"
match_max 100000

expect -exact "\r
By installing & running this software you declare that you have read, understood and hereby accept the disclaimer and\r
privacy warning found at https://handbook.golem.network/see-also/terms\r
\r
Do you accept the terms and conditions? \[yes/no\]: "
send -- "yes\r"
expect "Initial node setup\r"
expect "*Node name*: "
send -- "\r"
expect -exact "[?2004l\r
[?2004h\r[0KEthereum mainnet wallet address (default=Internal Golem wallet): \r[65C"
send -- "[200~0x519a6034be17f1bd810bd8a4a48ada2b4dec0e9e[201~"
expect -exact "\r[0KEthereum mainnet wallet address (default=Internal Golem wallet): 0x519a6034be17f1bd810bd8a4a48ada2b4dec0e9e\r[107C"
send -- "\r"
