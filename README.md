# fth-latex
Dieses Repository soll LaTeX-Vorlagen für die Arbeit an der [Freien Theologischen Hochschule (FTH) Gießen](https://fthgiessen.de) bereitstellen, insbesondere die Leitlinien für schrifliche Arbeiten an der FTH umsetzen.

## Installation
### UNIX
```
./install.sh
```
sollte LaTeX-Pakete ins lokale `TEXMFHOME` kopieren. Das ist ein Verzeichnis, in dem ein Nutzer eigene TeX-Pakete installieren kann, sodass sie systemweit (für diesen Nutzer) verfügbar sind.

### Windows
Einfach googeln, wo auf Windows das Äquivalent von TEXMFHOME liegt und die Pakete unter `fth-lsa` dorthin kopieren, dann sollten sie auch systemweit verfügbar sein.

### Oder
Wenn das mit `TEXMFHOME` nicht funktioniert, kann man die `.sty`-Dateien auch einfach im lokalen Verzeichnis ablegen und trotzdem wie gewohnt mit `usepackage{fth-lsa}` importieren.

## Abhängigkeiten
Die Pakete `fth-lsa` und `fth-bib` sollten mit einer Standard-LaTeX-2e-Installation problemlos funktionieren.

Das Paket `fth-nt-utils` benötigt den Font Quivira für textkritische Symbole. Er kann unter http://www.quivira-font.com bezogen werden und muss ganz normal auf dem System installiert sein. Alternativ (bspw. auf Overleaf) kann die OTF-Datei auch im lokalen Verzeichnis abgelegt werden.

## Pakete und Verwendung
Das Repository stellt verschiedene Pakete zur Verfügung. Es sollten nur diejenigen, die wirklich benötigt werden, verwendet werden:
- `fth-lsa` setzt die Formattierungs-Richtlinien aus den Leitlinien für schriftliche Arbeiten an der FTH (ohne Zitate) um.
- `fth-bib` setzt die Richtlinien zur Formattierung von Zitaten und Literaturverzeichnis um.
- `fth-nt-utils` stellt einige hilfreiche Befehle zur Arbeit mit neutestamentlichen Texten zur Verfügung, z.B. für Textkritik oder synoptische Vergleiche.

Ausführliche Beispiele zur Verwendung aller Pakete finden sich in `example.tex` und `example_thesis.tex` (da die Vorgaben für Abschlussarbeiten etwas anders sind.)

## Kompilierung
Ich verwende zur Kompilierung `latexmk` mit folgenden Einstellungen
```
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex example.tex
```
wobei die meisten der Argumente von meiner IDE generiert wurden und einige vermutlich nicht zwingend nötig sind. Entscheidend ist auf jeden fall `-xelatex`. Statt `latexmk` funktioniert vermutlich auch die Abfolge (ich habe es aber nicht getestet)
```
xelatex
biblatex
xelatex
xelatex
```

## Was das Paket (noch) nicht kann
Hebräisch. Griechisch kann man ganz einfach als UTF-8 schreiben und sollte korrekt angezeigt werden. Hebräisch geht noch nicht. Dafür muss ich wohl von `babel` auf `polyglossia` umstellen, damit kenne ich mich aber noch nicht aus.

## Anmerkung zu Bibelstellen
Die FTH-Leitlinien fordern zwar eine Fomrattierung entsprechend den Loccumer Richtlinien, die in Abschnitt 6.1 der Leitlinien angegebenen Abkürzungen entsprechen allerdings gar nicht den Loccumer Richtlinien (das Buch 1.Mose müsste z.B. Gen abgekürzt werden, nicht 1Mose). Bei Benutzung von \bibleverse formattiert das Paket fth-lsa Bibelstellen korrekt entsprechend den echten Loccumer Richtlinien, nicht jedoch wie in 6.1 der FTH-Leitlinien. Wem das zu riskant ist, kann die Option `tre` verwenden, die stattdessen entsprechend der TRE formattiert, was die FTH-Leitlinien ebenfalls erlauben.

## Mitwirkung
Wenn du an diesem Projekt mitarbeiten möchtest, kannst du das gerne tun. Kontaktiere mich, dann gebe ich dir Zugriff. Bitte immer auf Branches mit sinnvollen Namen arbeiten und dann einen Pull Request an mich stellen.

## Dank
Diese Pakete, insbesondere die BibLaTeX-Einstellungen, wurden auf Grundlage der Bachelorarbeit von [@pico40](https://github.com/pico40) erstellt, danke fürs Bereitstellen! Außerdem habe ich mich an den LaTeX-Vorlagen für die HTW Dresden von [@GenericFJS](https://github.com/genericFJS) orientiert, besonders bei der Titelseite.
