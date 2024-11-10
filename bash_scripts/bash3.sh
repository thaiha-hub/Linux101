

#!/usr/bin/env bash

# Fråga användare om ett namn
read -p "Ange ett namn: " name

#Skapa en fil med  detta namn
touch  ${name}.txt

echo "Filen ${name}.txt har skapats"
