
#!/usr/bin/env bash

read -p "Ditt namn: " name
read -p "Din ålder: " age
read -p "Ditt ort: " location

echo "Hej $name, du är $age år och bor i $location."

echo "Exit code: $?"
