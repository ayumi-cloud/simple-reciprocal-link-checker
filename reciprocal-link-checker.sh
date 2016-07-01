#!/bin/bash

# The domain to check for
my_domain=example.com

# List of URLs where the domain should be found, one per line
link_urls=(
    http://www.example.net
    http://www.example.org
)

# A valid User-Agent string, because the default cURL User-Agent is sometimes blocked
user_agent="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"

# Keep a tally of any missing links
missing_links=0

# Loop over the URLs in the array
for page in "${link_urls[@]}"
do
    # cURL the page and grep the output to count how many times the URL appears
    matches=$(curl -A "$user_agent" -s $page | grep -c $my_domain)

    # If the URL does not appear in the page then show a message and increment the counter
    if [ $matches -lt 1 ]
        then
            echo "Link not found at $page"
            missing_links=$(($missing_links + 1))
    fi
done

# How many missing links did we find?
if [ $missing_links -gt 0 ]
    then
        echo "==="
        echo "Found $missing_links missing link(s)"
        echo "==="
else
    echo "No missing links. Great success!"
fi
