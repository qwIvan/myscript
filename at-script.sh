grep -RPoh --exclude-dir='.git' --exclude-dir='node_modules' '@\w\s' 2> /dev/null | sort | uniq -c | sort -n
