#!/bin/bash

set -e

CONFIG_FILE=".vscode/c_cpp_properties.json"
FOLDER_NAME="$1"

mkdir -p .vscode

if [[ -z "$FOLDER_NAME" ]]; then
  INCLUDE_PATH='["${workspaceFolder}/**", "/usr/include", "/usr/local/include"]'
else
  INCLUDE_PATH="[\\"\\\${workspaceFolder}/$FOLDER_NAME/**\\", \\"/usr/include\\", \\"/usr/local/include\\"]"
fi

cat > "$CONFIG_FILE" <<EOF
{
  "version": 4,
  "configurations": [
    {
      "name": "Linux",
      "includePath": $INCLUDE_PATH,
      "defines": [],
      "compilerPath": "/usr/bin/gcc",
      "cStandard": "gnu17",
      "cppStandard": "gnu++20",
      "intelliSenseMode": "linux-gcc-x64"
    }
  ]
}
EOF

echo "Updated $CONFIG_FILE with includePath: $INCLUDE_PATH"