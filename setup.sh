#!/bin/sh

SCRIPT_DIR=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd -P)

printf "Enter the (browser tab) title of the website: " >&2
read -r title

printf "Enter the URL you'd like to redirect to: " >&2
read -r url

if echo ";" | grep -q -e "$title" -e "$url"; then
  echo "Error: The title and URL cannot contain semicolons."
  exit 1
fi

cp "$SCRIPT_DIR/templates/index.html" "$SCRIPT_DIR/index.html"

sed -i "s;{{ title }};$title;g" "$SCRIPT_DIR/index.html"
sed -i "s;{{ url }};$url;g" "$SCRIPT_DIR/index.html"

echo "Setup complete. Open the director site to see the result!"
