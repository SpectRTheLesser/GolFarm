#!/bin/bash

amountpaid=`sqlite3 /home/spectr/.local/share/yagna/payment.db <<END
select sum(total_amount_paid) from pay_agreement;
END
`

amountdue=`sqlite3 /home/spectr/.local/share/yagna/payment.db <<END
select sum(total_amount_due) from pay_agreement;
END
`

rm -f /var/lib/node_exporter/golem.prom

#sqlite3  ~/.local/share/yagna/payment.db "select 'Amount Due  ' || sum(total_amount_due)  from pay_agreement;"


echo "# HELP golem_amount_paid" > /var/lib/node_exporter/golem.tmp
echo "# TYPE golem_amount_paid  counter" >> /var/lib/node_exporter/golem.tmp
echo "golem_amount_paid $amountpaid" >> /var/lib/node_exporter/golem.tmp
echo
echo "# HELP golem_amount_due" >> /var/lib/node_exporter/golem.tmp
echo "# TYPE golem_amount_due counter" >> /var/lib/node_exporter/golem.tmp
echo "golem_amount_due $amountdue" >> /var/lib/node_exporter/golem.tmp

sleep 4

mv /var/lib/node_exporter/golem.tmp /var/lib/node_exporter/golem.prom
