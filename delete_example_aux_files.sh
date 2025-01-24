#!/bin/bash

# Endungen, die gelöscht werden sollen
extensions=("aux" "bbl" "bcf" "blg" "idx" "ilg" "ind" "log" "nav" "out" "pdf" "run.xml" "snm" "synctex.gz" "toc")

# Durchlaufe alle Dateien im aktuellen Verzeichnis
for ext in "${extensions[@]}"; do
  # Suche nach Dateien, die mit "example" beginnen und die jeweilige Endung haben
  for file in example*.$ext; do
    # Prüfen, ob die Datei existiert (um Fehler zu vermeiden, falls keine Dateien gefunden wurden)
    if [ -e "$file" ]; then
      echo "Lösche Datei: $file"
      rm "$file"
    fi
  done
done

