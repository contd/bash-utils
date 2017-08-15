#!/usr/bin/env bash

wget -A zone --user-agent=Mozilla -r -l1 http://www.ipdeny.com/ipblocks/data/countries/

if [ ! -d zones ];then
  mkdir zones
fi

mv www.ipdeny.com/ipblocks/data/countries/*.zone zones/
rm -rf www.ipdeny.com/

exit 0
