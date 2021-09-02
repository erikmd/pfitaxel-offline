#!/usr/bin/env bash

cat > data.json <<EOF
{
    "project_name": "${project_name:-PFITAXEL}",
    "project_status": "${project_status:-hors ligne}",
    "project_admin_url": "${project_admin_url:-https://erik.martin-dorel.org}"
}
EOF

set -x

( cd templates &&
  find . -name "*.mustache" -exec bash -c 'chevron -d ../data.json "$1" > ../www/"${1%.mustache}"' bash '{}' \;
)

exec python3 -m http.server --directory www 8080
