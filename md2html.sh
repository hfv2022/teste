cat > md2html.sh << 'EOF'
#!/bin/bash

TEMPLATE="template.html"

convert_md() {
  local input="$1"
  local output="${input%.md}.html"
  pandoc "$input" -s --template="$TEMPLATE" -o "$output"
  echo "✅ Convertido: $input -> $output"
}

if [ $# -eq 0 ]; then
  for f in *.md; do
    [ -e "$f" ] && convert_md "$f"
  done
else
  convert_md "$1"
fi
EOF
