# simple-reciprocal-link-checker

Shell script to check whether your link exists at URLs that you expect it to, such as reciprocal link exchanges.

## Overview

Most websites have built up a number of backlinks over time, with many coming from reciprocal link exchanges. A website owner needs to periodically check that his link still exists at the URL where it was originally placed. This would be a long and tedious procss if performed manually for a large number of URLs. This is a very simple shell script that will check that your domain is present in the content of a list of URLs, and report any missing links.

## Requirements

* cURL

## Installation

Download a copy of the script and edit the top two parameters, `my_domain` and `link_urls`. These should be the domain that you want to find, and an array of link URLs that the domain should be found at.

## Usage

Simply run `./reciprocal-link-checker.sh` from the CLI.

## Limitations

The script works by using cURL to get the content of the link URLs specified. It then uses `grep` to search for your domain in the content, and counts the occurences.

* It does not verify that the domain exists
* It does not verify that the page returned an HTTP 200 status
* It does not verify that your domain was found inside an HTML anchor tag (a link)

If the script indicates that your link was missing then you should investigate manually. It is possible that the page or the domain was no longer valid. Alternatively your link ma have been moved to another location by the website owner, in which case you should try to locate it and update your records for next time.