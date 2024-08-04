#!/usr/bin/expect

set timeout 180

   spawn "./as-provider"
   expect "*?no]:"
   send "yes\r"
   expect "*?)"
   send "\r"
   expect "*?wallet):"
   send "0x519a6034be17f1bd810bd8a4a48ada2b4dec0e9e\r"
   send "\r"

   expect eof         ;# wait for the connection to close
