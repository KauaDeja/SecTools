#!/bin/bash
lynx --dump "https://google.com/search?num=200&q=site:"$1"+ext:"$2"" |  grep "$2" | cut -d "=" -f2 | egrep -v "site|google"


